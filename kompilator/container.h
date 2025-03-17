#ifndef CONTAINER_H
#define CONTAINER_H

#include <stdlib.h>

struct node{
    struct node *pPrev;
    struct node *pNext;
    void *pVal;
};
typedef struct node node;

typedef struct{
    node *pHead;
    node *pTail;
    int nb;
}container;

int container_add(container *pCont ,void *pVal);
void container_del_all(container *pCont);
void container_del_last(container *pCont);
//void container_insert_back(container *pCont, void *pVal, int);
#endif
