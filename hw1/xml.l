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

"</"[0-9a-zA-Z]+         { std::cout << "Start closing tag: " << yytext << std::endl; yylval.sval = strdup(yytext); return START_CLOSING_TAG; }
"<"[0-9a-zA-Z]+          { std::cout << "Start opening tag: " << yytext << std::endl; yylval.sval = strdup(yytext); return START_OPENING_TAG; }
">"                      { std::cout << "End tag: " << yytext << std::endl;  yylval.sval = strdup(yytext); return END_TAG; }
[ \t\r\n]+               { /* Skipping whitespace */ }
[ \t\r\n0-9a-zA-Z/.=:"]+ { std::cout << "Data: " << yytext << std::endl; yylval.sval = strdup(yytext); return DATA; }
.                        { std::cerr << "Invalid token" << std::endl; exit(1); }

%%
