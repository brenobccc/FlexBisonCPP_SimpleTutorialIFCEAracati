%{
  #include <cstdio>
  #include <iostream>
  using namespace std;
 
  // declarar as coisas do flex que o Bison precisa saber
  extern int yylex();
  extern int yyparse();
  extern FILE *yyin;
 
  void yyerror(const char *s);
%}
 
%union {
  int ival;
  float fval;
  char *sval;
}
%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING
 
%%
 
cod: cod comandos
  | comandos
  ;
 
comandos:
   INT { cout << "bison found an int: " << $1 << endl;}
  | FLOAT { cout << "bison found a float: " << $1 << endl;}
  | STRING { cout << "bison found a string: " << $1 << endl;}
  ;
%%
 
int main(int, char**) {
  FILE *myfile = fopen("a.code.file", "r"); //abrir o arquivo
  yyin = myfile;// ler o arquivo
  yyparse();// analisar a entrada
}
 
void yyerror(const char *s) {
  cout << "EEK, parse error!  Message: " << s << endl;
  exit(-1);//parar
}
