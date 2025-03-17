%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "symbol_table.h"
#include "asm.h"
#define ASM_FILE "asm.dump"

extern char *yytext;
void yyerror(char *s);
int yylex();
container ts = {NULL, NULL, 0};
container tAsm = {NULL, NULL, 0};
%}


%union { int nb; char* str;}
%token tEXP tREAL tEQ tMAIN tOB tCB tCONST tINT tADD tSUB tMUL tDIV tOP tCP tSEP tSEM tPRINTF tWHILE tVOID tIF tELSE tFOR tSUP tINF tAND tOR tNOT tDO tINC tDEC tEQEQ tINFEQ tSUPEQ
%left tOR 
%left tAND
%left tADD tSUB
%left tMUL tDIV

%token <str> tID
%token <nb> tNB

%type <str> Variable
%type <nb> Expression
%start Kompilator
%%



Kompilator : tVOID tMAIN tOP tCP tOB Instruction tCB {printf("tVOID tMAIN tOP tCP tOB Instruction tCB\n ");}
			      | tINT tMAIN tOP tCP tOB Instruction tCB {printf("tINT tMAIN tOP tCP tOB Instruction tCB\n ");}
            | Function Kompilator {printf("Function\n");}
            ;

Instruction : Instruction Declaration tSEM {printf("Instruction Declaration tSEM \n");}
              | Instruction Affectation tSEM {printf("Instruction Affectation tSEM \n");}
              | Instruction Printf tSEM {printf("Instruction Printf tSEM \n");}
              | Instruction IfBody {printf("Instruction IfBody tSEM \n");}
              | Instruction WhileBody {printf("Instruction WhileBody \n");}
              | Instruction ForBody {printf("Instruction ForBody \n");}
              | Instruction Invocation tSEM {printf("Instruction Invocation tSEM \n");}
              |
              ;

Declaration : Type ListeVariables {printf("Type ListeVariables ");}
              ;

Affectation : ListeVariablesAff {printf("ListeVariables");}
              | ListeVariablesAff tINC
              | ListeVariablesAff tDEC
              ;

ListeVariables : Variable {printf("Variable ");}
                | Variable tSEP ListeVariables {printf("tID tSEP ListeVariables ");}
                ;

ListeVariablesAff : Variable {printf("Variable ");}
                | Variable tSEP ListeVariablesAff {printf("tID tSEP ListeVariablesAff ");}
                ;

Variable : tID tEQ Expression {printf("tID tEQ Expression ");}
          | tID {
            container_add_sucre_symbol(&ts, $1);
            printf("tID[%s] ", $$);
            // printf("ICI: %s ",((entry_ts*) (ts.pTail->pVal))->name);
          }
          ;
                
Type : tCONST {printf("tCONST ");}
      | tINT {printf("tINT ");}
      ;

