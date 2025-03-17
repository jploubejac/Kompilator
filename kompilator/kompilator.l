%{
#pragma GCC diagnostic ignored "-Wunused-function"
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap
D   [0-9]
E [Ee][-+]?{D}+

%%
{D}+ 					{ return tNB; }
{D}+{E} 				{ return tEXP; }
{D}*"."{D}*({E})? 		{ return tREAL; }
"="               		{ return tEQ; }
main              		{ return tMAIN; }
"{"               		{ return tOB; }
"}"               		{ return tCB; }
const					{ return tCONST; }
int 					{ return tINT; }
"+"               		{ return tADD; }
"++"               		{ return tINC; }
"-"               		{ return tSUB; }
"--"               		{ return tDEC; }
"*"               		{ return tMUL; }
"/"               		{ return tDIV; }
"("               		{ return tOP; }
")"               		{ return tCP; }
[ \t]	         		{ }
","	         			{ return tSEP; }
[\n]+          			{ } // return tEOL; for now we return EOL, might change
"!"                     { return tNOT;}
">"                     { return tSUP;}
"<"                     { return tINF;}
"||"                     { return tOR;}
"&&"                     { return tAND;}
";"               		{ return tSEM;}
printf					{ return tPRINTF;}
do  					{ return tDO;}
while             		{ return tWHILE; }
void              		{ return tVOID; }
if 						{ return tIF; }
else 					{ return tELSE; }
for						{ return tFOR; }
[A-Za-z_][A-Za-z0-9_]*	{ yylval.str = strdup(yytext);
                          return tID;
                        }
.                 		{ exit(2); }

%%
