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
			      | tINT tMAIN tOP tCP tOB Instruction tCB;

Instruction : Instruction Affectation tSEM 
              | Instruction tEOL
              | ;

Affectation : Declaration tEQ Expression;

Declaration : tCONST | tINT;

Expression : Expression tADD Expression
            | Expression tSUB Expression 
            | Expression tMUL Expression 
            | Expression tDIV Expression 
            | tID 
            | tNB;

%%
void yyerror(char *s) {
    extern int yylineno;  // Line number from Flex
    extern char *yytext;  // Current token text
    fprintf(stderr, "Syntax Error: %s at line %d, near '%s'\n", s, yylineno, yytext);
}

// void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("KOMPILATOR\n"); // yydebug=1;
  printf("************************************************************************************\n");

  if (yyparse() == 0) {
    printf("\n\nParsing successful! ✅\n");
  } else {
    printf("\nParsing failed! ❌\n");
  }

  printf("\n************************************************************************************\n");
  return 0;
}
