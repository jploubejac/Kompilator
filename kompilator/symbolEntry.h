#ifndef SYMBOL_ENTRY_H
#define SYMBOL_ENTRY_H

#include <stdlib.h>
#include "dynamicArray.h"


#define SYMBOL_NAME_MAX_LENGTH 30  // Maximum length of a symbol name

typedef struct{
    char name[SYMBOL_NAME_MAX_LENGTH];
}symbolEntry_t;

symbolEntry_t* SymbolEntryNew(char* name);

/**
 * @brief Compares the name of a symbolEntry structure with a given name.
 * @param pTs Pointer to the symbolEntry structure
 * @param name Name to compare
 * @return 1 if the names match, 0 otherwise
 */
int symbolEntryIsName(symbolEntry_t *pTs, char *name);

/**
 * @brief Deletes a symbolEntry structure and frees associated memory.
 * Uses for the dynamicArrayDel function.
 * @param pEntry Pointer to the symbolEntry structure
 */
void symbolEntryDeleteFunction(symbolEntry_t *pEntry);

/**
 * @brief Creates a new symbolEntry structure and adds it to the dynamic array.
 * @param pArray Pointer to the dynamic array
 * @param name Name of the symbol
 * @return The index of the added element, or -1 on error
 */
int DynamicArrayPushSymbolEntry(dynamicArray_t *pArray, char* name);

/**
 * @brief Prints the content of a dynamic array of symbolEntry structures.
 * @param pArray Pointer to the dynamic array
 */
void DynamicArraySymbolEntryPrint(dynamicArray_t *pArray);

/**
 * @brief Writes the content of a dynamic array of symbolEntry structures to a file.
 * @param pArray Pointer to the dynamic array
 * @param filename Name of the file
 */
void DynamicArraySymbolEntryPrintToFile(dynamicArray_t *pArray, const char *filename);
#endif