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
        args = [int(tok.strip("#")) if tok.strip("#").lstrip("-").isdigit() else tok for tok in tokens[1:]]
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
            return get_reg(x) if isinstance(x, int) else x

        line_output = f"{instr.line:02}: {op}"
        if a is not None:
            line_output += f" {reg(a)}"
        if b is not None:
            line_output += f" {reg(b)}"
        if c is not None:
            line_output += f" {reg(c)}"
        output.append(line_output)

    return output

# test
asm_input = """0:	AFC 0 #3
1:	AFC 1 #5
2:	COP 2 0
3:	COP 3 1
4:	INF 2 2 3
5:	COP 3 0
6:	AFC 4 #1
7:	ADD 3 3 4
8:	COP 0 3
9:	COP 3 0
10:	COP 4 1
11:	INF 3 3 4
12:	JMF 3 4 0
13:	COP 5 0
14:	COP 6 1
15:	SUP 5 5 6
16:	COP 6 0
17:	COP 7 1
18:	EQU 6 6 7
19:	COP 7 0
20:	COP 8 1
21:	INF 7 7 8
22:	OP_OR 0 0 0
23:	COP 7 0
24:	COP 8 1
25:	EQU 7 7 8
26:	COP 8 0
27:	COP 9 1
28:	INF 8 8 9"""

instructions = parse_table(asm_input)
reg_asm = compile_to_asm_with_registers(instructions)

print("\n".join(reg_asm))

