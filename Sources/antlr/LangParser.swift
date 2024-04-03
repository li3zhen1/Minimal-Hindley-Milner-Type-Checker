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
                 IntegerLiteral = 18, RealLiteral = 19, StringLiteral = 20, 
                 BooleanLiteral = 21, BinaryOperator = 22, Identifier = 23, 
                 Alpha = 24, Digit = 25, Whitespace = 26, Comment = 27
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
		nil, "'type'", "'='", "'('", "')'", "','", "'|'", "'->'", "':'", "'let'", 
		"'in'", "'{'", "'}'", "'func'", "'=>'", "'if'", "'then'", "'else'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, "IntegerLiteral", "RealLiteral", "StringLiteral", 
		"BooleanLiteral", "BinaryOperator", "Identifier", "Alpha", "Digit", "Whitespace", 
		"Comment"
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
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 11837962) != 0)) {
		 		setState(22)
		 		try _errHandler.sync(self)
		 		switch (LangParser.Tokens(rawValue: try _input.LA(1))!) {
		 		case .T__0:
		 			setState(20)
		 			try typeDef()

		 			break
		 		case .T__2:fallthrough
		 		case .T__8:fallthrough
		 		case .T__12:fallthrough
		 		case .T__14:fallthrough
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
	public class ParenTypeExprContext: TypeExprContext {
			open
			func typeExpr() -> TypeExprContext? {
				return getRuleContext(TypeExprContext.self, 0)
			}

		public
		init(_ ctx: TypeExprContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.enterParenTypeExpr(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitParenTypeExpr(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitParenTypeExpr(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitParenTypeExpr(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
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
		public var lhs: TypeExprContext!
		public var rhs: TypeExprContext!
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
	public class FuncTypeContext: TypeExprContext {
		public var arg: TypeExprContext!
		public var ret: TypeExprContext!
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
				listener.enterFuncType(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitFuncType(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitFuncType(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitFuncType(self)
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
			setState(52)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,4, _ctx)) {
			case 1:
				_localctx = AliasingContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx

				setState(35)
				try match(LangParser.Tokens.Identifier.rawValue)

				break
			case 2:
				_localctx = ParenTypeExprContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(36)
				try match(LangParser.Tokens.T__2.rawValue)
				setState(37)
				try typeExpr(0)
				setState(38)
				try match(LangParser.Tokens.T__3.rawValue)

				break
			case 3:
				_localctx = ProductTypeContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(40)
				try match(LangParser.Tokens.T__2.rawValue)
				setState(49)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				if (_la == LangParser.Tokens.T__2.rawValue || _la == LangParser.Tokens.Identifier.rawValue) {
					setState(41)
					try typeExpr(0)
					setState(46)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
					while (_la == LangParser.Tokens.T__4.rawValue) {
						setState(42)
						try match(LangParser.Tokens.T__4.rawValue)
						setState(43)
						try typeExpr(0)


						setState(48)
						try _errHandler.sync(self)
						_la = try _input.LA(1)
					}

				}

				setState(51)
				try match(LangParser.Tokens.T__3.rawValue)

				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(62)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,6,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(60)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,5, _ctx)) {
					case 1:
						_localctx = SumTypeContext(  TypeExprContext(_parentctx, _parentState))
						(_localctx as! SumTypeContext).lhs = _prevctx
						try pushNewRecursionContext(_localctx, _startState, LangParser.RULE_typeExpr)
						setState(54)
						if (!(precpred(_ctx, 2))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 2)"))
						}
						setState(55)
						try match(LangParser.Tokens.T__5.rawValue)
						setState(56)
						try {
								let assignmentValue = try typeExpr(3)
								_localctx.castdown(SumTypeContext.self).rhs = assignmentValue
						     }()


						break
					case 2:
						_localctx = FuncTypeContext(  TypeExprContext(_parentctx, _parentState))
						(_localctx as! FuncTypeContext).arg = _prevctx
						try pushNewRecursionContext(_localctx, _startState, LangParser.RULE_typeExpr)
						setState(57)
						if (!(precpred(_ctx, 1))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
						}
						setState(58)
						try match(LangParser.Tokens.T__6.rawValue)
						setState(59)
						try {
								let assignmentValue = try typeExpr(2)
								_localctx.castdown(FuncTypeContext.self).ret = assignmentValue
						     }()


						break
					default: break
					}
			 
				}
				setState(64)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,6,_ctx)
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
		 	setState(65)
		 	try match(LangParser.Tokens.T__7.rawValue)
		 	setState(66)
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
		 	setState(68)
		 	try match(LangParser.Tokens.Identifier.rawValue)
		 	setState(70)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == LangParser.Tokens.T__7.rawValue) {
		 		setState(69)
		 		try typeHint()

		 	}

		 	setState(72)
		 	try match(LangParser.Tokens.T__1.rawValue)
		 	setState(73)
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
		 	setState(75)
		 	try binding()
		 	setState(80)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == LangParser.Tokens.T__4.rawValue) {
		 		setState(76)
		 		try match(LangParser.Tokens.T__4.rawValue)
		 		setState(77)
		 		try binding()


		 		setState(82)
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
		 	setState(83)
		 	try match(LangParser.Tokens.Identifier.rawValue)
		 	setState(85)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == LangParser.Tokens.T__7.rawValue) {
		 		setState(84)
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
		 	setState(90)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == LangParser.Tokens.Identifier.rawValue) {
		 		setState(87)
		 		try funcParam()


		 		setState(92)
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
	public class BinaryExpressionContext: ExprContext {
		public var lhs: ExprContext!
		public var rhs: ExprContext!
			open
			func BinaryOperator() -> TerminalNode? {
				return getToken(LangParser.Tokens.BinaryOperator.rawValue, 0)
			}
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
				listener.enterBinaryExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitBinaryExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitBinaryExpression(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitBinaryExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class ExpressionListContext: ExprContext {
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
				listener.enterExpressionList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitExpressionList(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitExpressionList(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitExpressionList(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class StringLiteralContext: ExprContext {
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
				listener.enterStringLiteral(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitStringLiteral(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitStringLiteral(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitStringLiteral(self)
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
	public class IntegerLiteralContext: ExprContext {
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
				listener.enterIntegerLiteral(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitIntegerLiteral(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitIntegerLiteral(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitIntegerLiteral(self)
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
		public var function: ExprContext!
		public var arg: ExprContext!
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
	public class BooleanLiteralContext: ExprContext {
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
				listener.enterBooleanLiteral(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LangListener {
				listener.exitBooleanLiteral(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? LangVisitor {
			    return visitor.visitBooleanLiteral(self)
			}
			else if let visitor = visitor as? LangBaseVisitor {
			    return visitor.visitBooleanLiteral(self)
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
			setState(128)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,12, _ctx)) {
			case 1:
				_localctx = IntegerLiteralContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx

				setState(94)
				try match(LangParser.Tokens.IntegerLiteral.rawValue)

				break
			case 2:
				_localctx = StringLiteralContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(95)
				try match(LangParser.Tokens.StringLiteral.rawValue)

				break
			case 3:
				_localctx = BooleanLiteralContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(96)
				try match(LangParser.Tokens.BooleanLiteral.rawValue)

				break
			case 4:
				_localctx = VariableExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(97)
				try match(LangParser.Tokens.Identifier.rawValue)

				break
			case 5:
				_localctx = ParenExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(98)
				try match(LangParser.Tokens.T__2.rawValue)
				setState(99)
				try expr(0)
				setState(100)
				try match(LangParser.Tokens.T__3.rawValue)

				break
			case 6:
				_localctx = ExpressionListContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(102)
				try exprList()

				break
			case 7:
				_localctx = LetExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(103)
				try match(LangParser.Tokens.T__8.rawValue)
				setState(104)
				try bindingList()
				setState(105)
				try match(LangParser.Tokens.T__9.rawValue)
				setState(106)
				try match(LangParser.Tokens.T__10.rawValue)
				setState(107)
				try expr(0)
				setState(108)
				try match(LangParser.Tokens.T__11.rawValue)

				break
			case 8:
				_localctx = FuncDefExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(110)
				try match(LangParser.Tokens.T__12.rawValue)
				setState(111)
				try funcParamList()
				setState(112)
				try match(LangParser.Tokens.T__13.rawValue)
				setState(113)
				try expr(4)

				break
			case 9:
				_localctx = ConditionalExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(115)
				try match(LangParser.Tokens.T__14.rawValue)
				setState(116)
				try expr(0)
				setState(117)
				try match(LangParser.Tokens.T__15.rawValue)
				setState(118)
				try expr(0)
				setState(119)
				try match(LangParser.Tokens.T__16.rawValue)
				setState(120)
				try expr(2)

				break
			case 10:
				_localctx = AssignmentExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(122)
				try match(LangParser.Tokens.Identifier.rawValue)
				setState(124)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				if (_la == LangParser.Tokens.T__7.rawValue) {
					setState(123)
					try typeHint()

				}

				setState(126)
				try match(LangParser.Tokens.T__1.rawValue)
				setState(127)
				try expr(1)

				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(137)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,14,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(135)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,13, _ctx)) {
					case 1:
						_localctx = BinaryExpressionContext(  ExprContext(_parentctx, _parentState))
						(_localctx as! BinaryExpressionContext).lhs = _prevctx
						try pushNewRecursionContext(_localctx, _startState, LangParser.RULE_expr)
						setState(130)
						if (!(precpred(_ctx, 6))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 6)"))
						}
						setState(131)
						try match(LangParser.Tokens.BinaryOperator.rawValue)
						setState(132)
						try {
								let assignmentValue = try expr(7)
								_localctx.castdown(BinaryExpressionContext.self).rhs = assignmentValue
						     }()


						break
					case 2:
						_localctx = FuncAppExpressionContext(  ExprContext(_parentctx, _parentState))
						(_localctx as! FuncAppExpressionContext).function = _prevctx
						try pushNewRecursionContext(_localctx, _startState, LangParser.RULE_expr)
						setState(133)
						if (!(precpred(_ctx, 3))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 3)"))
						}
						setState(134)
						try {
								let assignmentValue = try expr(4)
								_localctx.castdown(FuncAppExpressionContext.self).arg = assignmentValue
						     }()


						break
					default: break
					}
			 
				}
				setState(139)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,14,_ctx)
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
		 	setState(140)
		 	try match(LangParser.Tokens.T__2.rawValue)
		 	setState(149)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 11837960) != 0)) {
		 		setState(141)
		 		try expr(0)
		 		setState(146)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == LangParser.Tokens.T__4.rawValue) {
		 			setState(142)
		 			try match(LangParser.Tokens.T__4.rawValue)
		 			setState(143)
		 			try expr(0)


		 			setState(148)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(151)
		 	try match(LangParser.Tokens.T__3.rawValue)

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
		    case 0:return precpred(_ctx, 2)
		    case 1:return precpred(_ctx, 1)
		    default: return true
		}
	}
	private func expr_sempred(_ _localctx: ExprContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 2:return precpred(_ctx, 6)
		    case 3:return precpred(_ctx, 3)
		    default: return true
		}
	}

	static let _serializedATN:[Int] = [
		4,1,27,154,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,7,
		7,7,2,8,7,8,2,9,7,9,1,0,1,0,5,0,23,8,0,10,0,12,0,26,9,0,1,0,1,0,1,1,1,
		1,1,1,1,1,1,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,5,2,45,8,2,10,2,
		12,2,48,9,2,3,2,50,8,2,1,2,3,2,53,8,2,1,2,1,2,1,2,1,2,1,2,1,2,5,2,61,8,
		2,10,2,12,2,64,9,2,1,3,1,3,1,3,1,4,1,4,3,4,71,8,4,1,4,1,4,1,4,1,5,1,5,
		1,5,5,5,79,8,5,10,5,12,5,82,9,5,1,6,1,6,3,6,86,8,6,1,7,5,7,89,8,7,10,7,
		12,7,92,9,7,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,
		8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,3,8,
		125,8,8,1,8,1,8,3,8,129,8,8,1,8,1,8,1,8,1,8,1,8,5,8,136,8,8,10,8,12,8,
		139,9,8,1,9,1,9,1,9,1,9,5,9,145,8,9,10,9,12,9,148,9,9,3,9,150,8,9,1,9,
		1,9,1,9,0,2,4,16,10,0,2,4,6,8,10,12,14,16,18,0,0,169,0,24,1,0,0,0,2,29,
		1,0,0,0,4,52,1,0,0,0,6,65,1,0,0,0,8,68,1,0,0,0,10,75,1,0,0,0,12,83,1,0,
		0,0,14,90,1,0,0,0,16,128,1,0,0,0,18,140,1,0,0,0,20,23,3,2,1,0,21,23,3,
		16,8,0,22,20,1,0,0,0,22,21,1,0,0,0,23,26,1,0,0,0,24,22,1,0,0,0,24,25,1,
		0,0,0,25,27,1,0,0,0,26,24,1,0,0,0,27,28,5,0,0,1,28,1,1,0,0,0,29,30,5,1,
		0,0,30,31,5,23,0,0,31,32,5,2,0,0,32,33,3,4,2,0,33,3,1,0,0,0,34,35,6,2,
		-1,0,35,53,5,23,0,0,36,37,5,3,0,0,37,38,3,4,2,0,38,39,5,4,0,0,39,53,1,
		0,0,0,40,49,5,3,0,0,41,46,3,4,2,0,42,43,5,5,0,0,43,45,3,4,2,0,44,42,1,
		0,0,0,45,48,1,0,0,0,46,44,1,0,0,0,46,47,1,0,0,0,47,50,1,0,0,0,48,46,1,
		0,0,0,49,41,1,0,0,0,49,50,1,0,0,0,50,51,1,0,0,0,51,53,5,4,0,0,52,34,1,
		0,0,0,52,36,1,0,0,0,52,40,1,0,0,0,53,62,1,0,0,0,54,55,10,2,0,0,55,56,5,
		6,0,0,56,61,3,4,2,3,57,58,10,1,0,0,58,59,5,7,0,0,59,61,3,4,2,2,60,54,1,
		0,0,0,60,57,1,0,0,0,61,64,1,0,0,0,62,60,1,0,0,0,62,63,1,0,0,0,63,5,1,0,
		0,0,64,62,1,0,0,0,65,66,5,8,0,0,66,67,3,4,2,0,67,7,1,0,0,0,68,70,5,23,
		0,0,69,71,3,6,3,0,70,69,1,0,0,0,70,71,1,0,0,0,71,72,1,0,0,0,72,73,5,2,
		0,0,73,74,3,16,8,0,74,9,1,0,0,0,75,80,3,8,4,0,76,77,5,5,0,0,77,79,3,8,
		4,0,78,76,1,0,0,0,79,82,1,0,0,0,80,78,1,0,0,0,80,81,1,0,0,0,81,11,1,0,
		0,0,82,80,1,0,0,0,83,85,5,23,0,0,84,86,3,6,3,0,85,84,1,0,0,0,85,86,1,0,
		0,0,86,13,1,0,0,0,87,89,3,12,6,0,88,87,1,0,0,0,89,92,1,0,0,0,90,88,1,0,
		0,0,90,91,1,0,0,0,91,15,1,0,0,0,92,90,1,0,0,0,93,94,6,8,-1,0,94,129,5,
		18,0,0,95,129,5,20,0,0,96,129,5,21,0,0,97,129,5,23,0,0,98,99,5,3,0,0,99,
		100,3,16,8,0,100,101,5,4,0,0,101,129,1,0,0,0,102,129,3,18,9,0,103,104,
		5,9,0,0,104,105,3,10,5,0,105,106,5,10,0,0,106,107,5,11,0,0,107,108,3,16,
		8,0,108,109,5,12,0,0,109,129,1,0,0,0,110,111,5,13,0,0,111,112,3,14,7,0,
		112,113,5,14,0,0,113,114,3,16,8,4,114,129,1,0,0,0,115,116,5,15,0,0,116,
		117,3,16,8,0,117,118,5,16,0,0,118,119,3,16,8,0,119,120,5,17,0,0,120,121,
		3,16,8,2,121,129,1,0,0,0,122,124,5,23,0,0,123,125,3,6,3,0,124,123,1,0,
		0,0,124,125,1,0,0,0,125,126,1,0,0,0,126,127,5,2,0,0,127,129,3,16,8,1,128,
		93,1,0,0,0,128,95,1,0,0,0,128,96,1,0,0,0,128,97,1,0,0,0,128,98,1,0,0,0,
		128,102,1,0,0,0,128,103,1,0,0,0,128,110,1,0,0,0,128,115,1,0,0,0,128,122,
		1,0,0,0,129,137,1,0,0,0,130,131,10,6,0,0,131,132,5,22,0,0,132,136,3,16,
		8,7,133,134,10,3,0,0,134,136,3,16,8,4,135,130,1,0,0,0,135,133,1,0,0,0,
		136,139,1,0,0,0,137,135,1,0,0,0,137,138,1,0,0,0,138,17,1,0,0,0,139,137,
		1,0,0,0,140,149,5,3,0,0,141,146,3,16,8,0,142,143,5,5,0,0,143,145,3,16,
		8,0,144,142,1,0,0,0,145,148,1,0,0,0,146,144,1,0,0,0,146,147,1,0,0,0,147,
		150,1,0,0,0,148,146,1,0,0,0,149,141,1,0,0,0,149,150,1,0,0,0,150,151,1,
		0,0,0,151,152,5,4,0,0,152,19,1,0,0,0,17,22,24,46,49,52,60,62,70,80,85,
		90,124,128,135,137,146,149
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}