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

  override func visitParenTypeExpr(_ ctx: LangParser.ParenTypeExprContext) -> ASTNode {
    return visit(ctx.typeExpr()!)!
  }

  override func visitFuncType(_ ctx: LangParser.FuncTypeContext) -> ASTNode {
    return FunctionTypeExpression(
      arg: visit(ctx.arg) as! TypeExpression,
      ret: visit(ctx.ret) as! TypeExpression
    )
  }
  
  override func visitAliasing(_ ctx: LangParser.AliasingContext) -> ASTNode {
    return NamedTypeExpression(name: (ctx.Identifier()?.getText())!)
  }
  
  override func visitProductType(_ ctx: LangParser.ProductTypeContext) -> ASTNode {
    let members = ctx.typeExpr().map { visit($0) as! TypeExpression }
    return ProductTypeExpression(members: members)
  }
  
  override func visitSumType(_ ctx: LangParser.SumTypeContext) -> ASTNode {
    fatalError("not implemented")
  }
  
  override func visitTypeHint(_ ctx: LangParser.TypeHintContext) -> ASTNode {
    return visit(ctx.typeExpr()!)!
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
    return ConditionExpression(
      condExpr: visit(ctx.expr(0)!) as! ExpressionProtocol,
      thenExpr: visit(ctx.expr(1)!) as! ExpressionProtocol,
      elseExpr: visit(ctx.expr(2)!) as! ExpressionProtocol
    )
  }
  
  override func visitAssignmentExpression(_ ctx: LangParser.AssignmentExpressionContext) -> ASTNode {
    fatalError("not implemented")
  }
  
  override func visitParenExpression(_ ctx: LangParser.ParenExpressionContext) -> ASTNode {
    return visit(ctx.expr()!)!
  }

  override func visitExpressionList(_ ctx: LangParser.ExpressionListContext) -> ASTNode {    
    let children = ctx.exprList()?.children?.compactMap { visit($0) as? ExpressionProtocol }
    return TupleExpression(elements: children ?? [])
  }
  
  override func visitFuncAppExpression(_ ctx: LangParser.FuncAppExpressionContext) -> ASTNode {
    return ApplicationExpression(
      function: visit(ctx.function) as! ExpressionProtocol,
      argument: visit(ctx.arg) as! ExpressionProtocol
    )
  }
  
  override func visitVariableExpression(_ ctx: LangParser.VariableExpressionContext) -> ASTNode {
    return VariableExpression(name: ctx.getText())
  }
  
  override func visitFuncDefExpression(_ ctx: LangParser.FuncDefExpressionContext) -> ASTNode {
    guard ctx.funcParamList()?.funcParam().count == 1, let body = ctx.expr() else {
      fatalError("not implemented")
    }
    let firstParam = (ctx.funcParamList()?.funcParam().first)!
    
    return AbstractionExpression(
      parameter: (firstParam.Identifier()?.getText())!,
      typeHint: firstParam.typeHint().flatMap { visit($0) as? TypeExpression },
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
      let typeExpr = bindingCtx.typeHint().flatMap { visit($0) as? TypeExpression }
      return Binding(name: name, typeHint: typeExpr, expr: expr)
    }
    return BindingList(bindings: bindings)
  }
  
  override func visitLetExpression(_ ctx: LangParser.LetExpressionContext) -> ASTNode {
    
    let bindings = (visit(ctx.bindingList()!) as! BindingList).bindings
    
    var letExpr = LetExpression(
      name: bindings.last!.name,
      typeHint: bindings.last!.typeHint,
      expr: bindings.last!.expr,
      // ctx.expr() here is actually the body.
      body: visit(ctx.expr()!) as! ExpressionProtocol
    )

    for i in (0 ..< bindings.count - 1).reversed() {
      letExpr = LetExpression(
        name: bindings[i].name,
        typeHint: bindings[i].typeHint,
        expr: bindings[i].expr,
        body: letExpr
      )
    }

    return letExpr
  }

  override func visitBinaryExpression(_ ctx: LangParser.BinaryExpressionContext) -> ASTNode {
    return ApplicationExpression(
      function: ApplicationExpression(
        function: VariableExpression(name: (ctx.BinaryOperator()?.getText())!),
        argument: visit(ctx.lhs) as! ExpressionProtocol
      ),
      argument: visit(ctx.rhs) as! ExpressionProtocol
    )
  }
  
  override func visitExprList(_ ctx: LangParser.ExprListContext) -> ASTNode {
    fatalError("should not reach here")
  }
}