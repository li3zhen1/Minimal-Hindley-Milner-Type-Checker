grammar Lang;

import LangLex;

program      : (typeDef | expr)* EOF;

typeDef      : 'type' Identifier '=' typeExpr ;

typeExpr     : Identifier                                         # aliasing
             | '(' (typeExpr (',' typeExpr)*)? ')'                # productType
             | typeExpr '|' typeExpr                              # sumType
             ;

typeHint     : ':' typeExpr ;

binding      : Identifier typeHint? '=' expr ;
bindingList  : binding (',' binding)* ;

funcParam    : Identifier typeHint? ;
funcParamList: funcParam* ;

expr         : IntegerLiteral                                     # integerLiteral
             | StringLiteral                                      # stringLiteral
             | BooleanLiteral                                     # booleanLiteral
             | Identifier                                         # variableExpression
             | '(' expr ')'                                       # parenExpression
             | expr BinaryOperator expr                           # binaryExpression
             | 'let' bindingList 'in' '{' expr '}'                # letExpression
             | 'func' funcParamList '=>' expr                     # funcDefExpression
             | expr '(' exprList ')'                              # funcAppExpression
             | 'if' expr 'then' expr 'else' expr                  # conditionalExpression
             | Identifier typeHint? '=' expr                      # assignmentExpression
             ;

exprList     : (expr (',' expr)*)? ;