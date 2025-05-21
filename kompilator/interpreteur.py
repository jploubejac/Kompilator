registres = [0] * 16
instructions = []

with open("interpret.dump", "r") as asm_file:
    for asm_line in asm_file:
        line_parts = asm_line.strip().split("\t")
        if len(line_parts) < 2:
            continue
        line_to_interpret = line_parts[1].split()
        op = line_to_interpret[0]
        args = [int(x.replace("#","")) for x in line_to_interpret[1:]]
        while len(args) < 3:
            args.append(0)
        instructions.append((op,*args))

pc = 0
while pc < len(instructions):
    op,a,b,c = instructions[pc]
    if op == "AFC":
        registres[a] = b
    elif op == "ADD":
        registres[a] = registres[b] + registres[c]
    elif op == "SOU":
        registres[a] = registres[b] - registres[c]
    elif op == "MUL":
        registres[a] = registres[b] * registres[c]
    elif op == "DIV":
        registres[a] = registres[b] / registres[c]
    elif op == "COP":
        registres[a] = registres[b]
    elif op == "JMP":
        pc = a
        continue
    elif op == "JMF":
        if registres[b] == 0:
            pc = a
        continue
    elif op == "SUP":
        registres[a] = int(registres[b] > registres[c])
    elif op == "INF":
        registres[a] = int(registres[b] < registres[c])
    elif op == "EQU":
        registres[a] = int(registres[b] == registres[c])
    elif op == "AND":
        registres[a] = int(registres[b] and registres[c])
    elif op == "OR":
        registres[a] = int(registres[b] or registres[c])
    elif op == "PRI":
        print(f"R{a} = {registres[a]}")
    pc += 1