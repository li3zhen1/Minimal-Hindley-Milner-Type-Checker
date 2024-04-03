// Generated from Sources/antlr-g4/Lang.g4 by ANTLR 4.13.1
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link LangParser}.
 */
public protocol LangListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link LangParser#program}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProgram(_ ctx: LangParser.ProgramContext)
	/**
	 * Exit a parse tree produced by {@link LangParser#program}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProgram(_ ctx: LangParser.ProgramContext)
	/**
	 * Enter a parse tree produced by {@link LangParser#typeDef}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypeDef(_ ctx: LangParser.TypeDefContext)
	/**
	 * Exit a parse tree produced by {@link LangParser#typeDef}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypeDef(_ ctx: LangParser.TypeDefContext)
	/**
	 * Enter a parse tree produced by the {@code parenTypeExpr}
	 * labeled alternative in {@link LangParser#typeExpr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParenTypeExpr(_ ctx: LangParser.ParenTypeExprContext)
	/**
	 * Exit a parse tree produced by the {@code parenTypeExpr}
	 * labeled alternative in {@link LangParser#typeExpr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParenTypeExpr(_ ctx: LangParser.ParenTypeExprContext)
	/**
	 * Enter a parse tree produced by the {@code aliasing}
	 * labeled alternative in {@link LangParser#typeExpr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAliasing(_ ctx: LangParser.AliasingContext)
	/**
	 * Exit a parse tree produced by the {@code aliasing}
	 * labeled alternative in {@link LangParser#typeExpr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAliasing(_ ctx: LangParser.AliasingContext)
	/**
	 * Enter a parse tree produced by the {@code productType}
	 * labeled alternative in {@link LangParser#typeExpr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProductType(_ ctx: LangParser.ProductTypeContext)
	/**
	 * Exit a parse tree produced by the {@code productType}
	 * labeled alternative in {@link LangParser#typeExpr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProductType(_ ctx: LangParser.ProductTypeContext)
	/**
	 * Enter a parse tree produced by the {@code sumType}
	 * labeled alternative in {@link LangParser#typeExpr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSumType(_ ctx: LangParser.SumTypeContext)
	/**
	 * Exit a parse tree produced by the {@code sumType}
	 * labeled alternative in {@link LangParser#typeExpr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSumType(_ ctx: LangParser.SumTypeContext)
	/**
	 * Enter a parse tree produced by the {@code funcType}
	 * labeled alternative in {@link LangParser#typeExpr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFuncType(_ ctx: LangParser.FuncTypeContext)
	/**
	 * Exit a parse tree produced by the {@code funcType}
	 * labeled alternative in {@link LangParser#typeExpr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFuncType(_ ctx: LangParser.FuncTypeContext)
	/**
	 * Enter a parse tree produced by {@link LangParser#typeHint}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypeHint(_ ctx: LangParser.TypeHintContext)
	/**
	 * Exit a parse tree produced by {@link LangParser#typeHint}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypeHint(_ ctx: LangParser.TypeHintContext)
	/**
	 * Enter a parse tree produced by {@link LangParser#binding}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBinding(_ ctx: LangParser.BindingContext)
	/**
	 * Exit a parse tree produced by {@link LangParser#binding}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBinding(_ ctx: LangParser.BindingContext)
	/**
	 * Enter a parse tree produced by {@link LangParser#bindingList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBindingList(_ ctx: LangParser.BindingListContext)
	/**
	 * Exit a parse tree produced by {@link LangParser#bindingList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBindingList(_ ctx: LangParser.BindingListContext)
	/**
	 * Enter a parse tree produced by {@link LangParser#funcParam}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFuncParam(_ ctx: LangParser.FuncParamContext)
	/**
	 * Exit a parse tree produced by {@link LangParser#funcParam}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFuncParam(_ ctx: LangParser.FuncParamContext)
	/**
	 * Enter a parse tree produced by {@link LangParser#funcParamList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFuncParamList(_ ctx: LangParser.FuncParamListContext)
	/**
	 * Exit a parse tree produced by {@link LangParser#funcParamList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFuncParamList(_ ctx: LangParser.FuncParamListContext)
	/**
	 * Enter a parse tree produced by the {@code binaryExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBinaryExpression(_ ctx: LangParser.BinaryExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code binaryExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBinaryExpression(_ ctx: LangParser.BinaryExpressionContext)
	/**
	 * Enter a parse tree produced by the {@code expressionList}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpressionList(_ ctx: LangParser.ExpressionListContext)
	/**
	 * Exit a parse tree produced by the {@code expressionList}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpressionList(_ ctx: LangParser.ExpressionListContext)
	/**
	 * Enter a parse tree produced by the {@code stringLiteral}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStringLiteral(_ ctx: LangParser.StringLiteralContext)
	/**
	 * Exit a parse tree produced by the {@code stringLiteral}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStringLiteral(_ ctx: LangParser.StringLiteralContext)
	/**
	 * Enter a parse tree produced by the {@code conditionalExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterConditionalExpression(_ ctx: LangParser.ConditionalExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code conditionalExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitConditionalExpression(_ ctx: LangParser.ConditionalExpressionContext)
	/**
	 * Enter a parse tree produced by the {@code letExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLetExpression(_ ctx: LangParser.LetExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code letExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLetExpression(_ ctx: LangParser.LetExpressionContext)
	/**
	 * Enter a parse tree produced by the {@code integerLiteral}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterIntegerLiteral(_ ctx: LangParser.IntegerLiteralContext)
	/**
	 * Exit a parse tree produced by the {@code integerLiteral}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitIntegerLiteral(_ ctx: LangParser.IntegerLiteralContext)
	/**
	 * Enter a parse tree produced by the {@code assignmentExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAssignmentExpression(_ ctx: LangParser.AssignmentExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code assignmentExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAssignmentExpression(_ ctx: LangParser.AssignmentExpressionContext)
	/**
	 * Enter a parse tree produced by the {@code parenExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParenExpression(_ ctx: LangParser.ParenExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code parenExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParenExpression(_ ctx: LangParser.ParenExpressionContext)
	/**
	 * Enter a parse tree produced by the {@code funcAppExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFuncAppExpression(_ ctx: LangParser.FuncAppExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code funcAppExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFuncAppExpression(_ ctx: LangParser.FuncAppExpressionContext)
	/**
	 * Enter a parse tree produced by the {@code booleanLiteral}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBooleanLiteral(_ ctx: LangParser.BooleanLiteralContext)
	/**
	 * Exit a parse tree produced by the {@code booleanLiteral}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBooleanLiteral(_ ctx: LangParser.BooleanLiteralContext)
	/**
	 * Enter a parse tree produced by the {@code variableExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVariableExpression(_ ctx: LangParser.VariableExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code variableExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVariableExpression(_ ctx: LangParser.VariableExpressionContext)
	/**
	 * Enter a parse tree produced by the {@code funcDefExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFuncDefExpression(_ ctx: LangParser.FuncDefExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code funcDefExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFuncDefExpression(_ ctx: LangParser.FuncDefExpressionContext)
	/**
	 * Enter a parse tree produced by {@link LangParser#exprList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExprList(_ ctx: LangParser.ExprListContext)
	/**
	 * Exit a parse tree produced by {@link LangParser#exprList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExprList(_ ctx: LangParser.ExprListContext)
}