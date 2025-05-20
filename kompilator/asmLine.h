#ifndef ASM_LINE_H
#define ASM_LINE_H
#include "dynamicArray.h"
#include <stdlib.h>

enum operation_e{
    OP_ADD  =0x01,
    OP_MUL  =0x02,
    OP_SOU  =0x03,
    OP_DIV  =0x04,
    OP_COP  =0x05,
    OP_AFC  =0x06,
    OP_JMP  =0x07,
    OP_JMF  =0x08,
    OP_INF  =0x09,
    OP_SUP  =0x0A,
    OP_EQU  =0x0B,
    OP_PRI  =0x0C,
    OP_NOT  =0x0D,
    OP_OR   =0x0E,
    OP_AND  =0x0F,
    OP_LDR  =0x10,
    OP_STR  =0x11,
    OP_NOP  =0x12,
    OP_RSS  =0x13,
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

int isJmfWithoutAdress(asmLine_t *pAsm, void *pNull);
int isJmpWithoutAdress(asmLine_t *pAsm, void *pNull);


#endif