#include <stdio.h>
#include <stdlib.h>
#include "dynamicArray.h"

void delFunc(void *pDel){
    free(pDel);
}

int main(){
    dynamicArray_t *pTab= DynamicArrayNew(delFunc);
    int *tab[65];
    for(int i=0; i<65; i++){
        tab[i]=malloc(sizeof(int*));
        *tab[i]=i;
        DynamicArrayPush(pTab,(void *)tab[i]);
    }
    int *pInd=DynamicArrayGetByIndex(pTab,5);
    if(pInd!=NULL)printf("Le 5éme entier à la valeur: %d\n", *pInd);
    printf("capacity: %d, size: %d\n", DynamicArrayGetCapacity(pTab), DynamicArrayGetSize(pTab));
    DynamicArrayDel(pTab);
    return 0;
}