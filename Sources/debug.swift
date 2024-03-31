extension TypeVariable: CustomDebugStringConvertible {
  var debugDescription: String { "τ\(id)" }
}

extension TypeFunction: CustomDebugStringConvertible {
  var debugDescription: String {
    switch self {
    case .arrow:
      return "->"
    case .bool:
      return "Bool"
    case .int:
      return "Int"
    case .string:
      return "String"
    case .tuple(let length):
      return "Tuple(\(length))"
    // case .list:
    //   return "List"
    }
  }
}

extension TypeFunction: ExpressibleByStringLiteral {
  init(stringLiteral value: String) {
    switch value {
    case "->":
      self = .arrow
    case "Bool":
      self = .bool
    case "Int":
      self = .int
    case "String":
      self = .string
    // case "List":
    //   self = .list
    default:
      fatalError("Unknown type function \(value)")
    }
  }
}

extension MonoType: CustomDebugStringConvertible {
  var debugDescription: String {
    switch self {
    case .variable(let variable):
      return variable.debugDescription
    case .functionApplication(let application):
      return application.debugDescription
    }
  }
}

extension TypeFunctionApplication: CustomDebugStringConvertible {
  var debugDescription: String {
    switch C {
    case .bool, .int, .string:
      return C.debugDescription
    case .arrow:
      return parameters.map { $0.debugDescription }.joined(separator: " -> ")
    case .tuple(_):
      let typeList = parameters.map { $0.debugDescription }.joined(separator: ", ")
      return "Tuple(\(typeList))"
    }
  }
}

extension Substitution: CustomDebugStringConvertible {
  var debugDescription: String {
    return "Substitution {\n"
      + raw.map { "  \($0.key.debugDescription) ↦ \($0.value.debugDescription)" }.joined(
        separator: "\n") + "\n}\n"
  }
}
