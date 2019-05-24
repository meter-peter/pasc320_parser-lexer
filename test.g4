grammar test;

init: rconst;

rconst: dec | rdecimal | rbinaty | rhexademical;

rdecimal : RDECIMAL;
rbinaty : RBINARY;
rhexademical : RHEXADECIMAL;
exponent : EXPONENT ;

RDECIMAL : ('0'|[1-9]DIGIT*)?('.')('0'|'0'*[1-9]DIGIT*);

RBINARY : ('0B')('0'|'1'[0-1]*)?('.')('0'|'0'*'1'[0-1]*);

RHEXADECIMAL : ('0H')([1-9A-F](HEXDIGIT*)?)?(.)('0'|'0'*[1-9A-F]HEXDIGIT*);

DIGIT : [0-9];

HEXDIGIT : [0-9A-F];

EXPONENT : ('0'|[1-9]DIGIT*)('E'[+-]?DIGIT+)?;