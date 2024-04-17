grammar Lang;

import LangLex;

program      : (typeDef | expr)* EOF;

typeDef      : 'type' Identifier '=' typeExpr ;

typeExpr     : Identifier                                         # aliasing
             | '(' typeExpr ')'                                   # parenTypeExpr
             | '(' (typeExpr (',' typeExpr)*)? ')'                # productType
             | lhs=typeExpr '|' rhs=typeExpr                      # sumType
             | <assoc=right> arg=typeExpr '->' ret=typeExpr       # funcType
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
             | object=expr '.' index=IntegerLiteral               # memberExpression
             | exprList                                           # expressionList
             | lhs=expr BinaryOperator rhs=expr                   # binaryExpression
             | 'let' bindingList 'in' '{' expr '}'                # letExpression
             | function=expr arg=expr                             # funcAppExpression
             | 'func' funcParamList '=>' expr                     # funcDefExpression
             | 'if' expr 'then' expr 'else' expr                  # conditionalExpression
             | Identifier typeHint? '=' expr                      # assignmentExpression
             ;

exprList     : '(' (expr (',' expr)*)? ')' ;