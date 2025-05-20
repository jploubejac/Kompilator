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
%token tEQ tMAIN tOB tCB tCONST tINT tADD tSUB tSTAR tDIV tOP tCP tSEP tSEM tPRINTF tVOID tIF tELSE tFOR tSUP tINF tAND tOR tNOT tINC tDEC tEQEQ tINFEQ tSUPEQ tERROR tFLOAT tSWITCH
%left tOR 
%left tAND
%left tADD tSUB
%left tSTAR tDIV

%token <str> tID
%token <nb> tNB
%token <nb> tWHILE
%token <nb> tDO
%token <nb> tREAL
%token <nb> tEXP

%type <str> Variable
%type <nb> Expression
%type <nb> Condition
%type <nb> Invocation
%type <nb> Bool


%start Start 
%%

Start : {DynamicArrayPushAsmLine(pAsmTable, OP_JMP, -1,0,0);} Kompilator {
          int index = DynamicArrayGetIndexIfReverse(pAsmTable, (IptfVV)isJmpWithoutAdress, NULL);
          if(index !=0 ){
            fprintf(stderr, "Erreur du compilateur, on ne trouve pas le jump initial, veuillez contacter les développeurs");
            return -1;
          }
          asmLine_t *pJmpLine;
          if(index>=0){
            pJmpLine=DynamicArrayGetByIndex(pAsmTable,index);
            if(pJmpLine!=NULL) pJmpLine->res=((functionSymbolEntry_t*)DynamicArrayGetIf(pFunctionSymbolTable, (IptfVV)functionSymbolEntryIsName, (void*)"main"))->addr;
          }
        }
       ;

Kompilator :
            Function Kompilator 
            |Function
            ;

Instruction :  Declaration tSEM Instruction 
              |Affectation tSEM Instruction 
              |Printf tSEM Instruction 
              |IfBody Instruction 
              |WhileBody Instruction 
              |ForBody Instruction 
              |Invocation tSEM Instruction 
              |tERROR {fprintf(stderr, "Lexical error caught in parser at line %d near '%s'\n", yylineno, yytext);yyerrok;}
              |tERROR tSEM {fprintf(stderr, "Lexical error caught in parser at line %d near '%s'\n", yylineno, yytext);yyerrok;}
              |
              ;

Declaration : Type ListeVariables 
              ;

Affectation : ListeVariablesAff
              | ListeVariablesAff tINC
              | ListeVariablesAff tDEC
              ;

ListeVariables : Variable 
                | Variable tSEP ListeVariables 
                ;

ListeVariablesAff : Variable 
                | Variable tSEP ListeVariablesAff 
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
          }
          |  tSTAR tID tEQ Expression {
              int addr_res = DynamicArrayGetIndexIf(pSymbolTable,  (IptfVV)symbolEntryIsName, (void*)$2);
              if(addr_res<0){
                DynamicArrayPop(pSymbolTable);
                addr_res=DynamicArrayPushSymbolEntry(pSymbolTable, $2);
              } else {
                DynamicArrayPop(pSymbolTable);
              }
              DynamicArrayPushAsmLine(pAsmTable, OP_STR, addr_res, $4, 0);
            }
          | tID {
            int index = DynamicArrayGetIndexIf(pSymbolTable,  (IptfVV)symbolEntryIsName, (void*)$1);
            if(index<0)DynamicArrayPushSymbolEntry(pSymbolTable, $1);
          }
          | tSTAR tID {
            int index = DynamicArrayGetIndexIf(pSymbolTable,  (IptfVV)symbolEntryIsName, (void*)$2);
            if(index<0)DynamicArrayPushSymbolEntry(pSymbolTable, $2);
          }
          ;
                
Type : tCONST 
      | tINT 
      | tFLOAT 
      ;

