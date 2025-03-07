%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
void yyerror(char *s);
int yylex();
%}

%union { int nb; char var; }
%token tNB tEXP tREAL tEQ tMAIN tOB tCB tCONST tINT tADD tSUB tMUL tDIV tOP tCP tSEP tSEM tPRINTF tWHILE tVOID tIF tELSE tFOR tSTR tSUP tINF tAND tOR tNOT tDO tINC tDEC
%left tOR 
%left tAND
%left tADD tSUB
%left tMUL tDIV
%token <var> tID
%start Kompilator
%%



Kompilator : tVOID tMAIN tOP tCP tOB Instruction tCB {printf("tVOID tMAIN tOP tCP tOB Instruction tCB\n");}
			      | tINT tMAIN tOP tCP tOB Instruction tCB {printf("tINT tMAIN tOP tCP tOB Instruction tCB\n");}
            ;

Instruction : Instruction Declaration tSEM {printf("Instruction Declaration tSEM\n");}
              | Instruction Affectation tSEM {printf("Instruction Affectation tSEM\n");}
              | Instruction Printf tSEM {printf("Instruction Printf tSEM\n");}
              | Instruction IfBody {printf("Instruction IfBody tSEM\n");}
              | Instruction WhileBody {printf("Instruction WhileBody\n");}
              | Instruction ForBody {printf("Instruction ForBody\n");}
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

Affectation : Variable tEQ Expression {printf("Variable tEQ Expression");}
              | Variable tINC
              | Variable tDEC
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
          | tOP Bool tCP {printf("tOP Bool tCP");}
          | Condition tAND Condition {printf("Condition tAND Condition");}
          | Condition tOR Condition {printf("Condition tOR Condition");}
          | tNOT tOP Condition tCP {printf("Condition tNOT tOP Condition tCP");}
          ;


Bool : Expression tINF Expression {printf("Expression tINF Expression");}
      | Expression tSUP Expression {printf("Expression tSUP Expression");}
      | Expression tEQ tEQ Expression {printf("Expression tEQ tEQ Expression");}
      | Expression tNOT tEQ Expression {printf("Expression tNOT tEQ Expression");}
      ;

WhileBody : tWHILE tOP Condition tCP tOB Instruction tCB
           |tDO tOB Instruction tCB tWHILE tOP Condition tCP tSEM
           ;

ForBody : tFOR tOP ForCondition tCP tOB Instruction tCB;


ForCondition: Declaration tSEM Condition tSEM Affectation
             |Affectation tSEM Condition tSEM Affectation
             |tSEM Condition tSEM Affectation
             ;
%%
void yyerror(char *s) {
    extern int yylineno;
    extern char *yytext;
    fprintf(stderr, "Syntax Error: %s at line %d, near '%s'\n", s, yylineno, yytext);
}

// void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  yydebug = 0;
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