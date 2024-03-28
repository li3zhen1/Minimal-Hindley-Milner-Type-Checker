import Antlr4

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


let oddOne = ApplicationExpression(
  function: VariableExpression(name: "odd"),
  argument: VariableExpression(name: "one")
)

let notOddOne = ApplicationExpression(
  function: VariableExpression(name: "not"),
  argument: oddOne
)

do {
  let source = "(func a => a)(1)"
  let chars = ANTLRInputStream(source)
  let lexer = LangLexer(chars)
  let tokens = CommonTokenStream(lexer)
  let parser = try LangParser(tokens)
  let tree = try parser.program()
  let ast = TreeBuildVisitor().visit(tree) as! Program

  print(ast)

  let (type, substitution) = try ast.typeCheck(in: myContext)
  print("type of `\(source)` is `\(type)`")
  print(substitution)

} catch {
  print(error)
}

// let x = TypeVariable()
// let identityAbs: PolyType = .quantifier(variable: x, sigma: .functionApplication(.arrow, parameters: [.variable(x), .variable(x)]))
// assert(identityAbs.freeVariables == [])

// myContext.typeEnv["identity"] = identityAbs

// let identity = ApplicationExpression(
//   function: VariableExpression(name: "identity"),
//   argument: VariableExpression(name: "one")
// )

// do {
//   let (type, substitution) = try identity.typeCheck(in: myContext)
//   print("type of `identity(one)` is `\(type)`")
//   print(substitution)
// } catch {
//   print(error)
// }
