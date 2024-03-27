struct TypeVariable: Identifiable, Hashable, Equatable, MonoTypeProtocol {
  let id: Int

  init() {
    self.id = Self.nextId
    Self.nextId += 1
  }

  static var nextId = 0

  var concreateType: MonoType { .variable(self) }
}

enum TypeFunction {
  case arrow
  case bool
  case int
  // case list
}


protocol MonoTypeProtocol {
  var concreateType: MonoType { get }
}

indirect enum MonoType: Equatable, MonoTypeProtocol {
  case variable(TypeVariable)
  case functionApplication(TypeFunctionApplication)

  var concreateType: MonoType { self }

  static func functionApplication(
    _ C: TypeFunction,
    parameters: [MonoType] = []
  ) -> Self {
    .functionApplication(TypeFunctionApplication(C, parameters: parameters))
  }

  static func variable() -> Self {
    .variable(TypeVariable())
  }

  // static func functionApplication<each P>(_ C: TypeFunction, parameters: repeat each P) -> Self
  // where repeat each P: MonoTypeProtocol {
  //   var parameters = [MonoType]()
  //   parameters.reserveCapacity(parameters.count)
  //   for i in 0..<parameters.count {
  //     parameters.append(parameters[i].concreateType)
  //   }

  //   return .functionApplication(TypeFunctionApplication(C, parameters: parameters))
  // }
}

struct TypeFunctionApplication: Equatable, MonoTypeProtocol {
  let C: TypeFunction
  let parameters: [MonoType]

  var concreateType: MonoType { .functionApplication(self) }

  init(_ C: TypeFunction, parameters: [MonoType] = []) {
    self.C = C
    self.parameters = parameters
  }

  // init<each P>(_ C: TypeFunction, parameters: repeat each P) where repeat each P: MonoTypeProtocol {
  //   self.C = C

  //   var parameters = [MonoType]()
  //   parameters.reserveCapacity(parameters.count)
  //   for i in 0..<parameters.count {
  //     parameters.append(parameters[i])
  //   }

  //   self.parameters = parameters
  // }
}

indirect enum PolyType: Equatable {
  case mono(MonoType)
  case quantifier(TypeQuantifier)

  init(_ mono: MonoType) {
    self = .mono(mono)
  }

  init(_ quantifier: TypeQuantifier) {
    self = .quantifier(quantifier)
  }

  static func variable(_ variable: TypeVariable) -> PolyType {
    .mono(.variable(variable))
  }

  static func functionApplication(
    _ C: TypeFunction,
    parameters: [MonoType] = []
  ) -> PolyType {
    .mono(.functionApplication(C, parameters: parameters))
  }
}

struct TypeQuantifier: Equatable {
  let variable: TypeVariable
  let sigma: PolyType
}

struct Context {
  var typeEnv: [String: PolyType]
}

struct Substitution {
  let raw: [TypeVariable: MonoType]
}

extension Substitution {
  static var empty: Substitution { Substitution(raw: [:]) }

  func apply(to type: MonoType) -> MonoType {
    switch type {
    case .variable(let variable):
      return raw[variable] ?? type
    case .functionApplication(let application):
      return .functionApplication(
        TypeFunctionApplication(
          application.C,
          parameters: application.parameters.map { apply(to: $0) }
        )
      )
    }
  }

  func apply(to type: PolyType) -> PolyType {
    switch type {
    case .mono(let mono):
      return .mono(apply(to: mono))
    case .quantifier(let quantifier):
      return .quantifier(
        TypeQuantifier(
          variable: quantifier.variable,
          sigma: apply(to: quantifier.sigma)
        )
      )
    }
  }

  func apply(to context: Context) -> Context {
    var newTypeEnv = [String: PolyType]()
    for (key, value) in context.typeEnv {
      newTypeEnv[key] = apply(to: value)
    }
    return Context(typeEnv: newTypeEnv)
  }

  func combine(with other: Substitution) -> Substitution {
    var newRaw = raw
    for (key, value) in other.raw {
      newRaw[key] = apply(to: value)
    }
    return Substitution(raw: newRaw)
  }
}

protocol Instantiatable {
  func instantiate(with mappings: [TypeVariable: TypeVariable]) -> MonoType
}

