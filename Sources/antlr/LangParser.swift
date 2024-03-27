// Generated from Sources/antlr-g4/Lang.g4 by ANTLR 4.13.1
import Antlr4

open class LangParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = LangParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(LangParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, T__0 = 1, T__1 = 2, T__2 = 3, T__3 = 4, T__4 = 5, T__5 = 6, 
                 T__6 = 7, T__7 = 8, T__8 = 9, T__9 = 10, T__10 = 11, T__11 = 12, 
                 T__12 = 13, T__13 = 14, T__14 = 15, T__15 = 16, T__16 = 17, 
                 T__17 = 18, T__18 = 19, T__19 = 20, IntegerLiteral = 21, 
                 RealLiteral = 22, StringLiteral = 23, BooleanLiteral = 24, 
                 Identifier = 25, Alpha = 26, Digit = 27, Whitespace = 28, 
                 Comment = 29
	}

	public
	static let RULE_program = 0, RULE_typeDef = 1, RULE_typeExpr = 2, RULE_typeHint = 3, 
            RULE_binding = 4, RULE_bindingList = 5, RULE_funcParam = 6, 
            RULE_funcParamList = 7, RULE_expr = 8, RULE_exprList = 9

	public
	static let ruleNames: [String] = [
		"program", "typeDef", "typeExpr", "typeHint", "binding", "bindingList", 
		"funcParam", "funcParamList", "expr", "exprList"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'type'", "'='", "'('", "','", "')'", "'|'", "':'", "'+'", "'-'", 
		"'*'", "'/'", "'let'", "'in'", "'{'", "'}'", "'func'", "'=>'", "'if'", 
		"'then'", "'else'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, "IntegerLiteral", "RealLiteral", "StringLiteral", 
		"BooleanLiteral", "Identifier", "Alpha", "Digit", "Whitespace", "Comment"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "Lang.g4" }

	override open
	func getRuleNames() -> [String] { return LangParser.ruleNames }

	override open
	func getSerializedATN() -> [Int] { return LangParser._serializedATN }

	override open
	func getATN() -> ATN { return LangParser._ATN }


	override open
	func getVocabulary() -> Vocabulary {
	    return LangParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,LangParser._ATN,LangParser._decisionToDFA, LangParser._sharedContextCache)
	}


	public class ProgramContext: ParserRuleContext {
			open
			func EOF() -> TerminalNode? {
				return getToken(LangParser.Tokens.EOF.rawValue, 0)
			}
			open
			func typeDef() -> [TypeDefContext] {
				return getRuleContexts(TypeDefContext.self)
			}
			open
			func typeDef(_ i: Int) -> TypeDefContext? {
				return getRuleContext(TypeDefContext.self, i)
			}
			open
			func expr() -> [ExprContext] {
				return getRuleContexts(ExprContext.self)
			}
			open
			func expr(_ i: Int) -> ExprContext? {
				return getRuleContext(ExprContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return LangParser.RULE_program
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterProgram(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitProgram(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitProgram(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitProgram(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func program() throws -> ProgramContext {
		var _localctx: ProgramContext
		_localctx = ProgramContext(_ctx, getState())
		try enterRule(_localctx, 0, LangParser.RULE_program)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(24)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 61149194) != 0)) {
		 		setState(22)
		 		try _errHandler.sync(self)
		 		switch (LangParser.Tokens(rawValue: try _input.LA(1))!) {
		 		case .T__0:
		 			setState(20)
		 			try typeDef()

		 			break
		 		case .T__2:fallthrough
		 		case .T__11:fallthrough
		 		case .T__15:fallthrough
		 		case .T__17:fallthrough
		 		case .IntegerLiteral:fallthrough
		 		case .StringLiteral:fallthrough
		 		case .BooleanLiteral:fallthrough
		 		case .Identifier:
		 			setState(21)
		 			try expr(0)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}

		 		setState(26)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(27)
		 	try match(LangParser.Tokens.EOF.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeDefContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(LangParser.Tokens.Identifier.rawValue, 0)
			}
			open
			func typeExpr() -> TypeExprContext? {
				return getRuleContext(TypeExprContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LangParser.RULE_typeDef
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterTypeDef(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitTypeDef(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitTypeDef(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitTypeDef(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func typeDef() throws -> TypeDefContext {
		var _localctx: TypeDefContext
		_localctx = TypeDefContext(_ctx, getState())
		try enterRule(_localctx, 2, LangParser.RULE_typeDef)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(29)
		 	try match(LangParser.Tokens.T__0.rawValue)
		 	setState(30)
		 	try match(LangParser.Tokens.Identifier.rawValue)
		 	setState(31)
		 	try match(LangParser.Tokens.T__1.rawValue)
		 	setState(32)
		 	try typeExpr(0)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public class TypeExprContext: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return LangParser.RULE_typeExpr
		}
	}
	public class AliasingContext: TypeExprContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(LangParser.Tokens.Identifier.rawValue, 0)
			}

		public
		init(_ ctx: TypeExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterAliasing(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitAliasing(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitAliasing(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitAliasing(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class ProductTypeContext: TypeExprContext {
			open
			func typeExpr() -> [TypeExprContext] {
				return getRuleContexts(TypeExprContext.self)
			}
			open
			func typeExpr(_ i: Int) -> TypeExprContext? {
				return getRuleContext(TypeExprContext.self, i)
			}

		public
		init(_ ctx: TypeExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterProductType(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitProductType(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitProductType(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitProductType(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class SumTypeContext: TypeExprContext {
			open
			func typeExpr() -> [TypeExprContext] {
				return getRuleContexts(TypeExprContext.self)
			}
			open
			func typeExpr(_ i: Int) -> TypeExprContext? {
				return getRuleContext(TypeExprContext.self, i)
			}

		public
		init(_ ctx: TypeExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterSumType(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitSumType(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitSumType(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitSumType(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}

	 public final  func typeExpr( ) throws -> TypeExprContext   {
		return try typeExpr(0)
	}
	@discardableResult
	private func typeExpr(_ _p: Int) throws -> TypeExprContext   {
		let _parentctx: ParserRuleContext? = _ctx
		let _parentState: Int = getState()
		var _localctx: TypeExprContext
		_localctx = TypeExprContext(_ctx, _parentState)
		var _prevctx: TypeExprContext = _localctx
		let _startState: Int = 4
		try enterRecursionRule(_localctx, 4, LangParser.RULE_typeExpr, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(48)
			try _errHandler.sync(self)
			switch (LangParser.Tokens(rawValue: try _input.LA(1))!) {
			case .Identifier:
				_localctx = AliasingContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx

				setState(35)
				try match(LangParser.Tokens.Identifier.rawValue)

				break

			case .T__2:
				_localctx = ProductTypeContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(36)
				try match(LangParser.Tokens.T__2.rawValue)
				setState(45)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				if (_la == LangParser.Tokens.T__2.rawValue || _la == LangParser.Tokens.Identifier.rawValue) {
					setState(37)
					try typeExpr(0)
					setState(42)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
					while (_la == LangParser.Tokens.T__3.rawValue) {
						setState(38)
						try match(LangParser.Tokens.T__3.rawValue)
						setState(39)
						try typeExpr(0)


						setState(44)
						try _errHandler.sync(self)
						_la = try _input.LA(1)
					}

				}

				setState(47)
				try match(LangParser.Tokens.T__4.rawValue)

				break
			default:
				throw ANTLRException.recognition(e: NoViableAltException(self))
			}
			_ctx!.stop = try _input.LT(-1)
			setState(55)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,5,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = SumTypeContext(  TypeExprContext(_parentctx, _parentState))
					try pushNewRecursionContext(_localctx, _startState, LangParser.RULE_typeExpr)
					setState(50)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(51)
					try match(LangParser.Tokens.T__5.rawValue)
					setState(52)
					try typeExpr(2)

			 
				}
				setState(57)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,5,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class TypeHintContext: ParserRuleContext {
			open
			func typeExpr() -> TypeExprContext? {
				return getRuleContext(TypeExprContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LangParser.RULE_typeHint
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterTypeHint(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitTypeHint(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitTypeHint(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitTypeHint(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func typeHint() throws -> TypeHintContext {
		var _localctx: TypeHintContext
		_localctx = TypeHintContext(_ctx, getState())
		try enterRule(_localctx, 6, LangParser.RULE_typeHint)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(58)
		 	try match(LangParser.Tokens.T__6.rawValue)
		 	setState(59)
		 	try typeExpr(0)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BindingContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(LangParser.Tokens.Identifier.rawValue, 0)
			}
			open
			func expr() -> ExprContext? {
				return getRuleContext(ExprContext.self, 0)
			}
			open
			func typeHint() -> TypeHintContext? {
				return getRuleContext(TypeHintContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LangParser.RULE_binding
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterBinding(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitBinding(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitBinding(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitBinding(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func binding() throws -> BindingContext {
		var _localctx: BindingContext
		_localctx = BindingContext(_ctx, getState())
		try enterRule(_localctx, 8, LangParser.RULE_binding)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(61)
		 	try match(LangParser.Tokens.Identifier.rawValue)
		 	setState(63)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == LangParser.Tokens.T__6.rawValue) {
		 		setState(62)
		 		try typeHint()

		 	}

		 	setState(65)
		 	try match(LangParser.Tokens.T__1.rawValue)
		 	setState(66)
		 	try expr(0)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BindingListContext: ParserRuleContext {
			open
			func binding() -> [BindingContext] {
				return getRuleContexts(BindingContext.self)
			}
			open
			func binding(_ i: Int) -> BindingContext? {
				return getRuleContext(BindingContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return LangParser.RULE_bindingList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterBindingList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitBindingList(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitBindingList(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitBindingList(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func bindingList() throws -> BindingListContext {
		var _localctx: BindingListContext
		_localctx = BindingListContext(_ctx, getState())
		try enterRule(_localctx, 10, LangParser.RULE_bindingList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(68)
		 	try binding()
		 	setState(73)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == LangParser.Tokens.T__3.rawValue) {
		 		setState(69)
		 		try match(LangParser.Tokens.T__3.rawValue)
		 		setState(70)
		 		try binding()


		 		setState(75)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FuncParamContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(LangParser.Tokens.Identifier.rawValue, 0)
			}
			open
			func typeHint() -> TypeHintContext? {
				return getRuleContext(TypeHintContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LangParser.RULE_funcParam
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterFuncParam(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitFuncParam(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitFuncParam(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitFuncParam(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func funcParam() throws -> FuncParamContext {
		var _localctx: FuncParamContext
		_localctx = FuncParamContext(_ctx, getState())
		try enterRule(_localctx, 12, LangParser.RULE_funcParam)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(76)
		 	try match(LangParser.Tokens.Identifier.rawValue)
		 	setState(78)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == LangParser.Tokens.T__6.rawValue) {
		 		setState(77)
		 		try typeHint()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FuncParamListContext: ParserRuleContext {
			open
			func funcParam() -> [FuncParamContext] {
				return getRuleContexts(FuncParamContext.self)
			}
			open
			func funcParam(_ i: Int) -> FuncParamContext? {
				return getRuleContext(FuncParamContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return LangParser.RULE_funcParamList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterFuncParamList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitFuncParamList(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitFuncParamList(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitFuncParamList(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func funcParamList() throws -> FuncParamListContext {
		var _localctx: FuncParamListContext
		_localctx = FuncParamListContext(_ctx, getState())
		try enterRule(_localctx, 14, LangParser.RULE_funcParamList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(83)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == LangParser.Tokens.Identifier.rawValue) {
		 		setState(80)
		 		try funcParam()


		 		setState(85)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public class ExprContext: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return LangParser.RULE_expr
		}
	}
	public class AdditionExpressionContext: ExprContext {
			open
			func expr() -> [ExprContext] {
				return getRuleContexts(ExprContext.self)
			}
			open
			func expr(_ i: Int) -> ExprContext? {
				return getRuleContext(ExprContext.self, i)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterAdditionExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitAdditionExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitAdditionExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitAdditionExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class NumberExpressionContext: ExprContext {
			open
			func IntegerLiteral() -> TerminalNode? {
				return getToken(LangParser.Tokens.IntegerLiteral.rawValue, 0)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterNumberExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitNumberExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitNumberExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitNumberExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class ConditionalExpressionContext: ExprContext {
			open
			func expr() -> [ExprContext] {
				return getRuleContexts(ExprContext.self)
			}
			open
			func expr(_ i: Int) -> ExprContext? {
				return getRuleContext(ExprContext.self, i)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterConditionalExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitConditionalExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitConditionalExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitConditionalExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class AssignmentExpressionContext: ExprContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(LangParser.Tokens.Identifier.rawValue, 0)
			}
			open
			func expr() -> ExprContext? {
				return getRuleContext(ExprContext.self, 0)
			}
			open
			func typeHint() -> TypeHintContext? {
				return getRuleContext(TypeHintContext.self, 0)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterAssignmentExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitAssignmentExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitAssignmentExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitAssignmentExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class MultiplicationExpressionContext: ExprContext {
			open
			func expr() -> [ExprContext] {
				return getRuleContexts(ExprContext.self)
			}
			open
			func expr(_ i: Int) -> ExprContext? {
				return getRuleContext(ExprContext.self, i)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterMultiplicationExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitMultiplicationExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitMultiplicationExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitMultiplicationExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class ParenExpressionContext: ExprContext {
			open
			func expr() -> ExprContext? {
				return getRuleContext(ExprContext.self, 0)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterParenExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitParenExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitParenExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitParenExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class FuncAppExpressionContext: ExprContext {
			open
			func expr() -> ExprContext? {
				return getRuleContext(ExprContext.self, 0)
			}
			open
			func exprList() -> ExprListContext? {
				return getRuleContext(ExprListContext.self, 0)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterFuncAppExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitFuncAppExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitFuncAppExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitFuncAppExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class BooleanExpressionContext: ExprContext {
			open
			func BooleanLiteral() -> TerminalNode? {
				return getToken(LangParser.Tokens.BooleanLiteral.rawValue, 0)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterBooleanExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitBooleanExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitBooleanExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitBooleanExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class VariableExpressionContext: ExprContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(LangParser.Tokens.Identifier.rawValue, 0)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterVariableExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitVariableExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitVariableExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitVariableExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class FuncDefExpressionContext: ExprContext {
			open
			func funcParamList() -> FuncParamListContext? {
				return getRuleContext(FuncParamListContext.self, 0)
			}
			open
			func expr() -> ExprContext? {
				return getRuleContext(ExprContext.self, 0)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterFuncDefExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitFuncDefExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitFuncDefExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitFuncDefExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class StringExpressionContext: ExprContext {
			open
			func StringLiteral() -> TerminalNode? {
				return getToken(LangParser.Tokens.StringLiteral.rawValue, 0)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterStringExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitStringExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitStringExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitStringExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class SubtractionExpressionContext: ExprContext {
			open
			func expr() -> [ExprContext] {
				return getRuleContexts(ExprContext.self)
			}
			open
			func expr(_ i: Int) -> ExprContext? {
				return getRuleContext(ExprContext.self, i)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterSubtractionExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitSubtractionExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitSubtractionExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitSubtractionExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class LetExpressionContext: ExprContext {
			open
			func bindingList() -> BindingListContext? {
				return getRuleContext(BindingListContext.self, 0)
			}
			open
			func expr() -> ExprContext? {
				return getRuleContext(ExprContext.self, 0)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterLetExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitLetExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitLetExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitLetExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class DivisionExpressionContext: ExprContext {
			open
			func expr() -> [ExprContext] {
				return getRuleContexts(ExprContext.self)
			}
			open
			func expr(_ i: Int) -> ExprContext? {
				return getRuleContext(ExprContext.self, i)
			}

		public
		init(_ ctx: ExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterDivisionExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitDivisionExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitDivisionExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitDivisionExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}

	 public final  func expr( ) throws -> ExprContext   {
		return try expr(0)
	}
	@discardableResult
	private func expr(_ _p: Int) throws -> ExprContext   {
		let _parentctx: ParserRuleContext? = _ctx
		let _parentState: Int = getState()
		var _localctx: ExprContext
		_localctx = ExprContext(_ctx, _parentState)
		var _prevctx: ExprContext = _localctx
		let _startState: Int = 16
		try enterRecursionRule(_localctx, 16, LangParser.RULE_expr, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(120)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,11, _ctx)) {
			case 1:
				_localctx = NumberExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx

				setState(87)
				try match(LangParser.Tokens.IntegerLiteral.rawValue)

				break
			case 2:
				_localctx = StringExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(88)
				try match(LangParser.Tokens.StringLiteral.rawValue)

				break
			case 3:
				_localctx = BooleanExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(89)
				try match(LangParser.Tokens.BooleanLiteral.rawValue)

				break
			case 4:
				_localctx = VariableExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(90)
				try match(LangParser.Tokens.Identifier.rawValue)

				break
			case 5:
				_localctx = ParenExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(91)
				try match(LangParser.Tokens.T__2.rawValue)
				setState(92)
				try expr(0)
				setState(93)
				try match(LangParser.Tokens.T__4.rawValue)

				break
			case 6:
				_localctx = LetExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(95)
				try match(LangParser.Tokens.T__11.rawValue)
				setState(96)
				try bindingList()
				setState(97)
				try match(LangParser.Tokens.T__12.rawValue)
				setState(98)
				try match(LangParser.Tokens.T__13.rawValue)
				setState(99)
				try expr(0)
				setState(100)
				try match(LangParser.Tokens.T__14.rawValue)

				break
			case 7:
				_localctx = FuncDefExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(102)
				try match(LangParser.Tokens.T__15.rawValue)
				setState(103)
				try funcParamList()
				setState(104)
				try match(LangParser.Tokens.T__16.rawValue)
				setState(105)
				try expr(4)

				break
			case 8:
				_localctx = ConditionalExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(107)
				try match(LangParser.Tokens.T__17.rawValue)
				setState(108)
				try expr(0)
				setState(109)
				try match(LangParser.Tokens.T__18.rawValue)
				setState(110)
				try expr(0)
				setState(111)
				try match(LangParser.Tokens.T__19.rawValue)
				setState(112)
				try expr(2)

				break
			case 9:
				_localctx = AssignmentExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(114)
				try match(LangParser.Tokens.Identifier.rawValue)
				setState(116)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				if (_la == LangParser.Tokens.T__6.rawValue) {
					setState(115)
					try typeHint()

				}

				setState(118)
				try match(LangParser.Tokens.T__1.rawValue)
				setState(119)
				try expr(1)

				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(141)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,13,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(139)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,12, _ctx)) {
					case 1:
						_localctx = AdditionExpressionContext(  ExprContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, LangParser.RULE_expr)
						setState(122)
						if (!(precpred(_ctx, 9))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 9)"))
						}
						setState(123)
						try match(LangParser.Tokens.T__7.rawValue)
						setState(124)
						try expr(10)

						break
					case 2:
						_localctx = SubtractionExpressionContext(  ExprContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, LangParser.RULE_expr)
						setState(125)
						if (!(precpred(_ctx, 8))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 8)"))
						}
						setState(126)
						try match(LangParser.Tokens.T__8.rawValue)
						setState(127)
						try expr(9)

						break
					case 3:
						_localctx = MultiplicationExpressionContext(  ExprContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, LangParser.RULE_expr)
						setState(128)
						if (!(precpred(_ctx, 7))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 7)"))
						}
						setState(129)
						try match(LangParser.Tokens.T__9.rawValue)
						setState(130)
						try expr(8)

						break
					case 4:
						_localctx = DivisionExpressionContext(  ExprContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, LangParser.RULE_expr)
						setState(131)
						if (!(precpred(_ctx, 6))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 6)"))
						}
						setState(132)
						try match(LangParser.Tokens.T__10.rawValue)
						setState(133)
						try expr(7)

						break
					case 5:
						_localctx = FuncAppExpressionContext(  ExprContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, LangParser.RULE_expr)
						setState(134)
						if (!(precpred(_ctx, 3))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 3)"))
						}
						setState(135)
						try match(LangParser.Tokens.T__2.rawValue)
						setState(136)
						try exprList()
						setState(137)
						try match(LangParser.Tokens.T__4.rawValue)

						break
					default: break
					}
			 
				}
				setState(143)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,13,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class ExprListContext: ParserRuleContext {
			open
			func expr() -> [ExprContext] {
				return getRuleContexts(ExprContext.self)
			}
			open
			func expr(_ i: Int) -> ExprContext? {
				return getRuleContext(ExprContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return LangParser.RULE_exprList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterExprList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitExprList(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitExprList(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitExprList(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func exprList() throws -> ExprListContext {
		var _localctx: ExprListContext
		_localctx = ExprListContext(_ctx, getState())
		try enterRule(_localctx, 18, LangParser.RULE_exprList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(152)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 61149192) != 0)) {
		 		setState(144)
		 		try expr(0)
		 		setState(149)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == LangParser.Tokens.T__3.rawValue) {
		 			setState(145)
		 			try match(LangParser.Tokens.T__3.rawValue)
		 			setState(146)
		 			try expr(0)


		 			setState(151)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	override open
	func sempred(_ _localctx: RuleContext?, _ ruleIndex: Int,  _ predIndex: Int)throws -> Bool {
		switch (ruleIndex) {
		case  2:
			return try typeExpr_sempred(_localctx?.castdown(TypeExprContext.self), predIndex)
		case  8:
			return try expr_sempred(_localctx?.castdown(ExprContext.self), predIndex)
	    default: return true
		}
	}
	private func typeExpr_sempred(_ _localctx: TypeExprContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 0:return precpred(_ctx, 1)
		    default: return true
		}
	}
	private func expr_sempred(_ _localctx: ExprContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 1:return precpred(_ctx, 9)
		    case 2:return precpred(_ctx, 8)
		    case 3:return precpred(_ctx, 7)
		    case 4:return precpred(_ctx, 6)
		    case 5:return precpred(_ctx, 3)
		    default: return true
		}
	}

	static let _serializedATN:[Int] = [
		4,1,29,155,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,7,
		7,7,2,8,7,8,2,9,7,9,1,0,1,0,5,0,23,8,0,10,0,12,0,26,9,0,1,0,1,0,1,1,1,
		1,1,1,1,1,1,1,1,2,1,2,1,2,1,2,1,2,1,2,5,2,41,8,2,10,2,12,2,44,9,2,3,2,
		46,8,2,1,2,3,2,49,8,2,1,2,1,2,1,2,5,2,54,8,2,10,2,12,2,57,9,2,1,3,1,3,
		1,3,1,4,1,4,3,4,64,8,4,1,4,1,4,1,4,1,5,1,5,1,5,5,5,72,8,5,10,5,12,5,75,
		9,5,1,6,1,6,3,6,79,8,6,1,7,5,7,82,8,7,10,7,12,7,85,9,7,1,8,1,8,1,8,1,8,
		1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,
		8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,3,8,117,8,8,1,8,1,8,3,8,121,8,8,1,8,
		1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,5,8,140,
		8,8,10,8,12,8,143,9,8,1,9,1,9,1,9,5,9,148,8,9,10,9,12,9,151,9,9,3,9,153,
		8,9,1,9,0,2,4,16,10,0,2,4,6,8,10,12,14,16,18,0,0,170,0,24,1,0,0,0,2,29,
		1,0,0,0,4,48,1,0,0,0,6,58,1,0,0,0,8,61,1,0,0,0,10,68,1,0,0,0,12,76,1,0,
		0,0,14,83,1,0,0,0,16,120,1,0,0,0,18,152,1,0,0,0,20,23,3,2,1,0,21,23,3,
		16,8,0,22,20,1,0,0,0,22,21,1,0,0,0,23,26,1,0,0,0,24,22,1,0,0,0,24,25,1,
		0,0,0,25,27,1,0,0,0,26,24,1,0,0,0,27,28,5,0,0,1,28,1,1,0,0,0,29,30,5,1,
		0,0,30,31,5,25,0,0,31,32,5,2,0,0,32,33,3,4,2,0,33,3,1,0,0,0,34,35,6,2,
		-1,0,35,49,5,25,0,0,36,45,5,3,0,0,37,42,3,4,2,0,38,39,5,4,0,0,39,41,3,
		4,2,0,40,38,1,0,0,0,41,44,1,0,0,0,42,40,1,0,0,0,42,43,1,0,0,0,43,46,1,
		0,0,0,44,42,1,0,0,0,45,37,1,0,0,0,45,46,1,0,0,0,46,47,1,0,0,0,47,49,5,
		5,0,0,48,34,1,0,0,0,48,36,1,0,0,0,49,55,1,0,0,0,50,51,10,1,0,0,51,52,5,
		6,0,0,52,54,3,4,2,2,53,50,1,0,0,0,54,57,1,0,0,0,55,53,1,0,0,0,55,56,1,
		0,0,0,56,5,1,0,0,0,57,55,1,0,0,0,58,59,5,7,0,0,59,60,3,4,2,0,60,7,1,0,
		0,0,61,63,5,25,0,0,62,64,3,6,3,0,63,62,1,0,0,0,63,64,1,0,0,0,64,65,1,0,
		0,0,65,66,5,2,0,0,66,67,3,16,8,0,67,9,1,0,0,0,68,73,3,8,4,0,69,70,5,4,
		0,0,70,72,3,8,4,0,71,69,1,0,0,0,72,75,1,0,0,0,73,71,1,0,0,0,73,74,1,0,
		0,0,74,11,1,0,0,0,75,73,1,0,0,0,76,78,5,25,0,0,77,79,3,6,3,0,78,77,1,0,
		0,0,78,79,1,0,0,0,79,13,1,0,0,0,80,82,3,12,6,0,81,80,1,0,0,0,82,85,1,0,
		0,0,83,81,1,0,0,0,83,84,1,0,0,0,84,15,1,0,0,0,85,83,1,0,0,0,86,87,6,8,
		-1,0,87,121,5,21,0,0,88,121,5,23,0,0,89,121,5,24,0,0,90,121,5,25,0,0,91,
		92,5,3,0,0,92,93,3,16,8,0,93,94,5,5,0,0,94,121,1,0,0,0,95,96,5,12,0,0,
		96,97,3,10,5,0,97,98,5,13,0,0,98,99,5,14,0,0,99,100,3,16,8,0,100,101,5,
		15,0,0,101,121,1,0,0,0,102,103,5,16,0,0,103,104,3,14,7,0,104,105,5,17,
		0,0,105,106,3,16,8,4,106,121,1,0,0,0,107,108,5,18,0,0,108,109,3,16,8,0,
		109,110,5,19,0,0,110,111,3,16,8,0,111,112,5,20,0,0,112,113,3,16,8,2,113,
		121,1,0,0,0,114,116,5,25,0,0,115,117,3,6,3,0,116,115,1,0,0,0,116,117,1,
		0,0,0,117,118,1,0,0,0,118,119,5,2,0,0,119,121,3,16,8,1,120,86,1,0,0,0,
		120,88,1,0,0,0,120,89,1,0,0,0,120,90,1,0,0,0,120,91,1,0,0,0,120,95,1,0,
		0,0,120,102,1,0,0,0,120,107,1,0,0,0,120,114,1,0,0,0,121,141,1,0,0,0,122,
		123,10,9,0,0,123,124,5,8,0,0,124,140,3,16,8,10,125,126,10,8,0,0,126,127,
		5,9,0,0,127,140,3,16,8,9,128,129,10,7,0,0,129,130,5,10,0,0,130,140,3,16,
		8,8,131,132,10,6,0,0,132,133,5,11,0,0,133,140,3,16,8,7,134,135,10,3,0,
		0,135,136,5,3,0,0,136,137,3,18,9,0,137,138,5,5,0,0,138,140,1,0,0,0,139,
		122,1,0,0,0,139,125,1,0,0,0,139,128,1,0,0,0,139,131,1,0,0,0,139,134,1,
		0,0,0,140,143,1,0,0,0,141,139,1,0,0,0,141,142,1,0,0,0,142,17,1,0,0,0,143,
		141,1,0,0,0,144,149,3,16,8,0,145,146,5,4,0,0,146,148,3,16,8,0,147,145,
		1,0,0,0,148,151,1,0,0,0,149,147,1,0,0,0,149,150,1,0,0,0,150,153,1,0,0,
		0,151,149,1,0,0,0,152,144,1,0,0,0,152,153,1,0,0,0,153,19,1,0,0,0,16,22,
		24,42,45,48,55,63,73,78,83,116,120,139,141,149,152
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}