%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
void yyerror(char *s);
int yylex();
%}

%union { int nb; char var; }
%token tNB tEXP tREAL tEQ tMAIN tOB tCB tCONST tINT tADD tSUB tMUL tDIV tOP tCP tSEP tEOL tSEM tPRINTF tWHILE tVOID tIF tELSE tFOR tSTR 
%token <var> tID
%start Kompilator
%%
Kompilator : tVOID tMAIN tOP tCP tOB Instruction tCB 
			| tINT tMAIN tOB tCP tOB Instruction tCB;
Instruction : ;
Affectation : Declaration tEQ Expression;
Declaration : tCONST | tINT;
Expression : tID | tEXP | tNB;
Fonction : tINT;

%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("Kompilateur,non tor\n"); // yydebug=1;
  yyparse();
  return 0;
}