extension MonoType: Instantiatable {
  func instantiate(
    with mappings: [TypeVariable: TypeVariable] = [:]
  ) -> MonoType {
    switch self {
    case .variable(let variable):
      return .variable(mappings[variable] ?? variable)
    case .functionApplication(let application):
      return .functionApplication(
        TypeFunctionApplication(
          application.C,
          parameters: application.parameters.map {
            $0.instantiate(with: mappings)
          }
        )
      )
    }
  }
}

extension PolyType: Instantiatable {
  func instantiate(
    with mappings: [TypeVariable: TypeVariable] = [:]
  ) -> MonoType {
    switch self {
    case .mono(let mono):
      return mono.instantiate(with: mappings)
    case .quantifier(let quantifier):
      let newVariable = TypeVariable()
      return quantifier.sigma.instantiate(
        with: mappings.merging([quantifier.variable: newVariable]) { _, new in new }
      )
    }
  }
}

protocol Typable {
  var freeVariables: Set<TypeVariable> { get }
}

extension MonoType: Typable {
  var freeVariables: Set<TypeVariable> {
    switch self {
    case .variable(let variable):
      return [variable]
    case .functionApplication(let application):
      return application.parameters.reduce(into: Set<TypeVariable>()) { result, type in
        result.formUnion(type.freeVariables)
      }
    }
  }
}

extension PolyType: Typable {
  var freeVariables: Set<TypeVariable> {
    switch self {
    case .mono(let mono):
      return mono.freeVariables
    case .quantifier(let quantifier):
      return quantifier.sigma.freeVariables.subtracting([quantifier.variable])
    }
  }
}

extension Context {
  func generalize(_ type: MonoType) -> PolyType {
    let freeVariables = type.freeVariables
    let quantifiers = freeVariables.map { variable in
      TypeQuantifier(variable: variable, sigma: .mono(.variable(variable)))
    }
    return quantifiers.reduce(.mono(type)) { result, quantifier in
      .quantifier(quantifier)
    }
  }
}

enum TypeCheckError: Error {
  case typeMismatch
  case infiniteType
  case unboundVariable
}

extension MonoType {

  func contains(_ variable: TypeVariable) -> Bool {
    switch self {
    case .variable(let v):
      return v == variable
    case .functionApplication(let application):
      return application.parameters.contains { $0.contains(variable) }
    }
  }

  func unify(with other: MonoType) throws -> Substitution {
    switch (self, other) {
    case (.variable(let lhs), .variable(let rhs)) where lhs == rhs:
      return .empty
    case (.variable(let lhs), let rhs):
      if rhs.contains(lhs) {
        throw TypeCheckError.infiniteType
      }
      return Substitution(raw: [lhs: rhs])
    case (_, .variable):
      return try other.unify(with: self)
    case (.functionApplication(let lhs), .functionApplication(let rhs)):
      guard lhs.C == rhs.C else { throw TypeCheckError.typeMismatch }
      guard lhs.parameters.count == rhs.parameters.count else {
        throw TypeCheckError.typeMismatch
      }
      let substitutions = try zip(lhs.parameters, rhs.parameters).map { lhs, rhs in
        try lhs.unify(with: rhs)
      }
      return substitutions.reduce(.empty) { result, substitution in
        result.combine(with: substitution)
      }
    }
  }
}

let boolTy: MonoType = .functionApplication(.bool, parameters: [])
let intTy: MonoType = .functionApplication(.int, parameters: [])

var myContext = Context(
  typeEnv: [
    "not": .functionApplication(.arrow, parameters: [boolTy, boolTy]),
    "and": .functionApplication(
      .arrow, parameters: [boolTy, .functionApplication(.arrow, parameters: [boolTy, boolTy])]),
    "odd": .functionApplication(.arrow, parameters: [intTy, boolTy]),
    "even": .functionApplication(.arrow, parameters: [intTy, boolTy]),
    "true": .functionApplication(.bool, parameters: []),
    "false": .functionApplication(.bool, parameters: []),
    "one": .functionApplication(.int, parameters: []),
  ]
)

protocol ExpressionProtocol {
  func typeCheck(in context: Context) throws -> (MonoType, Substitution)
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

let oddOne = ApplicationExpression(
  function: VariableExpression(name: "odd"),
  argument: VariableExpression(name: "one")
)

let notOddOne = ApplicationExpression(
  function: VariableExpression(name: "not"),
  argument: oddOne
)

do {
  let (type, substitution) = try notOddOne.typeCheck(in: myContext)
  print("type of `\(notOddOne)` is `\(type)`")
  print(substitution)
} catch {
  print(error)
}
