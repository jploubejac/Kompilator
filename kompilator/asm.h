enum Operation{
    ADD=0x1,
    MUL=0x2,
    SOU=0x3,
    DIV=0x4,
    COP=0x5,
    AFC=0x6,
    JMP=0x7,
    JMF=0x8,
    INF=0x9,
    SUP=0xA,
    EQU=0xB,
    PRI=0xC
}

typedef struct{
    Operation op;
    void *pRes;
    void *pArg1;
    void *pArg2;
}asmLine;

asmLine *CreateAsmLine(Operation op, void *pRes, void *pArg1, void *pArg2);