#include "container.h"
#include <stdlib.h>
#include <stdio.h>

int main(){
    container cont;
    int *pA=(int*)malloc(sizeof(int));
    *pA=3;
    int *pB =(int*)malloc(sizeof(int));
    *pB=3156657;
    container_add(&cont,pA);
    container_add(&cont,pB);
    printf("Mon premier: %d\n", *((int*)(cont.pHead->pVal)));
    printf("Mon deuxieme: %d\n", *((int*)(cont.pTail->pVal)));
    container_del_all(&cont);
    return 0;
}