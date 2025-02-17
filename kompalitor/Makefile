FILE?=tocompile.c

all: clean build exec

clean:
	rm *.yy.c
	rm kompilator
build: 
	lex kompilator_lex.l
	gcc lex.yy.c -o kompilator
exec:
	@echo $(FILE)
	@echo "\n"
	cat $(FILE) | ./kompilator
	@echo "\n"


