#include "container.h"

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
};

typedef struct{
    enum Operation op;
    int res;
    int arg1;
    int arg2;
}asmLine;

asmLine *CreateAsmLine(enum Operation op, int res, int arg1, int arg2);
void container_add_sucre_asm(container *pCont, enum Operation op, int res, int arg1, int arg2);