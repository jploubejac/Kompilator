%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "symbolEntry.h"
#include "asmLine.h"
#include "dynamicArray.h"
#define RESULT_FILE "result.dump"

extern char *yytext;
void yyerror(char *s);
int yylex();
//container ts = {NULL, NULL, 0};
//container tAsm = {NULL, NULL, 0};
dynamicArray_t *pSymbolTable;
dynamicArray_t *pAsmTable;
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

Variable : tID tEQ Expression {
            int addr_res = DynamicArrayGetIndexIf(pSymbolTable,  (IptfVV)symbolEntryIsName, (void*)$1);
            if(addr_res<0)addr_res=DynamicArrayPushSymbolEntry(pSymbolTable, $1);
            DynamicArrayPushAsmLine(pAsmTable, OP_COP, addr_res,$3, 0);
            printf("tID tEQ Expression ");
            
            }
          | tID {
            int index = DynamicArrayGetIndexIf(pSymbolTable,  (IptfVV)symbolEntryIsName, (void*)$1);
            if(index<0)DynamicArrayPushSymbolEntry(pSymbolTable, $1);
            printf("tID[%s] ", $$);
          }
          ;
                
Type : tCONST {printf("tCONST ");}
      | tINT {printf("tINT ");}
      ;

Expression : Expression tADD Expression {
              //entry_ts *pExp1 = (entry_ts *)container_get_if(&ts, (bool(*)(void*,void*))entry_ts_isName, (void*)$1);
              printf("/*---------------------------------------ADD-----------------------------------------*/\n");
              int addr_res=DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
              //int addr_arg1=DynamicArrayGetIndexIf(pSymbolTable, (IptfVV)symbolEntryIsName, (void*)$1);
              //int addr_arg2=DynamicArrayGetIndexIf(pSymbolTable, (IptfVV)symbolEntryIsName, (void*)$3);
              DynamicArrayPushAsmLine(pAsmTable, OP_ADD, addr_res, $1, $3);
              asmLine_t *pAsm= (asmLine_t*) DynamicArrayGetByIndex(pAsmTable, DynamicArrayGetSize(pAsmTable)-1);
              $$=addr_res;
              printf("Voici ton addition : op=%d, @res:%x @arg1:%x @arg2:%x\n", pAsm->op, pAsm->res, pAsm->arg1, pAsm->arg2);
              printf("Expression[%d] tADD Expression[%d] ", $1, $3);
              }
            | Expression tSUB Expression {
              printf("/*---------------------------------------SUB-----------------------------------------*/\n");
              int addr_res=DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
              //int addr_arg1=DynamicArrayGetIndexIf(pSymbolTable, (IptfVV)symbolEntryIsName, (void*)$1);
              //int addr_arg2=DynamicArrayGetIndexIf(pSymbolTable, (IptfVV)symbolEntryIsName, (void*)$3);
              DynamicArrayPushAsmLine(pAsmTable, OP_SOU, addr_res, $1, $3);
              $$=addr_res;
              printf("Expression[%d] tADD Expression[$%d] ", $1, $3);
            }
            | Expression tMUL Expression  {
              printf("/*---------------------------------------MUL-----------------------------------------*/\n");
              int addr_res=DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
              //int addr_arg1=DynamicArrayGetIndexIf(pSymbolTable, (IptfVV)symbolEntryIsName, (void*)$1);
              //int addr_arg2=DynamicArrayGetIndexIf(pSymbolTable, (IptfVV)symbolEntryIsName, (void*)$3);
              DynamicArrayPushAsmLine(pAsmTable, OP_MUL, addr_res, $1, $3);
              $$=addr_res;
              printf("Expression[%d] tMUL Expression[%d] ", $1, $3);
            }
            | Expression tDIV Expression  {
              printf("/*---------------------------------------DIV-----------------------------------------*/\n");
              int addr_res=DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
              //int addr_arg1=DynamicArrayGetIndexIf(pSymbolTable, (IptfVV)symbolEntryIsName, (void*)$1);
              //int addr_arg2=DynamicArrayGetIndexIf(pSymbolTable, (IptfVV)symbolEntryIsName, (void*)$3);
              DynamicArrayPushAsmLine(pAsmTable, OP_DIV, addr_res, $1, $3);
              $$=addr_res;
              printf("Expression[%d] tDIV Expression[%d] ", $1, $3);
            }
            | tNB {
              printf("/*---------------------------------------NB-----------------------------------------*/\n");
              char str[12];
              snprintf(str, sizeof(str), "%d", $1);
              int index = DynamicArrayGetIndexIf(pSymbolTable,  (IptfVV)symbolEntryIsName, (void*)str);
              if(index<0){
                int addr=DynamicArrayPushSymbolEntry(pSymbolTable, (void*)str);
                DynamicArrayPushAsmLine(pAsmTable, OP_AFC, addr, $1, 0);
                $$=addr;
              }else $$=index;
              printf("tNB[%d] ", $1);
            } 
            | tID {
              printf("/*---------------------------------------ID-----------------------------------------*/\n");
              int index = DynamicArrayGetIndexIf(pSymbolTable,  (IptfVV)symbolEntryIsName, (void*)$1);
              if(index<0)$$=DynamicArrayPushSymbolEntry(pSymbolTable, $1);
              else $$=index;
              printf("tID[] ");
            }
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
        int addr = DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
        int addr_arg1= DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
        int addr_arg2= DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
        DynamicArrayPushAsmLine(pAsmTable, OP_INF, addr, addr_arg1, addr_arg2);
        printf("Expression tINF Expression ");
      }
      | Expression tSUP Expression {
        int addr = DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
        int addr_arg1= DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
        int addr_arg2= DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
        DynamicArrayPushAsmLine(pAsmTable, OP_SUP, addr, addr_arg1, addr_arg2);
        printf("Expression tSUP Expression ");
      }
      | Expression tEQEQ Expression {
        int addr = DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
        int addr_arg1= DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
        int addr_arg2= DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
        DynamicArrayPushAsmLine(pAsmTable, OP_EQU, addr, addr_arg1, addr_arg2);
        printf("Expression tEQ tEQ Expression ");
      }
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

