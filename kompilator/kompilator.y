%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
void yyerror(char *s);
int yylex();
%}

%union { int nb; char var; }
%token tNB tEXP tREAL tEQ tMAIN tOB tCB tCONST tINT tADD tSUB tMUL tDIV tOP tCP tSEP tSEM tPRINTF tWHILE tVOID tIF tELSE tFOR tSTR 
%token <var> tID
%start Kompilator
%%

Kompilator : tVOID tMAIN tOP tCP tOB Instruction tCB 
			      | tINT tMAIN tOP tCP tOB Instruction tCB
            ;

Instruction : Instruction Declaration tSEM
              | Instruction Affectation tSEM
              | Instruction Printf tSEM
              | 
              ;

Declaration : Type Variable tEQ Expression
              | Type Variable
              ;

Variable : tID
         | Variable tSEP tID
         ;

Type : tCONST 
      | tINT
      ;

Affectation : Variable tEQ Expression
              ;

Expression : Expression tADD Expression
            | Expression tSUB Expression 
            | Expression tMUL Expression 
            | Expression tDIV Expression 
            | tNB
            | tID
            | Expression tOP Expression tCP Expression
            |
            ;

Printf : tPRINTF tOP tID tCP

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
    printf("\nSyntax analysis successful! ✅\n");
  } else {
    printf("\nSyntax analysis failed! ❌\n");
  }

  printf("\n************************************************************************************\n");
  return 0;
}
