#ifndef DYNAMIC_ARRAY_H
#define DYNAMIC_ARRAY_H



typedef void(*ptfV)(void*);
typedef int(*IptfVV)(void*,void*);

typedef struct dynamicArray_t dynamicArray_t;

dynamicArray_t *DynamicArrayNew(ptfV pDelFunc);
void DynamicArrayDel(dynamicArray_t *pArray);
int DynamicArrayPush(dynamicArray_t *pArray,void *pVal);
void DynamicArrayPop(dynamicArray_t *pArray);
int DynamicArrayGetIndex(dynamicArray_t *pArray, void *pVal);
void *DynamicArrayGetIf(dynamicArray_t *pArray, IptfVV pFunc, void *pArg);
int DynamicArrayGetIndexIf(dynamicArray_t *pArray, IptfVV pFunc, void *pArg);
void *DynamicArrayGetByIndex(dynamicArray_t *pArray, int index);
void DynamicArrayParse(dynamicArray_t *pArray, ptfV pParseFunc);
int DynamicArrayGetSize(dynamicArray_t *pArray);
int DynamicArrayGetCapacity(dynamicArray_t *pArray);

#endif