FILE?=sample_files/tocompile.c

GRM=kompilator.y
LEX=kompilator.l
BIN=kompilator

CC=gcc
CFLAGS=-Wall -g

all: $(BIN)

OBJ=y.tab.o lex.yy.o dynamicArray.o symbolEntry.o asmLine.o functionSymbolEntry.o

%.o: %.c  #tells how to compile .c files into .o
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

y.tab.c: $(GRM) # yacc part
	yacc -t -v -g -d  $<

lex.yy.c: $(LEX) # flex part
	flex $<

$(BIN): $(OBJ) # this combines flex and yacc output in the final executable
	$(CC) $(CFLAGS) $(CPPFLAGS) $^ -o $@

container.o: dynamicArray.c dynamicArray.h
	$(CC) -c $(CFLAGS) $< -o $@

symbol_table.o: symbolEntry.c symbolEntry.h
	$(CC) -c $(CFLAGS) $< -o $@

asm.o: asmLine.c asmLine.h
	$(CC) -c $(CFLAGS) $< -o $@

functionSymbolEntry.o: functionSymbolEntry.c functionSymbolEntry.h
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm $(OBJ) y.tab.c y.tab.h lex.yy.c
	rm kompilator

exec:
	@echo 🛰️ FLEX and YACC execution on $(FILE) 🛰️
	@echo "\nRESULT: 🚀"
	@cat $(FILE) | ./kompilator
	@echo "\n"

test:
	@echo 🪐 TESTING 🪐
	@./run_all.sh

indent:
	@echo "Running indent on all files in sample_files..."
	@indent sample_files/* 2>/dev/null || echo "No valid files to indent."
	@echo "Indentation complete!"

graph: 
	@dot -Tpdf graph.gv > graph.pdf 
	@open graph.pdf





	

