#include "symbol_table.h"
#include <string.h>

entry_ts* create_entry_ts(char* name, int taille) {
    entry_ts* entry = (entry_ts*)malloc(sizeof(entry_ts));
    strcpy(entry->name, name);
    entry->address = (int*) malloc(taille);
    return entry;
}

void container_add_sucre_symbol(container *pCont , char* name, int taille) {
    entry_ts* entry = create_entry_ts(name, taille);
    container_add(pCont, entry);
}