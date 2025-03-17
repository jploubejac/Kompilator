#include "symbol_table.h"
#include <string.h>
#include <stdio.h>

entry_ts *create_entry_ts(char* name) {
    entry_ts* entry = (entry_ts*)malloc(sizeof(entry_ts));
    strcpy(entry->name, name);
    return entry;
}

int container_add_sucre_symbol(container *pCont , char *name) {
    entry_ts* entry = create_entry_ts(name);
    int addr = container_add(pCont, entry);
    entry->address=addr;
    if (!strcmp(name,"temp")) {
        sprintf(entry->name, "temp%i", addr);
    }
    return entry->address;
}

bool entry_ts_isName(entry_ts *pTs, char *name){
    return !strcmp(pTs->name, name);
}