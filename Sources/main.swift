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

// do {
//   let (type, substitution) = try notOddOne.typeCheck(in: myContext)
//   print("type of `\(notOddOne)` is `\(type)`")
//   print(substitution)
// } catch {
//   print(error)
// }

do {
  let source = "(func a => a)(1)"
  let chars = ANTLRInputStream(source)
  let lexer = LangLexer(chars)
  let tokens = CommonTokenStream(lexer)
  let parser = try LangParser(tokens)
  let tree = try parser.program()
  let ast = TreeBuildVisitor().visit(tree) as! Program

  let (type, substitution) = try ast.typeCheck(in: myContext)
  print("type of `\(source)` is `\(type)`")
  print(substitution)

} catch {
  print(error)
}
