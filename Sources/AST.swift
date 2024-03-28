
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
    let (functionType, functionSubstitution) = try function.typeCheck(in: context)
    let (argumentType, argumentSubstitution) = try argument.typeCheck(in: context)

    let resultType = MonoType.variable()
    let substitution = try functionType.unify(
      with: .functionApplication(.arrow, parameters: [argumentType, resultType]))

    return (
      substitution.apply(to: resultType),
      substitution
        .combine(with: functionSubstitution)
        .combine(with: argumentSubstitution)
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
      .functionApplication(.arrow, parameters: [newVariable, bodyType]),
      bodySubstitution
    )
  }
}
