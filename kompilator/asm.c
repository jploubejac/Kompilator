#include "asm.h"

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
