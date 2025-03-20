#ifndef ASM_LINE_H
#define ASM_LINE_H
#include "container.h"
#include "dynamicArray.h"

enum operation_e{
    OP_ADD=0x1,
    OP_MUL=0x2,
    OP_SOU=0x3,
    OP_DIV=0x4,
    OP_COP=0x5,
    OP_AFC=0x6,
    OP_JMP=0x7,
    OP_JMF=0x8,
    OP_INF=0x9,
    OP_SUP=0xA,
    OP_EQU=0xB,
    OP_PRI=0xC
};

typedef struct{
    enum operation_e op;
    int res;
    int arg1;
    int arg2;
}asmLine_t;

/**
 * @brief Creates a new asmLine structure. Memory allocation is done inside the function.
 * @param op Operation code
 * @param res Result register
 * @param arg1 First argument
 * @param arg2 Second argument
 * @return Pointer to the created asmLine structure
 */
asmLine_t *AsmLineNew(enum operation_e op, int res, int arg1, int arg2);

char* int_to_instr(int inst);

void write_asm_to_file(container *pCont, const char *filename);

/**
 * @brief Deletes an asmLine structure and frees associated memory.
 * Uses for the dynamicArrayDel function.
 * @param pAsm Pointer to the asmLine structure
 */
void asmLineDeleteFunction(asmLine_t *pAsm);

/**
 * @brief Creates a new asmLine structure and adds it to the dynamic array.
 * @param pArray Pointer to the dynamic array
 * @param op Operation code
 * @param res Result register
 * @param arg1 First argument
 * @param arg2 Second argument
 * @return The index of the added element, or -1 on error
 */
int DynamicArrayPushAsmLine(dynamicArray_t *pArray, enum operation_e op, int res, int arg1, int arg2);

/**
 * @brief Print all the asmLines on the console
 * @param pArray Pointer to the dynamic array
 */
void DynamicArrayAsmLinePrint(dynamicArray_t *pArray);

/**
 * @brief Print all the asmLines on a file
 * @param pArray Pointer to the dynamic array
 * @param filename Name of the file
 */
void DynamicArrayAsmLinePrintToFile(dynamicArray_t *pArray, const char *filename);

#endif