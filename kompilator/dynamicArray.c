#include <stdlib.h>
#include <string.h>
#include "dynamicArray.h"

struct dynamicArray_t{
    int     capacity;
    int     size;
    ptfV     pDelFunc;
    void  **pArray;
};

dynamicArray_t *DynamicArrayNew(ptfV pDelFunc){
    dynamicArray_t *pNew= malloc(sizeof(dynamicArray_t));
    pNew->capacity=64;
    pNew->size=0;
    pNew->pDelFunc=pDelFunc;
    pNew->pArray=malloc(sizeof(void *)*pNew->capacity);
    return pNew;
}

void DynamicArrayDel(dynamicArray_t *pArray){
    for(int i =0; (pArray->pDelFunc!=NULL)&&(pArray->pArray[i]!=NULL)&&(i<pArray->size); i++){
        pArray->pDelFunc(pArray->pArray[i]);
    }
    free(pArray->pArray);
    free(pArray);
}

int DynamicArrayPush(dynamicArray_t *pArray,void *pVal){
    if(pArray->size >= pArray->capacity){
        pArray->capacity=pArray->capacity*2;
        void **pNewArray= malloc(sizeof(void *)*pArray->capacity);
        memcpy(pNewArray, pArray->pArray, pArray->size * sizeof(void *));
        free(pArray->pArray);
        pArray->pArray=pNewArray;
    }
    pArray->pArray[pArray->size]=pVal;
    return pArray->size++;
}

void DynamicArrayPop(dynamicArray_t *pArray){
    if(pArray->pDelFunc!=NULL)pArray->pDelFunc(pArray->pArray[pArray->size-1]);
    pArray->size--;
}

int DynamicArrayGetIndex(dynamicArray_t *pArray, void *pVal){
    for(int i =0; (pArray->pArray[i]!=NULL)&&(i<pArray->size); i++){
        if(pArray->pArray[i]==pVal)return i;
    }
    return -1;
}

void *DynamicArrayGetIf(dynamicArray_t *pArray, IptfVV pFunc, void *pArg){
    for(int i =0; (pArray->pArray[i]!=NULL)&&(i<pArray->size); i++){
        if(pFunc(pArray->pArray[i],pArg))return pArray->pArray[i];
    }
    return NULL;
}

int DynamicArrayGetIndexIf(dynamicArray_t *pArray, IptfVV pFunc, void *pArg){
    for(int i =0; (pArray->pArray[i]!=NULL)&&(i<pArray->size); i++){
        if(pFunc(pArray->pArray[i],pArg))return i;
    }
    return -1;
}

void *DynamicArrayGetByIndex(dynamicArray_t *pArray, int index){
    if(index>=pArray->size || index<0)return NULL;
    return pArray->pArray[index];
}

void DynamicArrayParse(dynamicArray_t *pArray, ptfV pParseFunc){
    for(int i =0; (pArray->pArray[i]!=NULL)&&(i<pArray->size); i++){
        pParseFunc(pArray->pArray[i]);
    }
}

int DynamicArrayGetSize(dynamicArray_t *pArray){
    return pArray->size;
}

int DynamicArrayGetCapacity(dynamicArray_t *pArray){
    return pArray->capacity;
}