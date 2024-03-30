import Antlr4

class TreeBuildVisitor: LangVisitor<ASTNode> {

  override func visit(_ tree: ParseTree) -> ASTNode? {
    return tree.accept(self)
  }

  override func visitTerminal(_ node: TerminalNode) -> ASTNode? {
    return nil
  }

  override func visitErrorNode(_ node: ErrorNode) -> ASTNode? {
    return node.accept(self)
  }

  override func visitChildren(_ node: RuleNode) -> ASTNode? {
    for i in 0 ..< node.getChildCount() {
      _ = visit(node.getChild(i) as! ParseTree)
    }
    return nil
  }
  
  override func visitProgram(_ ctx: LangParser.ProgramContext) -> ASTNode {
    let children = ctx.children?.compactMap { visit($0) }
    return Program(expressions: children ?? [])
  }
  
  override func visitTypeDef(_ ctx: LangParser.TypeDefContext) -> ASTNode {
    fatalError("not implemented")
  }
  
  override func visitAliasing(_ ctx: LangParser.AliasingContext) -> ASTNode {
    fatalError("not implemented")
  }
  
  override func visitProductType(_ ctx: LangParser.ProductTypeContext) -> ASTNode {
    fatalError("not implemented")
  }
  
  override func visitSumType(_ ctx: LangParser.SumTypeContext) -> ASTNode {
    fatalError("not implemented")
  }
  
  override func visitTypeHint(_ ctx: LangParser.TypeHintContext) -> ASTNode {
    fatalError("not implemented")
  }
  
  override func visitFuncParam(_ ctx: LangParser.FuncParamContext) -> ASTNode {
    fatalError("not implemented")
  }
  
  override func visitFuncParamList(_ ctx: LangParser.FuncParamListContext) -> ASTNode {
    fatalError("not implemented")
  }
  
  override func visitIntegerLiteral(_ ctx: LangParser.IntegerLiteralContext) -> ASTNode {
    return IntegerLiteral(value: Int(ctx.getText())!)
  }
  
  override func visitBooleanLiteral(_ ctx: LangParser.BooleanLiteralContext) -> ASTNode {
    return BooleanLiteral(value: ctx.getText() == "true")
  }
  
  override func visitStringLiteral(_ ctx: LangParser.StringLiteralContext) -> ASTNode {
    let str = ctx.getText()
    let startIndex = str.index(after: str.startIndex)
    let endIndex = str.index(before: str.endIndex)
    return StringLiteral(value: String(str[startIndex..<endIndex]))
  }
  
  override func visitConditionalExpression(_ ctx: LangParser.ConditionalExpressionContext) -> ASTNode {
    fatalError("not implemented")
  }
  
  override func visitAssignmentExpression(_ ctx: LangParser.AssignmentExpressionContext) -> ASTNode {
    fatalError("not implemented")
  }
  
  override func visitParenExpression(_ ctx: LangParser.ParenExpressionContext) -> ASTNode {
    return visit(ctx.expr()!)!
  }
  
  override func visitFuncAppExpression(_ ctx: LangParser.FuncAppExpressionContext) -> ASTNode {
    guard let function = ctx.expr(), ctx.exprList()?.expr().count == 1 else {
      fatalError("not implemented")
    }

    return ApplicationExpression(
      function: visit(function) as! ExpressionProtocol,
      argument: visit((ctx.exprList()?.expr()[0])!) as! ExpressionProtocol
    )
  }
  
  override func visitVariableExpression(_ ctx: LangParser.VariableExpressionContext) -> ASTNode {
    return VariableExpression(name: ctx.getText())
  }
  
  override func visitFuncDefExpression(_ ctx: LangParser.FuncDefExpressionContext) -> ASTNode {
    guard ctx.funcParamList()?.funcParam().count == 1, let body = ctx.expr() else {
      fatalError("not implemented")
    }
    return AbstractionExpression(
      parameter: (ctx.funcParamList()?.funcParam()[0].Identifier()?.getText())!,
      body: visit(body) as! ExpressionProtocol
    )
  }

  override func visitBinding(_ ctx: LangParser.BindingContext) -> ASTNode {
    fatalError("should not reach here")
  }
  
  override func visitBindingList(_ ctx: LangParser.BindingListContext) -> ASTNode {
    let bindings = ctx.binding().compactMap { bindingCtx in
      let name = (bindingCtx.Identifier()?.getText())!
      let expr = visit(bindingCtx.expr()!) as! ExpressionProtocol
      return Binding(name: name, expr: expr)
    }
    return BindingList(bindings: bindings)
  }
  
  override func visitLetExpression(_ ctx: LangParser.LetExpressionContext) -> ASTNode {
    
    let bindings = (visit(ctx.bindingList()!) as! BindingList).bindings
    var idx = bindings.count - 1
    
    var letExpr = LetExpression(
      name: bindings[idx].name,
      expr: bindings[idx].expr,
      // ctx.expr() here is actually the body.
      body: visit(ctx.expr()!) as! ExpressionProtocol
    )

    while idx > 0 {
      idx -= 1
      letExpr = LetExpression(name: bindings[idx].name, expr: bindings[idx].expr, body: letExpr)
    }
    return letExpr
  }
  
  override func visitExprList(_ ctx: LangParser.ExprListContext) -> ASTNode {
    fatalError("not implemented")
  }
}