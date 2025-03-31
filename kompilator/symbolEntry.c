#include "symbolEntry.h"
#include <string.h>
#include <stdio.h>

symbolEntry_t *SymbolEntryNew(char* name) {
    static int compteur = 0;
    symbolEntry_t* entry = (symbolEntry_t*)malloc(sizeof(symbolEntry_t));
    if (!strcmp(name, "temp")) {
        char index[20];
        sprintf(index, "%d", compteur++);
        char variable[17];
        strcpy(variable, name);
        strcat(variable, index);
        printf("%s\n", variable);
        strcpy(entry->name, variable);
    } else {
        strcpy(entry->name, name);
    }
    return entry;
}


void symbolEntryDeleteFunction(symbolEntry_t *pEntry){
    free(pEntry);
}

int DynamicArrayPushSymbolEntry(dynamicArray_t *pArray, char* name){
    if(pArray==NULL)return -1;
    symbolEntry_t* entry = SymbolEntryNew(name);
    return DynamicArrayPush(pArray, entry);
}

int symbolEntryIsName(symbolEntry_t *pTs, char *name){
    return !strcmp(pTs->name, name);
}

void DynamicArraySymbolEntryPrint(dynamicArray_t *pArray){
    int i = 0;
    symbolEntry_t* pEntry;
    while (i!=DynamicArrayGetSize(pArray)) {
        pEntry = DynamicArrayGetByIndex(pArray, i);
        if(pEntry==NULL)return;
        printf("%d:\t%s\n",i, pEntry->name);
        i++;
    }
}

void DynamicArraySymbolEntryPrintToFile(dynamicArray_t *pArray, const char *filename){
    FILE *f = fopen(filename, "a");
    if (f == NULL)
    {
        printf("Error opening file!\n");
        return;
    }
    fprintf(f, "Symbol Table\n");
    int i = 0;
    symbolEntry_t* pEntry;
    while (i!=DynamicArrayGetSize(pArray)) {
        pEntry = DynamicArrayGetByIndex(pArray, i);
        if(pEntry==NULL)return;
        fprintf(f, "%d:\t%s\n",i, pEntry->name);
        i++;
    }
    fclose(f);
}