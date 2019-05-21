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
    |RECORD fields END
    |LPAREN identifiers RPAREN
    |limit DOTDOT limit
    ;

dims : dims COMMA limits
    |LPAREN identifiers RPAREN
    |limit DOTDOT limit
    ;

limit : ADDOP ICONST
   |ADDOP ID
   |ICONST
   |CCONST
   |BCONST
   |ID
   ;

typename : standard_type
    |ID
    ;

standard_type : INTEGER | REAL | BOOLEAN | CHAR;

fields: fields SEMI fields
    |field
    ;

field : identifiers COLON typename;

identifiers : identifiers COMMA ID
    |ID
    ;

vardefs : VAR variable_defs SEMI; //e

variable_defs : variable_defs SEMI identifiers COLON typename
    |identifiers COLON typename
    ;

subprograms : subprogram+ SEMI; //e

sub_header : FUNCTION ID formal_parameters COLON standard_type
    |PROCEDURE ID foraml_parameters
    | FUNCTION ID
    ;

formal_parameters: LPAREN parameter_list RPAREN; //e

parameter_list : parameter_list SEMI pass identifiers COLON typename
    | pass identifiers COLON typename
    ;

pass : VAR //e

<<<<<<< Updated upstream
comp_statement : BEGIN statements END;
=======
ID :

>>>>>>> Stashed changes

statements : statements SEMI statement | statement;

statement: assignment
    |if_statement
    |while_statement
    |for_statement
    |with_statement
    |subprogram_call
    |io_statement
    |comp_statement
    ; //e

assignment : variable ASSIGN expression
    |VARIABLE ASSIGN STRING
    ;

if_statement:IF expression THEN statement if_tail;

if_tail : ELSE statement; //e

for_statement : FOR ID ASSIGN iter_space DO statement;

while_statement : WHILE expression DO statement;

iter_space : expression TO expression
    |expression DOWNTO expression;

with_statement : WITH variable DO statement;

subprogram_call : ID
    | ID LPAREN expressions RPAREN
    ;

io_statement : READ LPAREN read_list;

read_list :read_ list COMMA read_item
    |write_item
    ;

read_item : variable;

write_list : write_list COMMA write_item
    |write_item
    ;

write_item : expression
    |STRING
    ;



ID : ^_?[a-z][a-z0-9_]*.[^_]$;
ICONST : DECIMAL | HEXBIN;
DECIMAL : ^(0$ | ([1-9][0-9]*)$);
HEXBIN : ^(0B1[01]*|0H[1-9][1-9A-F]*);







