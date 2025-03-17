asmLine *CreateAsmLine(Operation op, void *pRes, void *pArg1, void *pArg2){
    asmLine *pNew= malloc(sizeof(asmLine));
    pNew->op=op;
    pNew->pRes=pRes;
    pNew->pArg1=pArg1;
    pNew->pArg2=pArg2;
    return pNew;
}