#ifndef DYNAMIC_ARRAY_H
#define DYNAMIC_ARRAY_H

#define DYNAMIC_ARRAY_INIT_CAPACITY 64

typedef void(*ptfV)(void*);
typedef int(*IptfVV)(void*,void*);

// Opaque declaration of the dynamicArray_t structure (defined in the .c file)
typedef struct dynamicArray_t dynamicArray_t;

/**
 * @brief Creates a new dynamic array.
 * @param pDelFunc Function pointer for element deletion (can be NULL)
 * @return Pointer to the reated dynamic array, or NULL on failure
 */
dynamicArray_t *DynamicArrayNew(ptfV pDelFunc);

/**
 * @brief Deletes the dynamic array and frees associated memory.
 * @param pArray Pointer to the dynamic array
 * @return 0 on success, -1 if pArray is NULL
 */
int DynamicArrayDel(dynamicArray_t *pArray);

/**
 * @brief Adds an element to the end of the dynamic array. 
 * @param pArray Pointer to the dynamic array
 * @param pVal Pointer to the element to add
 * @return The index of the added element, or -1 on error
 */
int DynamicArrayPush(dynamicArray_t *pArray,void *pVal);

/**
 * @brief Removes the last element from the dynamic array.
 * @param pArray Pointer to the dynamic array
 * @return 0 on success, -1 if pArray is NULL or empty
 */
int DynamicArrayPop(dynamicArray_t *pArray);

/**
 * @brief Searches for an element in the dynamic array.
 * @param pArray Pointer to the dynamic array
 * @param pVal Pointer to the element to search for 
 * @return The index of the found element, -1 if not found, -2 on error
 */
int DynamicArrayGetIndex(dynamicArray_t *pArray, void *pVal);

/**
 * @brief Searches for an element in the dynamic array based on a criterion 
 * @param pArray Pointer to the dynamic array
 * @param pFunc Comparison function returning true if the element matches
 * @param pArg Additional argument for the comparison function
 * @return Pointer to the found element, or NULL if not found or if pArray is NULL
 */
void *DynamicArrayGetIf(dynamicArray_t *pArray, IptfVV pFunc, void *pArg);

void *DynamicArrayGetIfReverse(dynamicArray_t *pArray, IptfVV pFunc, void *pArg);

/**
 * @brief Searches for the index of an element based on a criterion
 * @param pArray Pointer to the dynamic array
 * @param pFunc Comparison function returning true if the element matches
 * @param pArg Additional argument for the comparison function 
 * @return The index of the found element, -1 if not found, -2 on error 
 */
int DynamicArrayGetIndexIf(dynamicArray_t *pArray, IptfVV pFunc, void *pArg);

int DynamicArrayGetIndexIfReverse(dynamicArray_t *pArray, IptfVV pFunc, void *pArg);

/**
 * @brief Retrieves an element by its index 
 * @param pArray Pointer to the dynamic array
 * @param index Index of the element to retrieve 
 * @return Pointer to the element, or NULL on error 
 */
void *DynamicArrayGetByIndex(dynamicArray_t *pArray, int index);

/**
 * @brief Applies a function to each element of the dynamic array.
 * @param pArray Pointer to the dynamic array
 * @param pParseFunc Function applied to each element 
 * @return 0 on success, -1 if pArray is NULL
 */
int DynamicArrayParse(dynamicArray_t *pArray, ptfV pParseFunc);


/**
 * @brief Gets the number of elements stored in the dynamic array.
 * @param pArray Pointer to the dynamic array
 * @return Number of elements, -1 on error
 */
int DynamicArrayGetSize(dynamicArray_t *pArray);

/**
 * @brief Gets the current capacity of the dynamic array.
 * @param pArray Pointer to the dynamic array
 * @return Capacity of the array, -1 on error
 */
int DynamicArrayGetCapacity(dynamicArray_t *pArray);

#endif