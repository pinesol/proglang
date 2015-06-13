/* lisp.l
Lisp Lexer
Alex Pine
Programming Languages, Summer 2015
*/
%{
#include <iostream>
#include <stdlib.h>
#include "lisp.tab.h"
%}

%option noyywrap

%%

[0-9]+                  { yylval.val = atoi(yytext); return NUM; }
"+"                     { return PLUS; }
"-"                     { return MINUS; }
"*"                     { return MUL; }
"/"                     { return DIV; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
[ \t\r\n]+              { /* Ignore white characters. */ }
.                       { std::cerr << "Invalid token" << std::endl; exit(1); }

%%
