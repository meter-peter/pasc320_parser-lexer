grammar test;

header : (PROGRAM IDENT SEMI)+;
PROGRAM : 'program';

IDENT: '_'?('a' .. 'z' | 'A' .. 'Z')('a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_')*;

SEMI: ';';
NEWLINE: '\n' ->skip;
WS:' ' ->skip;