%{
 #include <iostream>
 using namespace std;
 extern int yylex();
%}
%option noyywrap
%%
[ \t\n]         ;
[0-9]+\.[0-9]+  { cout << "Found a floating-point number:" << yytext << endl; }
"testeCPP" { cout << "FOII" << endl; }
%%
int main(int, char**) {
 // lex through the input:
 //while (yylex());
 
       yyin=fopen("codigo1.d","r");
       yylex();
       fclose(yyin);
}
