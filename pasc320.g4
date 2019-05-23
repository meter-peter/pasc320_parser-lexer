grammar pasc320;


//parser rules
program : header declarations subprograms comp_statement DOT ;

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

setexpression : LBRACK elexpressions RBRACK
    | LBRACK RBRACK
    ;

elexpressions : elexpressions COMMA elexpression
    |elexpression
    ;

elexpression : expression DOTDOT expression
    |expression
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

limits: limit DOTDOT limit | IDENT;

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

subprogram :sub_header SEMI FORWARD
    |sub_header SEMI declarations subprograms comp_statement
    ;

sub_header : FUNCTION ID formal_parameters COLON standard_type
    |PROCEDURE ID formal_parameters
    | FUNCTION ID
    ;

formal_parameters: LPAREN parameter_list RPAREN; //e

parameter_list : parameter_list SEMI pass identifiers COLON typename
    | pass identifiers COLON typename
    ;

pass : VAR; //e

comp_statement : BEGIN statements END;

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

read_list :read_list COMMA read_item
    |write_item
    ;

read_item : variable;

write_list : write_list COMMA write_item
    |write_item
    ;

write_item : expression
    |STRING
    ;





//lexer


fragment A
   : ('a' | 'A')
   ;


fragment B
   : ('b' | 'B')
   ;


fragment C
   : ('c' | 'C')
   ;


fragment D
   : ('d' | 'D')
   ;


fragment E
   : ('e' | 'E')
   ;


fragment F
   : ('f' | 'F')
   ;


fragment G
   : ('g' | 'G')
   ;


fragment H
   : ('h' | 'H')
   ;


fragment I
   : ('i' | 'I')
   ;


fragment J
   : ('j' | 'J')
   ;


fragment K
   : ('k' | 'K')
   ;


fragment L
   : ('l' | 'L')
   ;


fragment M
   : ('m' | 'M')
   ;


fragment N
   : ('n' | 'N')
   ;


fragment O
   : ('o' | 'O')
   ;


fragment P
   : ('p' | 'P')
   ;


fragment Q
   : ('q' | 'Q')
   ;


fragment R
   : ('r' | 'R')
   ;


fragment S
   : ('s' | 'S')
   ;


fragment T
   : ('t' | 'T')
   ;


fragment U
   : ('u' | 'U')
   ;


fragment V
   : ('v' | 'V')
   ;


fragment W
   : ('w' | 'W')
   ;


fragment X
   : ('x' | 'X')
   ;


fragment Y
   : ('y' | 'Y')
   ;


fragment Z
   : ('z' | 'Z')
   ;




PROGRAM : P R O G R A M ;

CONST : C O N S T ;

TYPE : T Y P E ;

ARRAY : A R R A Y;

SET : S E T ;

OF : O F ;

RECORD : R E C O R D ;

VAR : V A R;

FORWARD : F O R W A R D ;

FUNCTION : F U N C T I O N ;

PROCEDURE : P R O C E D U R E;

INTEGER : I N T E G E R;

REAL : R E A L ;

BOOLEAN : B O O L E A N ;

CHAR : C H A R ;

BEGIN : B E G I N ;

END : E N D ;

IF : I F ;

THEN : T H E N ;

ELSE: E L S E ;

WHILE: W H I L E ;

DO : D O ;

FOR : F O R ;

DOWNTO : D O W N T O ;

TO : T O ;

WITH :  W I T H ;

READ : R E A D ;

WRITE : W R I T E ;

KEYWORDS : PROGRAM
    |CONST
    |TYPE
    |ARRAY
    |SET
    |OF
    |RECORD
    |VAR
    |FORWARD
    |FUNCTION
    |PROCEDURE
    |INTEGER
    |REAL
    |BOOLEAN
    |CHAR
    |BEGIN
    |END
    |IF
    |THEN
    |ELSE
    |WHILE
    |DO
    |FOR
    |DOWNTO
    |TO
    |WITH
    |READ
    |WRITE
    ;


IDENT: '_'?('a' .. 'z' | 'A' .. 'Z') ('a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_')*;

LETTER:	[A-Za-z_];

DIGIT :	[0-9];

LETTERDIGIT : (LETTER|DIGIT);

SEMI: ';';

EQUAL: '=';

NOT_EQUAL: '<>';

LT: '<';

LE:'<=';

GE: '>=';

GT: '>';

RELOP: LT|LE|GE|GT|EQUAL|NOT_EQUAL;




