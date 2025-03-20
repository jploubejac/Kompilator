#include "asmLine.h"
#include "container.h"
#include "string.h"
#include <stdio.h>

asmLine_t *CreateAsmLine(enum operation_e op, int res, int arg1, int arg2){
    asmLine_t *pNew= malloc(sizeof(asmLine_t));
    pNew->op=op;
    pNew->res=res;
    pNew->arg1=arg1;
    pNew->arg2=arg2;
    return pNew;
}

char* int_to_instr(int inst) {
    switch(inst){
        case OP_ADD: return "ADD";
        case OP_MUL: return "MUL";
        case OP_SOU: return "SOU";
        case OP_DIV: return "DIV";
        case OP_COP: return "COP";
        case OP_AFC: return "AFC";
        case OP_JMP: return "JMP";
        case OP_JMF: return "JMF";
        case OP_INF: return "INF";
        case OP_SUP: return "SUP";
        case OP_EQU: return "EQU";
        case OP_PRI: return "PRI";
        default: return "";
    }
}


void asmLineDeleteFunction(asmLine_t *pAsm){
    free(pAsm);
}

int DynamicArrayPushAsmLine(dynamicArray_t *pArray, enum operation_e op, int res, int arg1, int arg2){
    if(pArray==NULL)return -1;
    asmLine_t *pNew = CreateAsmLine(op,res,arg1,arg2);
    return DynamicArrayPush(pArray, pNew);
}

void DynamicArrayAsmLinePrint(dynamicArray_t *pArray){
    int i = 0;
    char inst[4] = "";
    asmLine_t* pEntry;
    while (i!=DynamicArrayGetSize(pArray)) {
        pEntry = DynamicArrayGetByIndex(pArray, i);
        if(pEntry==NULL)return;
        strcpy(inst, int_to_instr(pEntry->op));
        if (!strcmp(inst, "AFC")) {
            printf("%d:\t%s %d #%d\n",i, inst, pEntry->res, pEntry->arg1);
        } else if (!strcmp(inst, "COP")) {
            printf("%d:\t%s %d %d\n",i, inst, pEntry->res, pEntry->arg1);
        } else {
            printf("%d:\t%s %d %d %d\n",i, inst, pEntry->res, pEntry->arg1, pEntry->arg2);
        }
        i++;
    }
    
}

void DynamicArrayAsmLinePrintToFile(dynamicArray_t *pArray, const char *filename){
    FILE *file = fopen(filename, "a");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    int i = 0;
    char inst[4] = "";
    asmLine_t* pEntry;
    fprintf(file, "Assembly Code\n");
    while (i!=DynamicArrayGetSize(pArray)) {
        pEntry = DynamicArrayGetByIndex(pArray, i);
        if (pEntry == NULL) {
            fclose(file);
            return;
        }
        strcpy(inst, int_to_instr(pEntry->op));
        if (!strcmp(inst, "AFC")) {
            fprintf(file, "%d:\t%s %d #%x\n",i, inst, pEntry->res, pEntry->arg1);
        } else if (!strcmp(inst, "COP")) {
            fprintf(file,"%d:\t%s %d %d\n",i, inst, pEntry->res, pEntry->arg1);
        } else {
            fprintf(file,"%d:\t%s %d %d %d\n",i, inst, pEntry->res, pEntry->arg1, pEntry->arg2);
        }
        i++;
    }

    fclose(file);
}