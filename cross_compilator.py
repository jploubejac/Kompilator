class Instruction:
    def __init__(self, line, op, a=None, b=None, c=None):
        self.line = line
        self.op = op
        self.a = a
        self.b = b
        self.c = c

    def __repr__(self):
        parts = [self.op]
        if self.a is not None:
            parts.append(str(self.a))
        if self.b is not None:
            parts.append(str(self.b))
        if self.c is not None:
            parts.append(str(self.c))
        return f"{self.line:02}: " + " ".join(parts)

def parse_table(table):
    instructions = []
    for line in table.strip().split("\n"):
        parts = line.split(":")
        index = int(parts[0].strip())
        tokens = parts[1].strip().split()
        op = tokens[0]
        args = []
        for tok in tokens[1:]:
            if tok.startswith("#"):
                args.append(tok)
            elif tok.lstrip("-").isdigit():
                args.append(int(tok))
            else:
                args.append(tok)
        while len(args) < 3:
            args.append(None)
        instructions.append(Instruction(index, op, *args))
    return instructions

def compile_to_asm_with_registers(instructions):
    mem_to_reg = {}
    reg_counter = 0
    output_lines = []
    updated_instructions = []

    def get_reg(mem_addr):
        nonlocal reg_counter
        if mem_addr not in mem_to_reg:
            mem_to_reg[mem_addr] = f"R{reg_counter}"
            reg_counter += 1
        return mem_to_reg[mem_addr]

    for instr in instructions:
        op, a, b, c = instr.op, instr.a, instr.b, instr.c

        def reg(x):
            if isinstance(x, int):
                return get_reg(x)
            elif isinstance(x, str) and x.startswith("#"):
                return x
            else:
                return x

        reg_instr = Instruction(instr.line, op, reg(a), reg(b), reg(c))
        updated_instructions.append(reg_instr)
        output_lines.append(str(reg_instr))

    return output_lines, updated_instructions


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

def to_byte(val):
    if val is None:
        return 0
    elif isinstance(val, str) and val.startswith("#"):
        return int(val[1:])  # valeur immédiate
    elif isinstance(val, int):
        return val
    elif isinstance(val, str) and val.startswith("R"):
        return int(val[1:])  # registre
    else:
        raise ValueError(f"Unsupported operand: {val}")

def instructions_to_hex_lines(instructions):
    hex_lines = []
    for instr in instructions:
        op_hex = OPCODES.get(instr.op.upper(), 0)
        a = to_byte(instr.a)
        b = to_byte(instr.b)
        c = to_byte(instr.c)

        word = (c << 24) | (b << 16) | (op_hex << 8) | a
        hex_line = f"{instr.line} => x\"{word:08X}\","
        hex_lines.append(hex_line)
    return hex_lines


# === MAIN ===
input_filename = "asm_memoire.txt"
output_filename = "asm_registres.txt"

with open(input_filename, "r") as f:
    asm_input = f.read()

instructions = parse_table(asm_input)
reg_asm_lines, reg_instructions = compile_to_asm_with_registers(instructions)

with open(output_filename, "w") as f:
    f.write("\n".join(reg_asm_lines))

print(f"✅ Compilation terminée. Résultat écrit dans {output_filename}")

hex_lines = instructions_to_hex_lines(reg_instructions)

with open("asm_hexa.txt", "w") as f:
    for line in hex_lines:
        f.write(line + "\n")

print("✅ Fichier hexadécimal généré dans asm_hexa.txt")