Expression : Expression tADD Expression {
              DynamicArrayPushAsmLine(pAsmTable, OP_ADD, $1, $1, $3);
              $$=$1;
              DynamicArrayPop(pSymbolTable);
              }
            | Expression tSUB Expression {
              DynamicArrayPushAsmLine(pAsmTable, OP_SOU, $1, $1, $3);
              $$=$1;
              DynamicArrayPop(pSymbolTable);
            }
            | Expression tSTAR Expression  {
              DynamicArrayPushAsmLine(pAsmTable, OP_MUL, $1, $1, $3);
              $$=$1;
              DynamicArrayPop(pSymbolTable);
            }
            | Expression tDIV Expression  {
              DynamicArrayPushAsmLine(pAsmTable, OP_DIV, $1, $1, $3);
              $$=$1;
              DynamicArrayPop(pSymbolTable);
            }
            | tNB {
              int addr=DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
              DynamicArrayPushAsmLine(pAsmTable, OP_AFC, addr, $1, 0);
              $$=addr;
            } 
            | tID {
              int index = DynamicArrayGetIndexIf(pSymbolTable,  (IptfVV)symbolEntryIsName, (void*)$1);
              if(index<0){
                fprintf(stderr, "Erreur: variables '%s', utilisée main non déclarée (ligne %d).\n", $1, yylineno);
                return -1;
              }
              int addr_ret=DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
              DynamicArrayPushAsmLine(pAsmTable, OP_COP, addr_ret, index,0);
              $$=addr_ret;
            }
            | tSTAR tID {
              int index = DynamicArrayGetIndexIf(pSymbolTable,  (IptfVV)symbolEntryIsName, (void*)$2);
              if(index<0){
                fprintf(stderr, "Erreur: variables '%s', utilisée main non déclarée (ligne %d).\n", $2, yylineno);
                return -1;
              }
              int addr_ret=DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
              DynamicArrayPushAsmLine(pAsmTable, OP_LDR, addr_ret, index,0);
              $$=addr_ret;
            }
            | tREAL {
              int addr=DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
              DynamicArrayPushAsmLine(pAsmTable, OP_AFC, addr, $1, 0);
              $$=addr;
            } 
            | tEXP {
              int addr=DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
              DynamicArrayPushAsmLine(pAsmTable, OP_AFC, addr, $1, 0);
              $$=addr;
            }
            | tOP Expression tCP {$$=$2;}
            | Invocation {$$=$1;}
            ;

Printf : tPRINTF tOP Expression tCP 
          {
            DynamicArrayPushAsmLine(pAsmTable, OP_PRI, $3, 0,0);
            DynamicArrayPop(pSymbolTable);
          }

IfBody : tIF tOP Condition tCP 
          { DynamicArrayPushAsmLine(pAsmTable, OP_JMF, -1 , $3,0);
            DynamicArrayPop(pSymbolTable); 
            DynamicArrayPushSymbolEntry(pSymbolTable, "if_system");
          } 
          tOB Instruction tCB 
          {
            DynamicArrayPushAsmLine(pAsmTable, OP_JMP, -1,0,0);
            asmLine_t *pJmfLine = DynamicArrayGetIfReverse(pAsmTable, (IptfVV)isJmfWithoutAdress, NULL);
            if(pJmfLine!=NULL)pJmfLine->res=DynamicArrayGetSize(pAsmTable);
            else {
              fprintf(stderr, "Erreur du compilateur, on ne trouve pas un jump, veuillez contacter les développeurs");
              return -1;
            }
            symbolEntry_t *pSymbol = (symbolEntry_t*)DynamicArrayGetByIndex(pSymbolTable,DynamicArrayGetSize(pSymbolTable) - 1);
            while(strcmp(pSymbol->name,"if_system")){
              DynamicArrayPop(pSymbolTable);
              pSymbol = (symbolEntry_t*)DynamicArrayGetByIndex(pSymbolTable,DynamicArrayGetSize(pSymbolTable) - 1);
            }
            DynamicArrayPop(pSymbolTable);
          }ElseBody{
            asmLine_t *pJmpLine = DynamicArrayGetIfReverse(pAsmTable, (IptfVV)isJmpWithoutAdress, NULL);
            if(pJmpLine!=NULL)pJmpLine->res=DynamicArrayGetSize(pAsmTable);
            else {
              fprintf(stderr, "Erreur du compilateur, on ne trouve pas un jump, veuillez contacter les développeurs");
              return -1;
            }
          }
        ;
