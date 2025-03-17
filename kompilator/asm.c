#include "asm.h"
#include "container.h"
#include "string.h"
#include <stdio.h>

asmLine *CreateAsmLine(enum Operation op, int res, int arg1, int arg2){
    asmLine *pNew= malloc(sizeof(asmLine));
    pNew->op=op;
    pNew->res=res;
    pNew->arg1=arg1;
    pNew->arg2=arg2;
    return pNew;
}

void container_add_sucre_asm(container *pCont, enum Operation op, int res, int arg1, int arg2) {
    asmLine *pEntry = CreateAsmLine(op,res,arg1,arg2);
    container_add(pCont, pEntry);
}

void print_asm(container *pCont) {
    int i = 0;
    char inst[4] = "";
    asmLine* pEntry;
    while (i!=pCont->nb) {
        i++;
        pEntry = container_get_by_index(pCont, i);
        if(pEntry==NULL)return;
        strcpy(inst, int_to_instr(pEntry->op));
        if (!strcmp(inst, "AFC")) {
            printf("%d:\t%s %d #%x\n",i, inst, pEntry->res, pEntry->arg1);
        } else {
            printf("%d:\t%s %d %d %d\n",i, inst, pEntry->res, pEntry->arg1, pEntry->arg2);
        }
    }
}

char* int_to_instr(int inst) {
    switch(inst){
        case ADD: return "ADD";
        case MUL: return "MUL";
        case SOU: return "SOU";
        case DIV: return "DIV";
        case COP: return "COP";
        case AFC: return "AFC";
        case JMP: return "JMP";
        case JMF: return "JMF";
        case INF: return "INF";
        case SUP: return "SUP";
        case EQU: return "EQU";
        case PRI: return "PRI";
        default: return "";
    }
}

void write_asm_to_file(container *pCont, const char *filename) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    int i = 0;
    char inst[4] = "";
    asmLine* pEntry;
    while (i != pCont->nb) {
        i++;
        pEntry = container_get_by_index(pCont, i);
        if (pEntry == NULL) {
            fclose(file);
            return;
        }
        strcpy(inst, int_to_instr(pEntry->op));
        if (!strcmp(inst, "AFC")) {
            fprintf(file, "%d:\t%s %d #%x\n",i, inst, pEntry->res, pEntry->arg1);
        } else {
            fprintf(file, "%d:\t%s %d %d %d\n",i, inst, pEntry->res, pEntry->arg1, pEntry->arg2);
        }
    }

    fclose(file);
}