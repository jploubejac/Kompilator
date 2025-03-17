#include "container.h"
#include <string.h>

int container_add(container *pCont ,void *pVal){
    node *pNew=(node*)malloc(sizeof(node));
    pNew->pVal=pVal;
    pNew->pPrev=pCont->pTail;
    pNew->pNext=NULL;
    if(pCont->pTail==NULL){
        pCont->pTail=pNew;
        pCont->pHead=pNew;
        pCont->nb=0;
    }else{
        pCont->pTail->pNext=pNew;
        pCont->pTail=pNew;
    }
    pCont->nb++;
    return pCont->nb;
}

void container_del_all(container *pCont){
    node *pCur= pCont->pHead;
    while(pCur!=NULL){
      node *pNex=pCur->pNext;
      if(pCur->pVal!=NULL)free(pCur->pVal);
      free(pCur);
      pCur=pNex;
    }
}

void container_del_last(container *pCont){
    if(pCont->pTail==NULL)return;
    node *pDel= pCont->pTail;
    pDel->pPrev->pNext=NULL;
    pCont->pTail=pDel->pPrev;
    free(pDel); 
}

int container_get_index(container *pCont, void *pVal){
    node *pInd=pCont->pHead;
    int index=0;
    while(pInd){
        index++;
        if(pInd->pVal==pVal)return index;
        pInd=pInd->pNext;
    }
    return -1;
}

void *container_get_if(container *pCont, bool(*pFunc)(void*, void*), void *pToCompare){
    node *pInd= pCont->pHead;
    while(pInd){
        if(pFunc(pToCompare, pInd->pVal))return pInd->pVal;
        pInd=pInd->pNext;
    }
    return NULL;
}

bool is_empty(container *pCont) {
    return !pCont->nb;
}

void *container_get_by_index(container *pCont, int index){
    node *pInd=pCont->pHead;
    while(pInd){
        index--;
        if(index==0)return pInd->pVal;
        pInd=pInd->pNext;
    }
    return NULL;
}
