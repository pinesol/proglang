/* xml.l 
Alex Pine
Programming Languages, Summer 2015
*/
%{
#include <iostream>
#include <stdlib.h>
#define YY_DECL extern "C" int yylex()

#include "xml.tab.h"
%}

%option noyywrap

%%

"</"[0-9a-zA-Z/.=:"]+[ \t\r\n0-9a-zA-Z/.=:"]*">" { yylval.sval = strdup(yytext); return CLOSE; }
"<"[0-9a-zA-Z/.=:"]+[ \t\r\n0-9a-zA-Z/.=:"]*">"  { yylval.sval = strdup(yytext); return OPEN; }
[ \t\r\n]+                                       { /* Ignore blank space. */ }
[0-9a-zA-Z/.=:" \t\r\n]+                         { yylval.sval = strdup(yytext); return DATA; }
.                                                { std::cerr << "Invalid token" << std::endl; exit(1); }

%%