Function : tVOID tID tOP tCP tOB Instruction tCB {/*container_add_sucre_symbol(&ts, $2);*/ {printf("tVOID tID tOP tCP tOB Instruction tCB ");}}
          | tINT tID tOP tCP tOB Instruction tCB {/*container_add_sucre_symbol(&ts, $2);*/ {printf("tINT tID tOP tCP tOB Instruction tCB ");}}
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
  printf("INITIALISATION ✅\n");
  pAsmTable=DynamicArrayNew((ptfV)asmLineDeleteFunction);
  pSymbolTable=DynamicArrayNew((ptfV)symbolEntryDeleteFunction);
  printf("STARTING ANALYSIS\n");
  if (yyparse() == 0) {
    printf("\nSyntax analysis successful! ✅\n");
  } else {
    printf("\nSyntax analysis failed! ❌\n");
  }
  printf("\n************************************************************************************\n");
  printf("SYMBOL TABLE\n");
  DynamicArraySymbolEntryPrint(pSymbolTable);
  DynamicArraySymbolEntryPrintToFile(pSymbolTable, RESULT_FILE);
  printf("\n************************************************************************************\n");
  printf("ASM TABLE\n");
  DynamicArrayAsmLinePrint(pAsmTable);
  DynamicArrayAsmLinePrintToFile(pAsmTable, RESULT_FILE);
  printf("\n************************************************************************************\n");
  printf("DELETING TABLES ✅\n");
  DynamicArrayDel(pAsmTable);
  DynamicArrayDel(pSymbolTable);
  printf("\n************************************************************************************\n");
  return 0;
}