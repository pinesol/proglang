/* xml.y
Alex Pine
Programming Languages, Summer 2015
*/

%{
#include <iostream>
#include <cstring>

extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;

void yyerror(const char *s);
%}

%union {
  char* sval;
}

%start xml_root

%token <sval> OPEN
%token <sval> CLOSE
%token <sval> DATA

%%
xml_root : OPEN xml_body CLOSE { 
  if (strcmp(&($1[1]), &($3[2])) == 0) { 
    std::cout << "Tags " << $1 << " and " << $3 << " match." << std::endl; 
  } else {
    std::cout << "Syntax error: " << $1 << " != " << $3 << std::endl; 
    exit(1);
  }
 }
      ;

xml_body : OPEN xml_body CLOSE { 
  if (strcmp(&($1[1]), &($3[2])) == 0) { 
    std::cout << "Tags " << $1 << " and " << $3 << " match." << std::endl; 
  } else {
    std::cout << "Syntax error: " << $1 << " != " << $3 << std::endl; 
    exit(1);
  }
 }
         | DATA { std::cout << "Data: " << $1 << std::endl; }
         | /* empty string is accepted */
         ;
%%

int main()
{
    yyparse();
    return 0;
}

void yyerror(const char* error_message) {
  std::cout << "Parsing error: " << error_message << std::endl;
  exit(1);
}
