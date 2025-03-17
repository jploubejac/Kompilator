#include "container.h"

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

