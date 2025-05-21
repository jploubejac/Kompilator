#include <stdio.h> 
#include <string.h>
#include <stdlib.h>


#define OP_ADD "ADD" 
#define OP_MUL "MUL" 
#define OP_SOU "SOU" 
#define OP_DIV "DIV" 
#define OP_COP "COP" 
#define OP_AFC "AFC" 
#define OP_JMP "JMP" 
#define OP_JMF "JMF" 
#define OP_INF "INF" 
#define OP_SUP "SUP" 
#define OP_EQU "EQU" 
#define OP_PRI "PRI" 
#define OP_NOT "NOT" 
#define OP_OR  "OR " 
#define OP_AND "AND" 
#define OP_LDR "LDR" 
#define OP_STR "STR" 
#define OP_NOP "NOP" 
#define OP_RSS "RSS" 

int main(){
    int registre[15];

    FILE *file = fopen("asm.dump", "r");

    if (file==NULL){
        perror("Erreur lors de l'ouverture du fichier");
    }
    char line[256];
    int num;
    char rawNumber[50];
    char OP[4];
    int A;
    int B;
    int C;
    while(fgets(line, sizeof(line), file)){
        if(sscanf(line,"%d: %s %d %s %d", &num, OP, &A,rawNumber,&C)){
            if(rawNumber[0] =='#'){
                memmove(rawNumber,rawNumber+1, strlen(rawNumber));
            }
            B= atoi(rawNumber);
            if(!strcmp(OP,OP_ADD)){
                registre[A]= registre[B] + registre[C];
            }else if(!strcmp(OP, OP_MUL)){
                registre[A]= registre[B] * registre[C];
            }else if(!strcmp(OP, OP_SOU)){
                registre[A]= registre[B] - registre[C];
            }else if(!strcmp(OP, OP_DIV)){
                registre[A]= registre[B] / registre[C];
            }else if(!strcmp(OP, OP_COP)){
                registre[A]= registre[B];
            }else if(!strcmp(OP, OP_AFC)){
                registre[A]= B;
            }else if(!strcmp(OP, OP_JMP)){
                //non
            }else if(!strcmp(OP, OP_JMF)){
                //non
            }else if(!strcmp(OP, OP_INF)){
                registre[A] = registre[B] < registre[C];
            }else if(!strcmp(OP, OP_SUP)){
                registre[A] = registre[B] > registre[C];
            }else if(!strcmp(OP, OP_EQU)){
                registre[A] = registre[B] == registre[C];
            }else if(!strcmp(OP, OP_PRI)){
                printf("registre[%d] = %d\n", A, registre[A]);
            }else if(!strcmp(OP, OP_NOT)){
                registre[A] = !registre[B];
            }else if(!strcmp(OP, OP_OR)){
                registre[A] = registre[B] || registre[C];
            }else if(!strcmp(OP, OP_AND)){   
                registre[A] = registre[B] && registre[C];
            }else if(!strcmp(OP, OP_LDR)){
                //non
            }else if(!strcmp(OP, OP_STR)){
                //non
            }
            
        }
    }
    return 1;

}