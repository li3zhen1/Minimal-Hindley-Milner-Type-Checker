
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
    if parameters.isEmpty {
      return C.debugDescription
    }
    return self.parameters.map { $0.debugDescription }.joined(separator: " -> ")
  }
}

extension Substitution: CustomDebugStringConvertible {
  var debugDescription: String {
    return "Substitution {\n" + raw.map { "  \($0.key.debugDescription) ↦ \($0.value.debugDescription)" }.joined(separator: "\n") + "\n}\n"
  }
}
