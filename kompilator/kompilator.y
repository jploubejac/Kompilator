%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
void yyerror(char *s);
int yylex();
%}

%union { int nb; char var; }
%token tNB tEXP tREAL tEQ tMAIN tOB tCB tCONST tINT tADD tSUB tMUL tDIV tOP tCP tSEP tSEM tPRINTF tWHILE tVOID tIF tELSE tFOR tSTR tSUP tINF tAND tOR tNOT
%left tOR
%left tAND
%left tADD tSUB
%left tMUL tDIV
%token <var> tID
%start Kompilator
%%



Kompilator : tVOID tMAIN tOP tCP tOB Instruction tCB {printf("tVOID tMAIN tOP tCP tOB Instruction tCB");}
			      | tINT tMAIN tOP tCP tOB Instruction tCB {printf("tINT tMAIN tOP tCP tOB Instruction tCB");}
            ;

Instruction : Instruction Declaration tSEM {printf("Instruction Declaration tSEM");}
              | Instruction Affectation tSEM {printf("Instruction Affectation tSEM");}
              | Instruction Printf tSEM {printf("Instruction Printf tSEM");}
              | Instruction IfBody {printf("Instruction IfBody tSEM");}
              | 
              ;

Declaration : Type Variable tEQ Expression {printf("Type Variable tEQ Expression");}
              | Type Variable {printf("Type Variable");}
              ;

Variable : tID {printf("tID");}
         | Variable tSEP tID {printf("Variable tSEP tID ");}
         ;

Type : tCONST {printf("tCONST");}
      | tINT {printf("tINT");}
      ;

Affectation : Variable tEQ Expression tSEM {printf("Variable tEQ Expression");}
              ;

Expression : Expression tADD Expression {printf("Expression tADD Expression");}
            | Expression tSUB Expression {printf("Expression tSUB Expression");}
            | Expression tMUL Expression {printf("Expression tMUL Expression");}
            | Expression tDIV Expression {printf("Expression tDIV Expression");}
            | tNB {printf("tNB");}
            | tID {printf("tID");}
            | tOP Expression tCP {printf("Expression tOP Expression tCP Expression");}
            ;

Printf : tPRINTF tOP tID tCP {printf("tPRINTF tOP tID tCP");}

IfBody : tIF tOP Condition tCP tOB Instruction tCB {printf("tIF tOP Expression tCP tOB Instruction tCB");}
        | tIF tOP Condition tCP tOB Instruction tCB tELSE tOB Instruction tCB {printf("tIF tOP Expression tCP tOB Instruction tCB tELSE tOB Instruction tCB");}
        ;


Condition : Bool {printf("Bool");}
          | Condition tAND tAND Condition {printf("Condition tAND Condition");}
          | Condition tOR tOR Condition {printf("Condition tOR Condition");}
          | tNOT tOP Condition tCP {printf("Condition tNOT tOP Condition tCP");}
          ;


Bool : Expression tINF Expression {printf("Expression tINF Expression");}
      | Expression tSUP Expression {printf("Expression tSUP Expression");}
      | Expression tEQ tEQ Expression {printf("Expression tEQ tEQ Expression");}
      | Expression tNOT tEQ Expression {printf("Expression tNOT tEQ Expression");}
      ;


%%
void yyerror(char *s) {
    extern int yylineno;  // Line number from Flex
    extern char *yytext;  // Current token text
    fprintf(stderr, "Syntax Error: %s at line %d, near '%s'\n", s, yylineno, yytext);
}

// void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  yydebug = 1;
  printf("KOMPILATOR\n"); // yydebug=1;
  printf("************************************************************************************\n");
  printf("\n\n\n");
  printf("STARTING ANALYSIS\n");
  if (yyparse() == 0) {
    printf("\nSyntax analysis successful! ✅\n");
  } else {
    printf("\nSyntax analysis failed! ❌\n");
  }

  printf("\n************************************************************************************\n");
  return 0;
}
