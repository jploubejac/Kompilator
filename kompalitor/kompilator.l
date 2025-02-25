%{
#pragma GCC diagnostic ignored "-Wunused-function"
#include <stdlib.h>
#include <stdio.h>
%}

%option noyywrap
D   [0-9]
DECIMAL {D}+.{D}+
E [Ee][-+]?{D}+
CHAR [a_zA-Z]

%%
{D}+ 					printf(" tNB");
{D}+{E} 				printf(" tEXP");
{D}*"."{D}*({E})? 		printf(" tREAL");
"="               		printf(" tEQ");
main              		printf(" tMAIN");
"{"               		printf(" tOB");
"}"               		printf(" tCB");
const					printf(" tCONST");
int 					printf(" tINT");
"+"               		printf(" tADD");
"-"               		printf(" tSUB");
"*"               		printf(" tMUL");
"/"               		printf(" tDIV");
"("               		printf(" tOP");
")"               		printf(" tCP");
[ \t]	         		printf(" ");
","	         			printf(" tSEP");                
[\n]+          			printf(" tEOL");                
";"               		printf(" tSEM");
printf					printf(" tPRINTF");
while             		printf(" tWHILE");
void              		printf(" tVOID");
if 						printf(" tIF");
else 					printf(" tELSE");
for						printf(" tFOR");
[A-Za-z_][A-Za-z0-9_]*	printf(" tID[%s]", yytext);
.                 		{ printf(" ERROR\n"); exit(2); }

%%