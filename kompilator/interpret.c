#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_LINES 1024
#define MAX_REG 15

typedef struct {
    char op[4];
    int a;
    int b;
    int c;
} Instruction;

Instruction program[MAX_LINES];
int registre[MAX_REG];
int instruction_count = 0;

void execute_program() {
    int ip = 0;  // Instruction pointer
    while (ip < instruction_count) {
        Instruction instr = program[ip];

        if (strcmp(instr.op, "AFC") == 0) {
            registre[instr.a] = instr.b;
        } else if (strcmp(instr.op, "ADD") == 0) {
            registre[instr.a] = registre[instr.b] + registre[instr.c];
        } else if (strcmp(instr.op, "SOU") == 0) {
            registre[instr.a] = registre[instr.b] - registre[instr.c];
        } else if (strcmp(instr.op, "MUL") == 0) {
            registre[instr.a] = registre[instr.b] * registre[instr.c];
        } else if (strcmp(instr.op, "DIV") == 0) {
            registre[instr.a] = registre[instr.b] / registre[instr.c];
        } else if (strcmp(instr.op, "COP") == 0) {
            registre[instr.a] = registre[instr.b];
        } else if (strcmp(instr.op, "JMP") == 0) {
            ip = instr.a;
            continue;
        } else if (strcmp(instr.op, "JMF") == 0) {
            if (registre[instr.b] == 0) {
                ip = instr.a;
                continue;
            }
        } else if (strcmp(instr.op, "SUP") == 0) {
            registre[instr.a] = registre[instr.b] > registre[instr.c];
        } else if (strcmp(instr.op, "INF") == 0) {
            registre[instr.a] = registre[instr.b] < registre[instr.c];
        } else if (strcmp(instr.op, "EQU") == 0) {
            registre[instr.a] = registre[instr.b] == registre[instr.c];
        } else if (strcmp(instr.op, "OR") == 0) {
            registre[instr.a] = registre[instr.b] || registre[instr.c];
        } else if (strcmp(instr.op, "AND") == 0) {
            registre[instr.a] = registre[instr.b] && registre[instr.c];
        } else if (strcmp(instr.op, "PRI") == 0) {
            printf("R[%d] = %d\n", instr.a, registre[instr.a]);
        }
        printf("exec\n");
        printf("%d", ip);
        ip++;
    }
}

int main() {
    FILE *file = fopen("interpret.dump", "r");
    if (file == NULL) {
        perror("Erreur lors de l'ouverture du fichier");
        return 1;
    }

    char line[256];
    int parsing_code = 0;
    while (fgets(line, sizeof(line), file)) {
        if (strstr(line, "Assembly Code")) {
            parsing_code = 1;
            continue;
        }
        if (!parsing_code) continue;

        int line_num;
        char op[4];
        char arg1[16], arg2[16], arg3[16];
        int count = sscanf(line, "%d: %s %15s %15s %15s", &line_num, op, arg1, arg2, arg3);

        if (count >= 2) {
            Instruction instr;
            strcpy(instr.op, op);
            instr.a = (count >= 3 && arg1[0] == '#') ? atoi(arg1 + 1) : atoi(arg1);
            instr.b = (count >= 4 && arg2[0] == '#') ? atoi(arg2 + 1) : atoi(arg2);
            instr.c = (count >= 5 && arg3[0] == '#') ? atoi(arg3 + 1) : atoi(arg3);

            program[instruction_count++] = instr;
        }
    }

    fclose(file);
    execute_program();

    return 0;
}
