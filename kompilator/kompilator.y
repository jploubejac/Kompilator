%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "symbolEntry.h"
#include "functionSymbolEntry.h"
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
dynamicArray_t *pFunctionSymbolTable;
extern int yylineno;
extern char *yytext;
%}


%union { int nb; char* str;}
%token tEXP tREAL tEQ tMAIN tOB tCB tCONST tINT tADD tSUB tMUL tDIV tOP tCP tSEP tSEM tPRINTF tVOID tIF tELSE tFOR tSUP tINF tAND tOR tNOT tDO tINC tDEC tEQEQ tINFEQ tSUPEQ tERROR
%left tOR 
%left tAND
%left tADD tSUB
%left tMUL tDIV

%token <str> tID
%token <nb> tNB
%token <nb> tWHILE

%type <str> Variable
%type <nb> Expression
%type <nb> Condition
%type <nb> Bool


%start Kompilator
%%



Kompilator : tVOID tMAIN tOP tCP tOB Instruction tCB {printf("tVOID tMAIN tOP tCP tOB Instruction tCB\n ");}
			      | tINT tMAIN tOP tCP tOB Instruction tCB {printf("tINT tMAIN tOP tCP tOB Instruction tCB\n ");}
            | Function Kompilator {printf("Function\n");}
            ;

Instruction :  Declaration tSEM Instruction {printf("Instruction Declaration tSEM \n");}
              |Affectation tSEM Instruction {printf("Instruction Affectation tSEM \n");}
              |Printf tSEM Instruction {printf("Instruction Printf tSEM \n");}
              |IfBody Instruction {printf("Instruction IfBody tSEM \n");}
              |WhileBody Instruction {printf("Instruction WhileBody \n");}
              |ForBody Instruction {printf("Instruction ForBody \n");}
              |Invocation tSEM Instruction {printf("Instruction Invocation tSEM \n");}
              |tERROR {fprintf(stderr, "Lexical error caught in parser at line %d near '%s'\n", yylineno, yytext);yyerrok;}
              |tERROR tSEM {fprintf(stderr, "Lexical error caught in parser at line %d near '%s'\n", yylineno, yytext);yyerrok;}
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
            if(addr_res<0){
              DynamicArrayPop(pSymbolTable);
              addr_res=DynamicArrayPushSymbolEntry(pSymbolTable, $1);
            }else{
              DynamicArrayPushAsmLine(pAsmTable, OP_COP, addr_res, $3, 0);
              DynamicArrayPop(pSymbolTable);
            }
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
              DynamicArrayPushAsmLine(pAsmTable, OP_ADD, $1, $1, $3);
              $$=$1;
              DynamicArrayPop(pSymbolTable);
              printf("Expression[%d] tADD Expression[%d] ", $1, $3);
              }
            | Expression tSUB Expression {
              DynamicArrayPushAsmLine(pAsmTable, OP_SOU, $1, $1, $3);
              $$=$1;
              DynamicArrayPop(pSymbolTable);
              printf("Expression[%d] tADD Expression[%d] ", $1, $3);
            }
            | Expression tMUL Expression  {
              DynamicArrayPushAsmLine(pAsmTable, OP_MUL, $1, $1, $3);
              $$=$1;
              DynamicArrayPop(pSymbolTable);
              printf("Expression[%d] tMUL Expression[%d] ", $1, $3);
            }
            | Expression tDIV Expression  {
              DynamicArrayPushAsmLine(pAsmTable, OP_DIV, $1, $1, $3);
              $$=$1;
              DynamicArrayPop(pSymbolTable);
              printf("Expression[%d] tDIV Expression[%d] ", $1, $3);
            }
            | tNB {
              int addr=DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
              DynamicArrayPushAsmLine(pAsmTable, OP_AFC, addr, $1, 0);
              $$=addr;
              printf("tNB[%d] ", $1);
            } 
            | tID {
              int index = DynamicArrayGetIndexIf(pSymbolTable,  (IptfVV)symbolEntryIsName, (void*)$1);
              if(index<0)index=DynamicArrayPushSymbolEntry(pSymbolTable, $1);
              int addr_ret=DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
              DynamicArrayPushAsmLine(pAsmTable, OP_COP, addr_ret, index,0);
              $$=addr_ret;
              printf("tID[] ");
            }
            | tEXP {printf("tEXP[] ");}
            | tREAL {printf("tREAL[] " );}
            | tOP Expression tCP {$$=$2;printf("Expression tOP Expression tCP Expression ");}
            ;

