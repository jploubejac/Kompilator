#include "functionSymbolEntry.h"
#include <stdio.h>


functionSymbolEntry_t *functionSymbolEntryNew(char *pName, int addr){
    functionSymbolEntry_t *pSym= malloc(sizeof(functionSymbolEntry_t));
    pSym->addr=addr;
    strcpy(pSym->name, pName);
    return pSym;
}

void functionSymbolEntryDeleteFunction(functionSymbolEntry_t *pSymbole){
    free(pSymbole);
}

int functionSymbolEntryIsName(functionSymbolEntry_t *pSymbole, char *pName){
    return !strcmp(pSymbole->name, pName);
}

int DynamicArrayPushFunctionSymbolEntry(dynamicArray_t *pArray, char *pName, int addr){
    functionSymbolEntry_t *pNew=functionSymbolEntryNew(pName,addr);
    return DynamicArrayPush(pArray,(void*)pNew);
}

void DynamicArrayFunctionSymbolEntryPrint(dynamicArray_t *pArray){
    int i = 0;
    functionSymbolEntry_t* pEntry;
    while (i!=DynamicArrayGetSize(pArray)) {
        pEntry = DynamicArrayGetByIndex(pArray, i);
        if(pEntry==NULL)return;
        printf("%d:\t%s\t%d\n",i, pEntry->name, pEntry->addr);
        i++;
    }
}

void DynamicArrayFunctionSymbolEntryPrintToFile(dynamicArray_t *pArray, const char *filename){
    FILE *f = fopen(filename, "w");
    if (f == NULL)
    {
        printf("Error opening file!\n");
        return;
    }
    fprintf(f, "Function Table\n");
    int i = 0;
    functionSymbolEntry_t* pEntry;
    while (i!=DynamicArrayGetSize(pArray)) {
        pEntry = DynamicArrayGetByIndex(pArray, i);
        if(pEntry==NULL)return;
        fprintf(f, "%d:\t%s\t%d\n",i, pEntry->name,pEntry->addr);
        i++;
    }
    fclose(f);
}