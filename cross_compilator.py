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
    output = []

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

        line_output = f"{instr.line:02}: {op}"
        if a is not None:
            line_output += f" {reg(a)}"
        if b is not None:
            line_output += f" {reg(b)}"
        if c is not None:
            line_output += f" {reg(c)}"
        output.append(line_output)

    return output

# === MAIN ===
input_filename = "asm_memoire.txt"
output_filename = "asm_registres.txt"

with open(input_filename, "r") as f:
    asm_input = f.read()

instructions = parse_table(asm_input)
reg_asm = compile_to_asm_with_registers(instructions)

with open(output_filename, "w") as f:
    f.write("\n".join(reg_asm))

print(f"✅ Compilation terminée. Résultat écrit dans {output_filename}")