Printf : tPRINTF tOP Expression tCP 
          {
            DynamicArrayPushAsmLine(pAsmTable, OP_PRI, $3, 0,0);
            DynamicArrayPop(pSymbolTable);
            printf("tPRINTF tOP tID tCP ");
          }

IfBody : tIF tOP Condition tCP 
          { DynamicArrayPushAsmLine(pAsmTable, OP_JMF, $3, -1,0);
            DynamicArrayPop(pSymbolTable);} 
          tOB Instruction tCB 
          {
            DynamicArrayPushAsmLine(pAsmTable, OP_JMP, -1,0,0);
            asmLine_t *pJmfLine = DynamicArrayGetIfReverse(pAsmTable, (IptfVV)isJmfWithoutAdress, NULL);
            if(pJmfLine!=NULL)pJmfLine->arg1=DynamicArrayGetSize(pAsmTable);
            //Do: error handle
            printf("tIF tOP Expression tCP tOB Instruction tCB ");
          }ElseBody{
            asmLine_t *pJmpLine = DynamicArrayGetIfReverse(pAsmTable, (IptfVV)isJmpWithoutAdress, NULL);
            if(pJmpLine!=NULL)pJmpLine->res=DynamicArrayGetSize(pAsmTable);
          }
        ;
ElseBody: tELSE tOB Instruction tCB 
          |
          ;
Condition : Bool {
                printf("Bool ");
                $$=$1;
              }

          | tOP Bool tCP {
                printf("tOP Bool tCP ");
                $$=$2;
              }
              
          | Condition tAND Condition {
              printf("Condition tAND Condition ");
              DynamicArrayPushAsmLine(pAsmTable, OP_AND, $1, $1, $3);
              DynamicArrayPop(pSymbolTable);
              $$=$1;
            }
          | Condition tOR Condition {
              printf("Condition tOR Condition ");
              DynamicArrayPushAsmLine(pAsmTable, OP_OR, $1, $1, $3);
              DynamicArrayPop(pSymbolTable);
              $$=$1;
            }
          | tNOT tOP Condition tCP {
              printf("Condition tNOT tOP Condition tCP ");
              DynamicArrayPushAsmLine(pAsmTable, OP_NOT, $3, $3, 0);
              DynamicArrayPop(pSymbolTable);
              $$=$3;
            }
          ;


Bool : Expression tINF Expression {
        DynamicArrayPushAsmLine(pAsmTable, OP_INF, $1, $1, $3);
        DynamicArrayPop(pSymbolTable);
        $$=$1;
        printf("Expression tINF Expression ");
      }
      | Expression tSUP Expression {
        DynamicArrayPushAsmLine(pAsmTable, OP_SUP, $1, $1, $3);
        DynamicArrayPop(pSymbolTable);
        $$=$1;
        printf("Expression tSUP Expression ");
      }
      | Expression tEQEQ Expression {
        DynamicArrayPushAsmLine(pAsmTable, OP_EQU, $1, $1, $3);
        DynamicArrayPop(pSymbolTable);
        $$=$1;
        printf("Expression tEQ tEQ Expression ");
      }
      | Expression tNOT tEQ Expression {
        DynamicArrayPushAsmLine(pAsmTable,OP_EQU, $1,$1,$4);
        DynamicArrayPushAsmLine(pAsmTable,OP_NOT, $1, $1, 0);
        DynamicArrayPop(pSymbolTable);
        $$=$1;
        printf("Expression tNOT tEQ Expression ");
      }
      | Expression tINFEQ Expression {
        int addr_temp= DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
        DynamicArrayPushAsmLine(pAsmTable,OP_EQU, addr_temp,$1,$3);
        DynamicArrayPushAsmLine(pAsmTable,OP_INF, $1, $1, $3);
        DynamicArrayPushAsmLine(pAsmTable,OP_OR, $1, $1, addr_temp);
        DynamicArrayPop(pSymbolTable);
        DynamicArrayPop(pSymbolTable);
        $$=$1;
        printf("Expression tINFEQ Expression ");
      }
      | Expression tSUPEQ Expression {
        int addr_temp= DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
        DynamicArrayPushAsmLine(pAsmTable,OP_EQU, addr_temp,$1,$3);
        DynamicArrayPushAsmLine(pAsmTable,OP_SUP, $1, $1, $3);
        DynamicArrayPushAsmLine(pAsmTable,OP_OR, $1, $1, addr_temp);
        DynamicArrayPop(pSymbolTable);
        DynamicArrayPop(pSymbolTable);
        $$=$1;
        printf("Expression tSUPEQ Expression ");
      }
      ;

