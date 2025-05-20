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
    "RSS": 0x13,
}

# classe étant une ligne asm
class ligneInstruction:
    def __init__(self, lineNumber, OP=None, A=None,B=None, C=None ):
        self.lineNumber = lineNumber
        self.OP=OP
        self.A=A
        self.B = B 
        self.C = C
    
    def __str__(self):
        instLine = [self.OP]
        if self.A is not None:
            instLine.append(str(self.A))
        if self.B is not None:
            instLine.append(str(self.B))
        if self.C is not None:
            instLine.append(str(self.C))
        return f"{self.lineNumber}: " + " ".join(instLine)

# passe des lignes du fichier à un tableau contenant des ligneInstruction
def parse_asm(asm):
    asm_lines = []
    for asm_line in asm.strip().split("\n"):
        asm_line_splitted = asm_line.split(":")
        index = int(asm_line_splitted[0].strip())
        toks = asm_line_splitted[1].strip().split()
        opcode = toks[0]
        arguments = []
        for tok in toks[1:]:
            if tok.startswith("#"):
                arguments.append(tok)
            elif tok.lstrip("-").isdigit():
                arguments.append(int(tok))
            else:
                arguments.append(tok)
        while len(arguments) < 3:
            arguments.append(None)
        asm_lines.append(ligneInstruction(index,opcode,*arguments))
    return asm_lines

# orienté mémoire -> orienté registres, via un dictionnaire
def memory_to_registers(asm_lines):
    memReg = {}
    counter = 0
    reg_lines = []
    reg_lines_str = []

    def get_reg(addr):
        nonlocal counter
        if addr not in memReg:
            memReg[addr] = f"R{counter}"
            counter += 1
        return memReg[addr]
    
    for asm_line in asm_lines:
        OP, A, B, C = asm_line.OP, asm_line.A, asm_line.B, asm_line.C

        def reg(x):
            if isinstance(x, int):
                return get_reg(x)
            elif isinstance(x,str) and x.startswith("#"):
                return x
            else:
                return x
        lineConverted = ligneInstruction(asm_line.lineNumber, OP, reg(A), reg(B), reg(C))
        reg_lines.append(lineConverted)
        reg_lines_str.append(str(lineConverted))
    return reg_lines_str, reg_lines

# valeur string -> valeur int
def byteConversion(val):
    if val is None:
        return 0
    elif isinstance(val, str) and val.startswith("#"):
        return int(val[1:])
    elif isinstance(val,int):
        return val
    elif isinstance(val, str) and val.startswith("R"):
        return int(val[1:])
    else:
        raise ValueError("ERREUR: valeur inconnue: {val}")

# ligne asm_registre -> ligne asm_hexa : C B OP A
def registres_to_hex(instr_reg):
    hex_lines = []
    for instr in instr_reg:
        OP_HEX = OPCODES.get(instr.OP.upper(), 0)
        A = byteConversion(instr.A)
        B = byteConversion(instr.B)
        C = byteConversion(instr.C)

        line = (C << 24) | (B << 16) | (OP_HEX << 8) | A
        hex_line = f"{instr.lineNumber} => x\"{line:08X}\","
        hex_lines.append(hex_line)
    return hex_lines

asm_memoire = "asm_memoire.txt"
asm_registres = "asm_registres.txt"
asm_hexa = "asm_hexa.txt"

# lectures / écritures des fichiers
with open(asm_memoire, "r") as mem_f:
    asm_i = mem_f.read()

asm_lines = parse_asm(asm_i)
reg_asm_str, reg_asm = memory_to_registers(asm_lines)

with open(asm_registres, "w") as reg_f:
    reg_f.write("\n".join(reg_asm_str))

hex_lines = registres_to_hex(reg_asm)

with open(asm_hexa, "w") as hexa_f:
    for hex_line in hex_lines:
        hexa_f.write(hex_line + " \n")

print("Résultats dans \nasm_registres.txt\nasm_hexa.txt")