ElseBody: tELSE {DynamicArrayPushSymbolEntry(pSymbolTable, "else_system");} tOB Instruction tCB{
            symbolEntry_t *pSymbol = (symbolEntry_t*)DynamicArrayGetByIndex(pSymbolTable,DynamicArrayGetSize(pSymbolTable) - 1);
            while(strcmp(pSymbol->name,"else_system")){
              DynamicArrayPop(pSymbolTable);
              pSymbol = (symbolEntry_t*)DynamicArrayGetByIndex(pSymbolTable,DynamicArrayGetSize(pSymbolTable) - 1);
            }
            DynamicArrayPop(pSymbolTable);
          } 
          |
          ;
Condition : Bool {
                $$=$1;
              }

          | tOP Bool tCP {
                $$=$2;
              }
              
          | Condition tAND Condition {
              DynamicArrayPushAsmLine(pAsmTable, OP_AND, $1, $1, $3);
              DynamicArrayPop(pSymbolTable);
              $$=$1;
            }
          | Condition tOR Condition {
              DynamicArrayPushAsmLine(pAsmTable, OP_OR, $1, $1, $3);
              DynamicArrayPop(pSymbolTable);
              $$=$1;
            }
          | tNOT tOP Condition tCP {
              DynamicArrayPushAsmLine(pAsmTable, OP_NOT, $3, $3, 0);
              $$=$3;
            }
          ;


Bool : Expression tINF Expression {
        DynamicArrayPushAsmLine(pAsmTable, OP_INF, $1, $1, $3);
        DynamicArrayPop(pSymbolTable);
        $$=$1;
      }
      | Expression tSUP Expression {
        DynamicArrayPushAsmLine(pAsmTable, OP_SUP, $1, $1, $3);
        DynamicArrayPop(pSymbolTable);
        $$=$1;
      }
      | Expression tEQEQ Expression {
        DynamicArrayPushAsmLine(pAsmTable, OP_EQU, $1, $1, $3);
        DynamicArrayPop(pSymbolTable);
        $$=$1;
      }
      | Expression tNOT tEQ Expression {
        DynamicArrayPushAsmLine(pAsmTable,OP_EQU, $1,$1,$4);
        DynamicArrayPushAsmLine(pAsmTable,OP_NOT, $1, $1, 0);
        DynamicArrayPop(pSymbolTable);
        $$=$1;
      }
      | Expression tINFEQ Expression {
        int addr_temp= DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
        DynamicArrayPushAsmLine(pAsmTable,OP_EQU, addr_temp,$1,$3);
        DynamicArrayPushAsmLine(pAsmTable,OP_INF, $1, $1, $3);
        DynamicArrayPushAsmLine(pAsmTable,OP_OR, $1, $1, addr_temp);
        DynamicArrayPop(pSymbolTable);
        DynamicArrayPop(pSymbolTable);
        $$=$1;
      }
      | Expression tSUPEQ Expression {
        int addr_temp= DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
        DynamicArrayPushAsmLine(pAsmTable,OP_EQU, addr_temp,$1,$3);
        DynamicArrayPushAsmLine(pAsmTable,OP_SUP, $1, $1, $3);
        DynamicArrayPushAsmLine(pAsmTable,OP_OR, $1, $1, addr_temp);
        DynamicArrayPop(pSymbolTable);
        DynamicArrayPop(pSymbolTable);
        $$=$1;
      }
      ;