Expression : Expression tADD Expression {
                //entry_ts *pExp1 = (entry_ts *)container_get_if(&ts, (bool(*)(void*,void*))entry_ts_isName, (void*)$1);
                int addr_res=container_add_sucre_symbol(&ts, "temp");
                //int addr_arg1= container_add_sucre_symbol(&ts, "temp");
                //int addr_arg2= container_add_sucre_symbol(&ts, "temp");

                container_add_sucre_asm(&tAsm,ADD, addr_res, $1, $3);
                asmLine *pAsm= (asmLine*) tAsm.pTail->pVal;
                $$=addr_res;
                printf("Voici ton addition : op=%d, @res:%x @arg1:%x @arg2:%x\n", pAsm->op, pAsm->res, pAsm->arg1, pAsm->arg2);
                printf("Expression[%d] tADD Expression[%d] ", $1, $3);
              }
            | Expression tSUB Expression {
              int addr=container_add_sucre_symbol(&ts, "temp");
              container_add_sucre_asm(&tAsm,SOU, addr, $1, $3);
              $$=addr;
              printf("Expression[%d] tADD Expression[$%d] ", $1, $3);
            }
            | Expression tMUL Expression  {
              int addr=container_add_sucre_symbol(&ts, "temp");
              container_add_sucre_asm(&tAsm,MUL, addr, $1, $3);
              $$=addr;
              printf("Expression[%d] tMUL Expression[%d] ", $1, $3);
            }
            | Expression tDIV Expression  {
              int addr=container_add_sucre_symbol(&ts, "temp");
              container_add_sucre_asm(&tAsm,DIV, addr, $1, $3);
              $$=addr;
              printf("Expression[%d] tDIV Expression[%d] ", $1, $3);
            }
            | tNB {int addr=container_add_sucre_symbol(&ts, "temp");
                  container_add_sucre_asm(&tAsm,AFC, addr, $1, 0);
                  $$=addr;
                  ;printf("tNB[%d] ", $1);} 
            | tID {entry_ts *pExp1 = (entry_ts *)container_get_if(&ts, (bool(*)(void*,void*))entry_ts_isName, (void*)$1);
                   if(pExp1!=NULL)$$=container_get_index(&ts,pExp1);
                   printf("tID[] ");}
            | tEXP {printf("tEXP[] ");}
            | tREAL {printf("tREAL[] " );}
            | tOP Expression tCP {$$=$2;printf("Expression tOP Expression tCP Expression ");}
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


Bool : Expression tINF Expression {
          int addr = container_add_sucre_symbol(&ts,"temp");
          int addr_arg1= container_add_sucre_symbol(&ts, "temp");
          int addr_arg2= container_add_sucre_symbol(&ts, "temp");

          container_add_sucre_asm(&tAsm, INF, addr, addr_arg1, addr_arg2);
          printf("Expression tINF Expression ");}
      | Expression tSUP Expression {
          int addr = container_add_sucre_symbol(&ts,"temp");
          container_add_sucre_asm(&tAsm, SUP, addr, $1, $3);
          printf("Expression tSUP Expression ");}
      | Expression tEQEQ Expression {
          int addr = container_add_sucre_symbol(&ts,"temp");
          container_add_sucre_asm(&tAsm, EQU, addr, $1, $3);
          printf("Expression tEQ tEQ Expression ");}
      | Expression tNOT tEQ Expression {printf("Expression tNOT tEQ Expression ");}
      | Expression tINFEQ Expression {printf("Expression tINFEQ Expression ");}
      | Expression tSUPEQ Expression {printf("Expression tSUPEQ Expression ");}
      ;

WhileBody : tWHILE tOP Condition tCP tOB Instruction tCB {printf("tWHILE tOP Condition tCP tOB Instruction tCB ");}
           |tDO tOB Instruction tCB tWHILE tOP Condition tCP tSEM {printf("tDO tOB Instruction tCB tWHILE tOP Condition tCP tSEM ");}
           ;

ForBody : tFOR tOP ForCondition tCP tOB Instruction tCB {printf("tFOR tOP ForCondition tCP tOB Instruction tCB ");}; 
 

ForCondition: Declaration tSEM Condition tSEM Affectation {printf("Declaration tSEM Condition tSEM Affectation ");}
             |Affectation tSEM Condition tSEM Affectation {printf("Affectation tSEM Condition tSEM Affectation ");}
             |tSEM Condition tSEM Affectation {printf("tSEM Condition tSEM Affectation ");}
             ;

Function : tVOID tID tOP tCP tOB Instruction tCB {container_add_sucre_symbol(&ts, $2); {printf("tVOID tID tOP tCP tOB Instruction tCB ");}}
          | tINT tID tOP tCP tOB Instruction tCB {container_add_sucre_symbol(&ts, $2); {printf("tINT tID tOP tCP tOB Instruction tCB ");}}
          ;

Invocation : tID tOP tCP {printf("tID tOP tCP ");}

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
  print_asm(&tAsm);
  write_asm_to_file(&tAsm, ASM_FILE);
  printf("\n************************************************************************************\n");
  return 0;
}