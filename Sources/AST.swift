
protocol ASTNode {}

protocol ExpressionProtocol: ASTNode {
  func typeCheck(in context: Context) throws -> (MonoType, Substitution)
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
  let body: ExpressionProtocol

  func typeCheck(in context: Context) throws -> (MonoType, Substitution) {
    let newVariable = MonoType.variable()
    let newContext = Context(
      // contextID: context.contextID + 1,
      typeEnv: context.typeEnv.merging([parameter: .mono(newVariable)]) { _, new in new }
    )

    let (bodyType, bodySubstitution) = try body.typeCheck(in: newContext)

    return (
      bodySubstitution.apply(to: .functionApplication(.arrow, parameters: [newVariable, bodyType])),
      bodySubstitution
    )
  }
}
