import Antlr4
import XCTest

@testable import HindleyMilnerW

class TypeCheckTests: XCTestCase {

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

    do {
      let ty = try typeCheck("let a = (let a = odd 1 in { a }) in { a }")
      XCTAssertEqual(ty, boolTy)
    }
  }

  func testTupleType() throws {
    do {
      let ty = try typeCheck("()")
      XCTAssertEqual(ty, buildTupleTy())
    }

    do {
      let ty = try typeCheck("(false, 1)")
      XCTAssertEqual(ty, buildTupleTy(boolTy, intTy))
    }

    do {
      let ty = try typeCheck("let a = 23, b = false in { ((func x => (odd a)) 2, 1) }")
      XCTAssertEqual(ty, buildTupleTy(boolTy, intTy))
    }
  }

  func testConditional() throws {
    do {
      let ty = try typeCheck("if false then 3 else 1")
      XCTAssertEqual(ty, intTy)
    }

    do {
      let ty = try typeCheck("""
      func a =>
        let b = a in {
          (b, if (let c = b in { not (odd c) }) then odd a else true)
        }
      """)
      XCTAssertEqual(ty, .functionApplication(.arrow, parameters: [intTy, buildTupleTy(intTy, boolTy)]))
    }
  }

}
