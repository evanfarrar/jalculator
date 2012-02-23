/* description: Parses end executes mathematical expressions. */

/* lexical grammar */
%lex

%%
\s+                   /* skip whitespace */
[0-9]+("."[0-9]+)?\b  return 'NUMBER';
"*"                   return '*';
"/"                   return '/';
"-"                   return '-';
"+"                   return '+';
"^"                   return '^';
"("                   return '(';
")"                   return ')';
"PI"                  return 'PI';
"E"                   return 'E';
<<EOF>>               return 'EOF';

/lex

/* operator associations and precedence */

%left '+' '-'
%left '*' '/'
%left '^'
%left UMINUS

%start expressions

%% /* language grammar */

expressions
    : e EOF
        {console.log($1); return $1;}
    ;

e
    : '+' e e
        {$$ = $2+$3;}
    | '-' e e
        {$$ = $2-$3;}
    | '*' e e
        {$$ = $2*$3;}
    | '/' e e
        {$$ = $2/$3;}
    | '^' e e
        {$$ = Math.pow($2, $3);}
    | NUMBER
        {$$ = Number(yytext);}
    ;
