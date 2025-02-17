%option noyywrap
D   [0-9]
DECIMAL {D}+.{D}+
E [Ee][-+]?{D}+
CHAR [a_zA-Z]
VAR [a_zA-Z0-9_]

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
{CHAR}{VAR}*			printf( "tVAR");
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
[a-z]+            		printf(" tID[%s]", yytext);
{CHAR}+					printf(" tSTR");
.                 		{ printf(" ERROR\n"); exit(2); }

%%

void main(void) {
	yylex();
}
