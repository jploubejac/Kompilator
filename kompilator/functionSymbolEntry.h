
#ifndef FUNCTION_SYMBOL_ENTRY_H
#define FUNCTION_SYMBOL_ENTRY_H

#include <stdlib.h>
#include <string.h>
#include "dynamicArray.h"

typedef struct{
    char name[20];
    int addr;
}functionSymbolEntry_t;

#define SYMBOL_NAME_MAX_LENGTH 30  // Maximum length of a symbol name

functionSymbolEntry_t *functionSymbolEntryNew(char *pName, int addr);

void functionSymbolEntryDeleteFunction(functionSymbolEntry_t *pSymbole);

int functionSymbolEntryIsName(functionSymbolEntry_t *pSymbole, char *pName);

int DynamicArrayPushFunctionSymbolEntry(dynamicArray_t *pArray, char *pName, int addr);

void DynamicArrayFunctionSymbolEntryPrint(dynamicArray_t *pArray);

void DynamicArrayFunctionSymbolEntryPrintToFile(dynamicArray_t *pArray, const char *filename);

#endif