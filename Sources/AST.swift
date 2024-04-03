protocol ASTNode {}

protocol ExpressionProtocol: ASTNode {
  func typeCheck(in context: Context) throws -> (MonoType, Substitution)
}

protocol TypeExpression: ASTNode {
  func getType() throws -> MonoType
}

struct Program: ASTNode {
  let expressions: [ASTNode]

  func typeCheck(in context: Context) throws -> (MonoType, Substitution) {

    var type = MonoType.variable()
    var substitution = Substitution(raw: [:])

    for expr in expressions {
      if let expr = expr as? ExpressionProtocol {
        (type, substitution) = try expr.typeCheck(in: context)
      } else {
        fatalError("not implemented")
      }
    }

    return (type, substitution)
  }
}

struct IntegerLiteral: ExpressionProtocol {
  let value: Int

  func typeCheck(in context: Context) throws -> (MonoType, Substitution) {
    return (intTy, .empty)
  }
}

struct BooleanLiteral: ExpressionProtocol {
  let value: Bool

  func typeCheck(in context: Context) throws -> (MonoType, Substitution) {
    return (boolTy, .empty)
  }
}

struct StringLiteral: ExpressionProtocol {
  let value: String

  func typeCheck(in context: Context) throws -> (MonoType, Substitution) {
    return (stringTy, .empty)
  }
}

struct VariableExpression: ExpressionProtocol {
  let name: String

  func typeCheck(in context: Context) throws -> (MonoType, Substitution) {
    guard let type = context.typeEnv[name] else {
      throw TypeCheckError.unboundVariable
    }
    return (type.instantiate(), .empty)
  }
}

struct ApplicationExpression: ExpressionProtocol {
  let function: ExpressionProtocol
  let argument: ExpressionProtocol

  func typeCheck(in context: Context) throws -> (MonoType, Substitution) {
    let (funcType, funcSubstitution) = try function.typeCheck(in: context)
    let (argType, argSubstitution) = try argument.typeCheck(in: funcSubstitution.apply(to: context))

    let resultType = MonoType.variable()
    let substitution = try argSubstitution.apply(to: funcType).unify(
      with: .functionApplication(.arrow, parameters: [argType, resultType]))

    return (
      substitution.apply(to: resultType),
      substitution
        .combine(with: argSubstitution)
        .combine(with: funcSubstitution)
    )
  }
}

struct AbstractionExpression: ExpressionProtocol {
  let parameter: String
  let typeHint: TypeExpression?
  let body: ExpressionProtocol

  func typeCheck(in context: Context) throws -> (MonoType, Substitution) {
    let paramType = try typeHint?.getType() ?? MonoType.variable()
    let newContext = context.merge(with: [parameter: .mono(paramType)])

    let (bodyType, bodySubstitution) = try body.typeCheck(in: newContext)

    return (
      .functionApplication(
        .arrow, parameters: [bodySubstitution.apply(to: paramType), bodyType]),
      bodySubstitution
    )
  }
}

struct LetExpression: ExpressionProtocol {
  // let name = expr in { body }
  let name: String
  let typeHint: TypeExpression?
  let expr: ExpressionProtocol
  let body: ExpressionProtocol

  func typeCheck(in context: Context) throws -> (MonoType, Substitution) {
    let (exprType, exprSubstitution) = try expr.typeCheck(in: context)
    let nameType: PolyType
    let substitution: Substitution

    if let hint = typeHint {
      let hintType = try hint.getType()
      substitution = try exprType.unify(with: hintType).combine(with: exprSubstitution)
      nameType = .mono(hintType)
    } else {
      substitution = exprSubstitution
      nameType = exprSubstitution.apply(to: context).generalize(exprType)
    }

    let newContext = substitution.apply(to: context).merge(with: [name: nameType])
    let (bodyType, bodySubstitution) = try body.typeCheck(in: newContext)

    return (bodyType, bodySubstitution.combine(with: substitution))
  }
}

struct TupleExpression: ExpressionProtocol {
  let elements: [ExpressionProtocol]

  func typeCheck(in context: Context) throws -> (MonoType, Substitution) {
    if elements.count == 0 {
      return (.functionApplication(.tuple(0), parameters: []), .empty)
    }
    var typeList = [MonoType]()
    var substitution = Substitution(raw: [:])

    for ele in elements {
      let checkRes = try ele.typeCheck(in: context)
      typeList.append(checkRes.0)
      substitution = checkRes.1.combine(with: substitution)
    }

    return (
      substitution.apply(to: .functionApplication(.tuple(elements.count), parameters: typeList)),
      substitution
    )
  }
}

struct Binding: ASTNode {
  let name: String
  let typeHint: TypeExpression?
  let expr: ExpressionProtocol
}

struct BindingList: ASTNode {
  let bindings: [Binding]
}

struct ConditionExpression: ExpressionProtocol {
  let condExpr: ExpressionProtocol
  let thenExpr: ExpressionProtocol
  let elseExpr: ExpressionProtocol

  func typeCheck(in context: Context) throws -> (MonoType, Substitution) {
    let (condType, condSubstitution) = try condExpr.typeCheck(in: context)
    var substitution = try condType.unify(with: boolTy)
    substitution = substitution.combine(with: condSubstitution)

    let (thenType, thenSubstitution) = try thenExpr.typeCheck(in: context)
    substitution = thenSubstitution.combine(with: substitution)
    let (elseType, elseSubstitution) = try elseExpr.typeCheck(in: context)
    substitution = elseSubstitution.combine(with: substitution)

    let unifySubstitution = try substitution.apply(to: thenType)
                                  .unify(with: substitution.apply(to: elseType))
    substitution = unifySubstitution.combine(with: substitution)
    
    return (
      unifySubstitution.apply(to: thenType),
      substitution
    )
  }
}

struct SumTypeExpression: TypeExpression {
  let lhs: TypeExpression
  let rhs: TypeExpression

  func getType() throws -> MonoType {
    fatalError("not implemented")
  }
}

struct ProductTypeExpression: TypeExpression {
  let members: [TypeExpression]

  func getType() throws -> MonoType {
    return .functionApplication(.tuple(members.count),
      parameters: try members.map { try $0.getType() })
  }
}

struct FunctionTypeExpression: TypeExpression {
  let arg: TypeExpression
  let ret: TypeExpression

  func getType() throws -> MonoType {
    return (try arg.getType()) => (try ret.getType())
  }
}

struct NamedTypeExpression: TypeExpression {
  let name: String

  func getType() throws -> MonoType {
    guard let type = namedTypeContext[name] else {
      throw TypeCheckError.undefinedType
    }
    return type
  }
  
}