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

%start root

%token <sval> START_CLOSING_TAG
%token <sval> START_OPENING_TAG
%token <sval> END_TAG
%token <sval> DATA

%%
root : block
     ;

expr_list : block expr_list
          | DATA expr_list
          | /* Empty string is accepted */
          ;

attr : DATA
     |
     ;

block : START_OPENING_TAG attr END_TAG expr_list START_CLOSING_TAG END_TAG  {
  /* $1 should be "<name", and $5 should be "</name". Therefore $1[1] and $5[2]
   * should both be "name" */
  if (strcmp(&($1[1]), &()) == 0) { 
    std::cout << "Tags " << $1 << " and " << $5 << " match." << std::endl; 
  } else {
    std::cout << "Syntax error: " << $1 << " != " << $5 << std::endl; 
    exit(1);
  }
}
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