WhileBody : tWHILE {$1= DynamicArrayGetSize(pAsmTable); DynamicArrayPushSymbolEntry(pSymbolTable, "while_system");} tOP Condition tCP {
              DynamicArrayPushAsmLine(pAsmTable, OP_JMF, -1 ,$4, 0);
            }tOB Instruction tCB {
              DynamicArrayPushAsmLine(pAsmTable, OP_JMP, -1, 0,0);
              int index_jmf= DynamicArrayGetIndexIfReverse(pAsmTable, (IptfVV)isJmfWithoutAdress, NULL);
              if(index_jmf>=0){
                asmLine_t *pJmfLine=DynamicArrayGetByIndex(pAsmTable,index_jmf);
                if(pJmfLine!=NULL) pJmfLine->res=DynamicArrayGetSize(pAsmTable);
                else {
                  fprintf(stderr, "Erreur du compilateur, on ne trouve pas un jumpf, veuillez contacter les développeurs");
                  return -1;
                }
                asmLine_t *pJmpLine=DynamicArrayGetIfReverse(pAsmTable, (IptfVV)isJmpWithoutAdress, NULL);
                if(pJmpLine!=NULL) pJmpLine->res=$1;
                else {
                  fprintf(stderr, "Erreur du compilateur, on ne trouve pas un jump, veuillez contacter les développeurs");
                  return -1;
                }
              }
              symbolEntry_t *pSymbol = (symbolEntry_t*)DynamicArrayGetByIndex(pSymbolTable,DynamicArrayGetSize(pSymbolTable) - 1);
              while(strcmp(pSymbol->name,"while_system")){
                DynamicArrayPop(pSymbolTable);
                pSymbol = (symbolEntry_t*)DynamicArrayGetByIndex(pSymbolTable,DynamicArrayGetSize(pSymbolTable) - 1);
              }
              DynamicArrayPop(pSymbolTable);
            }
           |tDO {$1 = DynamicArrayGetSize(pAsmTable); DynamicArrayPushSymbolEntry(pSymbolTable, "do_while_system");} tOB Instruction tCB tWHILE tOP Condition tCP tSEM {
              int index_jmf = DynamicArrayPushAsmLine(pAsmTable, OP_JMF, -1, $8,0); 
              DynamicArrayPushAsmLine(pAsmTable, OP_JMP, $1, 0,0);
              if(index_jmf>=0){
                asmLine_t *pJmfLine=DynamicArrayGetByIndex(pAsmTable,index_jmf);
                if(pJmfLine!=NULL) pJmfLine->res=DynamicArrayGetSize(pAsmTable);
              }else {
                  fprintf(stderr, "Erreur du compilateur, on ne trouve pas un jumpf, veuillez contacter les développeurs");
                  return -1;
              }
              symbolEntry_t *pSymbol = (symbolEntry_t*)DynamicArrayGetByIndex(pSymbolTable,DynamicArrayGetSize(pSymbolTable) - 1);
              while(strcmp(pSymbol->name,"do_while_system")){
                DynamicArrayPop(pSymbolTable);
                pSymbol = (symbolEntry_t*)DynamicArrayGetByIndex(pSymbolTable,DynamicArrayGetSize(pSymbolTable) - 1);
              }
              DynamicArrayPop(pSymbolTable);
            }
           ;

ForBody : tFOR tOP ForCondition  tCP {
              //DynamicArrayPushAsmLine(pAsmTable, OP_JMF,-1, $3,0);
            } tOB Instruction tCB {
              DynamicArrayPushAsmLine(pAsmTable, OP_JMP, -1, 0,0);
              int index_jmf= DynamicArrayGetIndexIfReverse(pAsmTable, (IptfVV)isJmfWithoutAdress, NULL);
              if(index_jmf>=0){
                asmLine_t *pJmfLine=DynamicArrayGetByIndex(pAsmTable,index_jmf);
                if(pJmfLine!=NULL) pJmfLine->res=DynamicArrayGetSize(pAsmTable);
                asmLine_t *pJmpLine=DynamicArrayGetIfReverse(pAsmTable, (IptfVV)isJmpWithoutAdress, NULL);
                if(pJmpLine!=NULL) pJmpLine->res=index_jmf;
              }
              DynamicArrayPop(pSymbolTable);
          }; 
 

