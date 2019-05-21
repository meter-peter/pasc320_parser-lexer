grammar pasc320;

program : header declarations subprograms comp_statements DOT ;

header : PROGRAM ID SEMI;

declarations : constdefs typedefs vardefs;

constdefs: CONST constant_defs SEMI; //e

constant_defs : constant_defs SEMI ID EQU expression
    | ID EQU expression
    ;

expression : expression RELOP expression
    |expression EQU expression
    |expression INOP expression
    |expression OROP expression
    |expression ADDOP expression
    |expression MULDIVANDOP expression
    |ADDOP expression
    |NOTOP expression
    |variable
    |ID LPAREN expressions RPAREN
    |constant
    |LPAREN expression RPAREN
    |setexpression
    ;

variable : ID
    |variable DOT ID
    |variable LBRACK expressions RBRACK;

expressions: expressions COMMA expression
    |expression
    ;

constant : ICONST
    |RCONST
    |BCONST
    |CCONST
    ;

setexpression : LBRACK elexpressions COMMA expression
    |expression
    ;

elexpressions : elexpressions COMMA elexpression
    |elexpression
    ;

elexpression : expression DOTDOT expression
    |elexpression
    ;

typedefs : TYPE type_defs SEMI;//e

type_defs :type_defs SEMI ID EQU type_def
    |ID EQU type_defs
    ;

type_def : ARRAY LBRACK dims RBRACK OF typename
    |SET OF typename
    ;











