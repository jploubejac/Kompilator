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
    pNew->capacity=DYNAMIC_ARRAY_INIT_CAPACITY;
    pNew->size=0;
    pNew->pDelFunc=pDelFunc;
    pNew->pArray=malloc(sizeof(void *)*pNew->capacity);
    return pNew;
}

int DynamicArrayDel(dynamicArray_t *pArray){
    if(pArray==NULL)return -1;
    for(int i =0; (pArray->pDelFunc!=NULL)&&(pArray->pArray[i]!=NULL)&&(i<pArray->size); i++){
        pArray->pDelFunc(pArray->pArray[i]);
    }
    free(pArray->pArray);
    free(pArray);
    return 0;
}

int DynamicArrayPush(dynamicArray_t *pArray,void *pVal){
    if(pArray==NULL)return -1;
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

int DynamicArrayPop(dynamicArray_t *pArray){
    if(pArray==NULL||pArray->size==0)return -1;
    if(pArray->pDelFunc!=NULL)pArray->pDelFunc(pArray->pArray[pArray->size-1]);
    pArray->size--;
    return 0;
}

int DynamicArrayGetIndex(dynamicArray_t *pArray, void *pVal){
    if(pArray==NULL)return -2;
    for(int i =0; (pArray->pArray[i]!=NULL)&&(i<pArray->size); i++){
        if(pArray->pArray[i]==pVal)return i;
    }
    return -1;
}

void *DynamicArrayGetIf(dynamicArray_t *pArray, IptfVV pFunc, void *pArg){
    if(pArray==NULL)return NULL;
    for(int i =0; (pArray->pArray[i]!=NULL)&&(i<pArray->size); i++){
        if(pFunc(pArray->pArray[i],pArg))return pArray->pArray[i];
    }
    return NULL;
}

int DynamicArrayGetIndexIf(dynamicArray_t *pArray, IptfVV pFunc, void *pArg){
    if(pArray==NULL)return -2;
    for(int i =0; (pArray->pArray[i]!=NULL)&&(i<pArray->size); i++){
        if(pFunc(pArray->pArray[i],pArg))return i;
    }
    return -1;
}

void *DynamicArrayGetByIndex(dynamicArray_t *pArray, int index){
    if(pArray==NULL)return NULL;
    if(index>=pArray->size || index<0)return NULL;
    return pArray->pArray[index];
}

int DynamicArrayParse(dynamicArray_t *pArray, ptfV pParseFunc){
    if(pArray==NULL)return -1;
    for(int i =0; (pArray->pArray[i]!=NULL)&&(i<pArray->size); i++){
        pParseFunc(pArray->pArray[i]);
    }
    return 0;
}

int DynamicArrayGetSize(dynamicArray_t *pArray){
    if(pArray==NULL)return -1;
    return pArray->size;
}

int DynamicArrayGetCapacity(dynamicArray_t *pArray){
    if(pArray==NULL)return -1;
    return pArray->capacity;
}