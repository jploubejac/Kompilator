#include <stdio.h> 
#include <string.h>


int main(){
    int registre[15];

    FILE *file = fopen("asm.dump", "r");

    if (file==NULL){
        perror("Erreur lors de l'ouverture du fichier");
    }
    char line[256];
    char OP[4];
    int A;
    int B;
    int C;
    while(fgets(line, sizeof(line), file)){
        if(sscanf(line,"%d: %s %d %d %d"))
    }

    switch ((int)OP) {
        case "3333":
        break;
    
    }
    return 1;

}