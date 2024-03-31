import Antlr4
import Foundation

func typeCheck(_ source: String) throws -> MonoType {
  let chars = ANTLRInputStream(source)
  let lexer = LangLexer(chars)
  let tokens = CommonTokenStream(lexer)

  let parser = try LangParser(tokens)
  let errorListener = ErrorListener()
  parser.removeErrorListeners()
  parser.addErrorListener(errorListener)
  let tree = try parser.program()

  if errorListener.errors.count != 0 {
    errorListener.errors.forEach {
      print("\($0)\n")
    }
    throw ANTLRError.illegalState(msg: "Syntax error")
  }

  let ast = TreeBuildVisitor().visit(tree) as! Program
  return (try ast.typeCheck(in: myContext)).0
}

while true {
  print("> ", terminator: "")
  if let input = readLine() {
    do {
      let res = try typeCheck(input)
      print("type is: \(res)")
    } catch (let err) {
      print("err: \(err)")
    }

  } else {
    break
  }
}
