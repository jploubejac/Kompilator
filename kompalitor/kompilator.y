%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
void yyerror(char *s);
%}
%union { int nb; char var; }
%token tNB tEXP tREAL tEQ tMAIN tOB tCB tCONST tINT tVAR tADD tSUB tMUL tDIV tOP tCP tSEP tEOL tSEM tPRINTF tWHILE tVOID tIF tELSE tFOR tSTR 
%token <nb> tNB
%token <var> tID
%type <nb> Expr DivMul Terme
%start Kompilator
%%
Kompilator : tVOID tMAIN tOP tCP tOB Instruction tCB 
			| tINT tMAIN tOB tCP tOB Instruction tCB;
Instruction : 
Affectation :
Declaration :
Expression : 
Fonction : tINT 
Calcul :	  Expr tFL { printf("> %d\n", $1); }
		| tID tEGAL Expr tFL { var[(int)$1] = $3; } ;
Expr :		  Expr tADD DivMul { $$ = $1 + $3; }
		| Expr tSOU DivMul { $$ = $1 - $3; }
		| DivMul { $$ = $1; } ;
DivMul :	  DivMul tMUL Terme { $$ = $1 * $3; }
		| DivMul tDIV Terme { $$ = $1 / $3; }
		| Terme { $$ = $1; } ;
Terme :		  tPO Expr tPF { $$ = $2; }
		| tID { $$ = var[$1]; }
		| tNB { $$ = $1; } ;


%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("Kompilateur,non tor\n"); // yydebug=1;
  yyparse();
  return 0;
}
