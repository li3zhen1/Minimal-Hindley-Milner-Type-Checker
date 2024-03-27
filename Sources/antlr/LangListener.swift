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
	 * Enter a parse tree produced by the {@code additionExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAdditionExpression(_ ctx: LangParser.AdditionExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code additionExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAdditionExpression(_ ctx: LangParser.AdditionExpressionContext)
	/**
	 * Enter a parse tree produced by the {@code numberExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterNumberExpression(_ ctx: LangParser.NumberExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code numberExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitNumberExpression(_ ctx: LangParser.NumberExpressionContext)
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
	 * Enter a parse tree produced by the {@code multiplicationExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMultiplicationExpression(_ ctx: LangParser.MultiplicationExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code multiplicationExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMultiplicationExpression(_ ctx: LangParser.MultiplicationExpressionContext)
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
	 * Enter a parse tree produced by the {@code booleanExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBooleanExpression(_ ctx: LangParser.BooleanExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code booleanExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBooleanExpression(_ ctx: LangParser.BooleanExpressionContext)
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
	 * Enter a parse tree produced by the {@code stringExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStringExpression(_ ctx: LangParser.StringExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code stringExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStringExpression(_ ctx: LangParser.StringExpressionContext)
	/**
	 * Enter a parse tree produced by the {@code subtractionExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSubtractionExpression(_ ctx: LangParser.SubtractionExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code subtractionExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSubtractionExpression(_ ctx: LangParser.SubtractionExpressionContext)
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
	 * Enter a parse tree produced by the {@code divisionExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDivisionExpression(_ ctx: LangParser.DivisionExpressionContext)
	/**
	 * Exit a parse tree produced by the {@code divisionExpression}
	 * labeled alternative in {@link LangParser#expr}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDivisionExpression(_ ctx: LangParser.DivisionExpressionContext)
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