/* xml.l 
Alex Pine
Programming Languages, Summer 2015
*/
%{
#include <iostream>
#include <stdlib.h>
#define YY_DECL extern "C" int yylex()
%}

%option noyywrap

%%

"</"                    { std::cout << "closing tag: " << yytext << std::endl; }
"<"                     { std::cout << "opening tag: " << yytext << std::endl; }
">"                     { std::cout << "tag end: " << yytext << std::endl; }
[0-9a-zA-Z/.=:"]+       { std::cout << "id: " << yytext << std::endl; }
[ \t\r\n]+              { /* Ignore white characters. */ }
.                       { std::cerr << "Invalid token" << std::endl; exit(1); }

%%
