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

expr         : IntegerLiteral                                     # numberExpression
             | StringLiteral                                      # stringExpression
             | BooleanLiteral                                     # booleanExpression
             | Identifier                                         # variableExpression
             | '(' expr ')'                                       # parenExpression
             | expr '+' expr                                      # additionExpression
             | expr '-' expr                                      # subtractionExpression
             | expr '*' expr                                      # multiplicationExpression
             | expr '/' expr                                      # divisionExpression
             | 'let' bindingList 'in' '{' expr '}'                # letExpression
             | 'func' funcParamList '=>' expr                     # funcDefExpression
             | expr '(' exprList ')'                              # funcAppExpression
             | 'if' expr 'then' expr 'else' expr                  # conditionalExpression
             | Identifier typeHint? '=' expr                      # assignmentExpression
             ;

exprList     : (expr (',' expr)*)? ;