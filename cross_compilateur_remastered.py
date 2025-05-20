OPCODES = {
    "ADD": 0x01,
    "MUL": 0x02,
    "SOU": 0x03,
    "DIV": 0x04,
    "COP": 0x05,
    "AFC": 0x06,
    "JMP": 0x07,
    "JMF": 0x08,
    "INF": 0x09,
    "SUP": 0x0A,
    "EQU": 0x0B,
    "PRI": 0x0C,
    "NOT": 0x0D,
    "OR":  0x0E,
    "AND": 0x0F,
    "LDR": 0x10,
    "STR": 0x11,
    "NOP": 0x12,
}

class ligneInstruction:
    def __init__(self, lineNumber, OP=None, A=None,B=None, C=None ):
        self.lineNumber = lineNumber
        self.OP=OP
        self.A=A
        self.B = B 
        self.C = C
    
    def __lineMerging__(self):
        instLine = [self.OP]
        if self.A is not None:
            instLine.append(str(self.A))
        if self.B is not None:
            instLine.append(str(self.B))
        if self.C is not None:
            instLine.append(str(self.C))
        return f"{self.lineNumber}: " + " ".join(instLine)

def parse_asm(asm):
    asm_lines = []
    for asm_line in asm_lines
asm_memoire = "asm_memoire.txt"
asm_registres = "asm_registres.txt"
asm_hexa = "asm_hexa.txt"

with open(asm_memoire, "r") as mem_f:
    asm_i = mem_f.read()

print("Résultats dans \nasm_registres.txt\nasm_hexa.txt")