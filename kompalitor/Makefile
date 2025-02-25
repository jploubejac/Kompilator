FILE?=tocompile.c

GRM=kompilator.y
LEX=kompilator.l
BIN=kompilator

CC=gcc
CFLAGS=-Wall -g

all: $(BIN)

OBJ=y.tab.o lex.yy.o

%.o: %.c  #tells how to compile .c files into .o
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

y.tab.c: $(GRM) # yacc part
	yacc -d $<

lex.yy.c: $(LEX) # flex part
	flex $<

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) $(CPPFLAGS) $^ -o $@

clean:
	rm $(OBJ) y.tab.c y.tab.h lex.yy.c
	rm kompilator

build_lex: 
	lex kompilator_lex.l
	gcc lex.yy.c -o kompilator

exec_lex:
	@echo $(FILE)
	@echo "\n"
	cat $(FILE) | ./kompilator
	@echo "\n"





	

