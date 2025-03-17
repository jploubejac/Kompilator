#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

#include <stdlib.h>
#include "container.h"

typedef struct{
    char name[30];
    void* address;
} entry_ts;

entry_ts* create_entry_ts(char* name, int taille);
void container_add_sucre_symbol(container *pCont, char* name, int taille);

#endif