%{
#pragma GCC diagnostic ignored "-Wunused-function"
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap
D   [0-9]
DECIMAL {D}+.{D}+
E [Ee][-+]?{D}+
CHAR [a_zA-Z]

%%
{D}+ 					{ printf(" tNB"); return tNB; }
{D}+{E} 				{ printf(" tEXP"); return tEXP; }
{D}*"."{D}*({E})? 		{ printf(" tREAL"); return tREAL; }
"="               		{ printf(" tEQ"); return tEQ; }
main              		{ printf(" tMAIN"); return tMAIN; }
"{"               		{ printf(" tOB"); return tOB; }
"}"               		{ printf(" tCB"); return tCB; }
const					{ printf(" tCONST"); return tCONST; }
int 					{ printf(" tINT"); return tINT; }
"+"               		{ printf(" tADD"); return tADD; }
"-"               		{ printf(" tSUB"); return tSUB; }
"*"               		{ printf(" tMUL"); return tMUL; }
"/"               		{ printf(" tDIV"); return tDIV; }
"("               		{ printf(" tOP"); return tOP; }
")"               		{ printf(" tCP"); return tCP; }
[ \t]	         		{ printf(" "); }
","	         			{ printf(" tSEP"); return tSEP; }
[\n]+          			{ printf(" \n"); } // return tEOL; for now we return EOL, might change
";"               		{ printf(" tSEM"); return tSEM; }
printf					{ printf(" tPRINTF"); return tPRINTF; }
while             		{ printf(" tWHILE"); return tWHILE; }
void              		{ printf(" tVOID"); return tVOID; }
if 						{ printf(" tIF"); return tIF; }
else 					{ printf(" tELSE"); return tELSE; }
for						{ printf(" tFOR"); return tFOR; }
[A-Za-z_][A-Za-z0-9_]*	{ printf(" tID[%s]", yytext); return tID; }
.                 		{ printf(" ERROR\n"); exit(2); }

%%