ForCondition: Declaration tSEM Condition tSEM Affectation 
             |Affectation tSEM Condition tSEM Affectation 
             |tSEM Condition tSEM Affectation 
             ;

Function : tVOID tID{
                DynamicArrayPushFunctionSymbolEntry(pFunctionSymbolTable, $2, DynamicArrayGetSize(pAsmTable));
                DynamicArrayPushSymbolEntry(pSymbolTable, $2);
              } tOP tCP tOB Instruction tCB 
              {
                
                int index = DynamicArrayPushSymbolEntry(pSymbolTable, "temp");
                DynamicArrayPushAsmLine(pAsmTable, OP_LDR, index ,DynamicArrayGetIndexIf(pFunctionSymbolTable, (IptfVV)functionSymbolEntryIsName, (void*)$2),0);
                DynamicArrayPushAsmLine(pAsmTable, OP_JMP, index, 0,0);
                DynamicArrayPop(pSymbolTable);
                symbolEntry_t *pSymbol = (symbolEntry_t*)DynamicArrayGetByIndex(pSymbolTable,DynamicArrayGetSize(pSymbolTable) - 1);
                while(strcmp(pSymbol->name,$2)){
                  DynamicArrayPop(pSymbolTable);
                  pSymbol = (symbolEntry_t*)DynamicArrayGetByIndex(pSymbolTable,DynamicArrayGetSize(pSymbolTable) - 1);
                }
                DynamicArrayPop(pSymbolTable);
              }
          | tINT tID tOP tCP tOB Instruction tCB
          | tVOID tMAIN{
                DynamicArrayPushFunctionSymbolEntry(pFunctionSymbolTable,"main", DynamicArrayGetSize(pAsmTable));
                DynamicArrayPushSymbolEntry(pSymbolTable, "main");
              } tOP tCP tOB Instruction tCB 
          | tINT tMAIN {
            DynamicArrayPushFunctionSymbolEntry(pFunctionSymbolTable,"main", DynamicArrayGetSize(pAsmTable));
            DynamicArrayPushSymbolEntry(pSymbolTable, "main");
            } tOP tCP tOB Instruction tCB
          ;

Invocation : tID tOP tCP 
            {
              printf("tID tOP tCP ");
              functionSymbolEntry_t* function = DynamicArrayGetIf(pFunctionSymbolTable, (IptfVV)symbolEntryIsName, (void*)$1);
              int index_registre = DynamicArrayPushSymbolEntry(pSymbolTable,"temp");
              int addr = DynamicArrayGetSize(pAsmTable) + 3;
              DynamicArrayPushAsmLine(pAsmTable, OP_AFC, index_registre, addr, 0);
              int index_fonction = DynamicArrayGetIndexIf(pFunctionSymbolTable, (IptfVV)functionSymbolEntryIsName, (void*)$1);
              if(index_fonction==-1){
                  fprintf(stderr, "Erreur: fonction '%s', introuvable ou déclarée plus bas (ligne %d).\n", $1, yylineno);
                  return -1;
              }
              DynamicArrayPushAsmLine(pAsmTable, OP_STR, index_fonction, index_registre,0);
              DynamicArrayPushAsmLine(pAsmTable, OP_JMP, function->addr, 0,0);
              DynamicArrayPop(pSymbolTable);
              $$=0;
            }
            |tSWITCH tOP tCP{
              int index_registre = DynamicArrayPushSymbolEntry(pSymbolTable,"temp");
              DynamicArrayPushAsmLine(pAsmTable, OP_RSS, index_registre, 0, 0);
              $$ = index_registre;
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