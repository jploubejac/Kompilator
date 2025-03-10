%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "symbol_table.h"
#include "container.h"

extern char *yytext;
void yyerror(char *s);
int yylex();
container ts;
%}


%union { int nb; char* str;}
%token tNB tEXP tREAL tEQ tMAIN tOB tCB tCONST tINT tADD tSUB tMUL tDIV tOP tCP tSEP tSEM tPRINTF tWHILE tVOID tIF tELSE tFOR tSUP tINF tAND tOR tNOT tDO tINC tDEC
%left tOR 
%left tAND
%left tADD tSUB
%left tMUL tDIV
%token <str> tID
%type <str> Variable // `Variable` doit retourner un `char*`
%start Kompilator
%%



Kompilator : tVOID tMAIN tOP tCP tOB Instruction tCB {printf("tVOID tMAIN tOP tCP tOB Instruction tCB\n ");}
			      | tINT tMAIN tOP tCP tOB Instruction tCB {printf("tINT tMAIN tOP tCP tOB Instruction tCB\n ");}
            ;

Instruction : Instruction Declaration tSEM {printf("Instruction Declaration tSEM \n");}
              | Instruction Affectation tSEM {printf("Instruction Affectation tSEM \n");}
              | Instruction Printf tSEM {printf("Instruction Printf tSEM \n");}
              | Instruction IfBody {printf("Instruction IfBody tSEM \n");}
              | Instruction WhileBody {printf("Instruction WhileBody \n");}
              | Instruction ForBody {printf("Instruction ForBody \n");}
              |
              ;

Declaration : Type ListeVariables {printf("Type ListeVariables ");}
              ;

Affectation : ListeVariablesAff {printf("ListeVariables");}
              | ListeVariablesAff tINC
              | ListeVariablesAff tDEC
              ;

ListeVariables : Variable {printf("Variable ");}
                | Variable tSEP ListeVariables {
                    printf("tID tSEP ListeVariables ");
                    printf("DEBUG: Variable détectée = [%s]\n", $1);
                    entry_ts* val = (entry_ts*) malloc(sizeof(entry_ts));
                    strcpy(val->name, $1);
                    val->address = (int*) malloc(4);
                    container_add(&ts, val);
                    printf("ICI: %s\n",((entry_ts*) (ts.pHead->pVal))->name);
                }
                ;

ListeVariablesAff : Variable {printf("Variable ");}
                | Variable tSEP ListeVariablesAff {printf("tID tSEP ListeVariablesAff ");}
                ;

Variable : tID tEQ Expression {printf("tID tEQ Expression ");}
          | tID {$$ = strdup(yytext); printf("tID ");
          }
          ;
                
Type : tCONST {printf("tCONST ");}
      | tINT {printf("tINT ");}
      ;

Expression : Expression tADD Expression {printf("Expression tADD Expression ");}
            | Expression tSUB Expression {printf("Expression tSUB Expression ");}
            | Expression tMUL Expression {printf("Expression tMUL Expression ");}
            | Expression tDIV Expression {printf("Expression tDIV Expression ");}
            | tNB {printf("tNB ");}
            | tID {printf("tID ");}
            | tEXP {printf("tEXP ");}
            | tREAL {printf("tREAL ");}
            | tOP Expression tCP {printf("Expression tOP Expression tCP Expression ");}
            ;

Printf : tPRINTF tOP tID tCP {printf("tPRINTF tOP tID tCP ");}

IfBody : tIF tOP Condition tCP tOB Instruction tCB {printf("tIF tOP Expression tCP tOB Instruction tCB ");}
        | tIF tOP Condition tCP tOB Instruction tCB tELSE tOB Instruction tCB {printf("tIF tOP Expression tCP tOB Instruction tCB tELSE tOB Instruction tCB ");}
        ;


Condition : Bool {printf("Bool ");}
          | tOP Bool tCP {printf("tOP Bool tCP ");}
          | Condition tAND Condition {printf("Condition tAND Condition ");}
          | Condition tOR Condition {printf("Condition tOR Condition ");}
          | tNOT tOP Condition tCP {printf("Condition tNOT tOP Condition tCP ");}
          ;


Bool : Expression tINF Expression {printf("Expression tINF Expression ");}
      | Expression tSUP Expression {printf("Expression tSUP Expression ");}
      | Expression tEQ tEQ Expression {printf("Expression tEQ tEQ Expression ");}
      | Expression tNOT tEQ Expression {printf("Expression tNOT tEQ Expression ");}
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