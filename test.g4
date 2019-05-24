grammar test;

init: rconst;

rconst: rdecimal | rbinaty | rhexademical;

rdecimal : FLOAT | EXPONENT;
rbinaty : RBINARY;
rhexademical : RHEXADECIMAL;


FLOAT : ('0'|[1-9]DIGIT*)?(EXPONENT | ('.')('0'|'0'*[1-9]DIGIT*));

RBINARY : ('0B')('0'|'1'[0-1]*)?('.')('0'|'0'*'1'[0-1]*);

RHEXADECIMAL : ('0H')([1-9A-F]HEXDIGIT*)?('.')('0'|'0'*[1-9A-F]HEXDIGIT*);

DIGIT : [0-9];

HEXDIGIT : [0-9A-F];

EXPONENT : ('0'|[1-9]DIGIT*)'E'[+-]?DIGIT+;