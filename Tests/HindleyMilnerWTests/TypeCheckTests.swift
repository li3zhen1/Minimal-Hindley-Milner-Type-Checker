import Antlr4
import XCTest

@testable import HindleyMilnerW

class TypeCheckTests: XCTestCase {

  private func typeCheck(_ source: String) throws -> MonoType {
    let chars = ANTLRInputStream(source)
    let lexer = LangLexer(chars)
    let tokens = CommonTokenStream(lexer)

    let parser = try LangParser(tokens)
    let errorListener = ErrorListener()
    parser.removeErrorListeners()
    parser.addErrorListener(errorListener)
    let tree = try parser.program()

    if errorListener.errors.count != 0 {
      errorListener.errors.forEach { print($0); print("\n") }
      throw ANTLRError.illegalState(msg: "Syntax error")
    }

    let ast = TreeBuildVisitor().visit(tree) as! Program
    return (try ast.typeCheck(in: myContext)).0
  }

  func testIdentityAbstraction() throws {
    do {
      let ty = try typeCheck("(func a => a)(1)")
      XCTAssertEqual(ty, intTy)
    }

    do {
      let ty = try typeCheck("(func a => a)(false)")
      XCTAssertEqual(ty, boolTy)
    }

    do {
      let ty = try typeCheck("(func a => a)(\"str\")")
      XCTAssertEqual(ty, stringTy)
    }

    do {
      let ty = try typeCheck("(func a => a)(odd(one))")
      XCTAssertEqual(ty, boolTy)
    }

    do {
      let ty = try typeCheck("(func a => a)((func a => a)(one))")
      XCTAssertEqual(ty, intTy)
    }
  }

  func testLetExpression() throws {
    do {
      let ty = try typeCheck("let a = 3, b = odd(a) in { not(b) }")
      XCTAssertEqual(ty, boolTy)
    }
  }

  private class ErrorListener: ANTLRErrorListener {
    
    struct ErrorInfo: CustomStringConvertible {
      let line: Int
      let col: Int
      let message: String

      var description: String {
        return "line: \(line), column: \(col), message: \(message)"
      }
    }

    var errors = [ErrorInfo]()

    func syntaxError<T>(
      _ recognizer: Antlr4.Recognizer<T>,
      _ offendingSymbol: AnyObject?, _ line: Int, _ charPositionInLine: Int, _ msg: String,
      _ e: AnyObject?
    )  where T: Antlr4.ATNSimulator {
      errors.append(ErrorInfo(line: line, col: charPositionInLine, message: msg))
    }

    func reportAmbiguity(
      _ recognizer: Antlr4.Parser, _ dfa: Antlr4.DFA, _ startIndex: Int, _ stopIndex: Int,
      _ exact: Bool, _ ambigAlts: Antlr4.BitSet, _ configs: Antlr4.ATNConfigSet
    ) {}

    func reportAttemptingFullContext(
      _ recognizer: Antlr4.Parser, _ dfa: Antlr4.DFA, _ startIndex: Int, _ stopIndex: Int,
      _ conflictingAlts: Antlr4.BitSet?, _ configs: Antlr4.ATNConfigSet
    ) {}

    func reportContextSensitivity(
      _ recognizer: Antlr4.Parser, _ dfa: Antlr4.DFA, _ startIndex: Int, _ stopIndex: Int,
      _ prediction: Int, _ configs: Antlr4.ATNConfigSet
    ) {}
  }

}