WhileBody : tWHILE {$1= DynamicArrayGetSize(pAsmTable); } tOP Condition tCP {
              DynamicArrayPushAsmLine(pAsmTable, OP_JMF, $4, -1,0);
            }tOB Instruction tCB {
              printf("tWHILE tOP Condition tCP tOB Instruction tCB ");
              DynamicArrayPushAsmLine(pAsmTable, OP_JMP, -1, 0,0);
              int index_jmf= DynamicArrayGetIndexIfReverse(pAsmTable, (IptfVV)isJmfWithoutAdress, NULL);
              if(index_jmf>=0){
                asmLine_t *pJmfLine=DynamicArrayGetByIndex(pAsmTable,index_jmf);
                if(pJmfLine!=NULL) pJmfLine->arg1=DynamicArrayGetSize(pAsmTable);
                asmLine_t *pJmpLine=DynamicArrayGetIfReverse(pAsmTable, (IptfVV)isJmpWithoutAdress, NULL);
                if(pJmpLine!=NULL) pJmpLine->res=$1;
              }
            }
           |tDO tOB Instruction tCB tWHILE tOP Condition tCP tSEM {printf("tDO tOB Instruction tCB tWHILE tOP Condition tCP tSEM ");}
           ;

ForBody : tFOR tOP ForCondition  tCP {
              //DynamicArrayPushAsmLine(pAsmTable, OP_JMF, $3, -1,0);
            } tOB Instruction tCB {
              printf("tFOR tOP ForCondition tCP tOB Instruction tCB ");
              DynamicArrayPushAsmLine(pAsmTable, OP_JMP, -1, 0,0);
              int index_jmf= DynamicArrayGetIndexIfReverse(pAsmTable, (IptfVV)isJmfWithoutAdress, NULL);
              if(index_jmf>=0){
                asmLine_t *pJmfLine=DynamicArrayGetByIndex(pAsmTable,index_jmf);
                if(pJmfLine!=NULL) pJmfLine->arg1=DynamicArrayGetSize(pAsmTable);
                asmLine_t *pJmpLine=DynamicArrayGetIfReverse(pAsmTable, (IptfVV)isJmpWithoutAdress, NULL);
                if(pJmpLine!=NULL) pJmpLine->res=index_jmf;
              }
              DynamicArrayPop(pSymbolTable);
          }; 
 

ForCondition: Declaration tSEM Condition tSEM Affectation {printf("Declaration tSEM Condition tSEM Affectation ");}
             |Affectation tSEM Condition tSEM Affectation {printf("Affectation tSEM Condition tSEM Affectation ");}
             |tSEM Condition tSEM Affectation {printf("tSEM Condition tSEM Affectation ");}
             ;

Function : tVOID tID{
                DynamicArrayPushFunctionSymbolEntry(pFunctionSymbolTable, $2, DynamicArrayGetSize(pAsmTable));
              } tOP tCP tOB Instruction tCB 
              {
                printf("tVOID tID tOP tCP tOB Instruction tCB ");
              }
          | tINT tID tOP tCP tOB Instruction tCB {printf("tINT tID tOP tCP tOB Instruction tCB ");}
          ;

Invocation : tID tOP tCP 
            {
              printf("tID tOP tCP ");
              functionSymbolEntry_t* function = DynamicArrayGetIf(pFunctionSymbolTable, (IptfVV)symbolEntryIsName, (void*)$1);
              DynamicArrayPushAsmLine(pAsmTable, OP_JMP, function->addr, 0,0);
            }

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
  pFunctionSymbolTable=DynamicArrayNew((ptfV)functionSymbolEntryDeleteFunction);
  printf("STARTING ANALYSIS\n");
  if (yyparse() == 0) {
    printf("\nSyntax analysis successful! ✅\n");
  } else {
    printf("\nSyntax analysis failed! ❌\n");
  }
  printf("\n************************************************************************************\n");
  printf("FUNCTION SYMBOL TABLE\n");
  DynamicArrayFunctionSymbolEntryPrint(pFunctionSymbolTable);
  DynamicArrayFunctionSymbolEntryPrintToFile(pFunctionSymbolTable,RESULT_FILE);
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
  DynamicArrayDel(pFunctionSymbolTable);
  DynamicArrayDel(pSymbolTable);
  DynamicArrayDel(pAsmTable);
  printf("\n************************************************************************************\n");
  return 0;
}