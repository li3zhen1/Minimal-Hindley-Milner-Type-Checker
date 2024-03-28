import Antlr4
import XCTest

@testable import HindleyMilnerW

class TypeCheckTests: XCTestCase {

  private func typeCheck(_ source: String) throws -> MonoType {
    let chars = ANTLRInputStream(source)
    let lexer = LangLexer(chars)
    let tokens = CommonTokenStream(lexer)
    let parser = try LangParser(tokens)
    let tree = try parser.program()
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
      let ty = try typeCheck("(func a => a)(odd(one))")
      XCTAssertEqual(ty, boolTy)
    }

    do {
      let ty = try typeCheck("(func a => a)((func a => a)(one))")
      XCTAssertEqual(ty, intTy)
    }
  }
}
