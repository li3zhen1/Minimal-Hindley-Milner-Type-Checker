lexer grammar LangLex;

IntegerLiteral : Digit ( Digit )* ;

RealLiteral : IntegerLiteral '.' IntegerLiteral ;

StringLiteral : '"' (.)*? '"' ;

BooleanLiteral: 'true' | 'false' ;

BinaryOperator: '+' | '-' | '*' | '/' | '&&' | '||' | '^' ;

Identifier : Alpha ( Digit | Alpha )* ;

Alpha : [a-zA-Z] ;

Digit : [0-9] ;

Whitespace : [ \t\r\n]+ -> skip ;

Comment : '/*' (.)*? '*/' -> skip ;