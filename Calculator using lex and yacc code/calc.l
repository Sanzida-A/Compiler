%{
#include <stdio.h>
#include "y.tab.h"
int word_count = 0;
//#define yywrap() 1
extern void yyerror(char*);
%}

delim 			[  \t\n]
num			[0-9]
id1          [a-z]
id2          [A-Z]
assign      [=]

%%
{delim}+ 	{}
{num}+		{  
				yylval=atoi(yytext);
				return digit; 
			}
[+] 		{
				return *yytext;
			}
[-] 		{
				return *yytext;
			}
[*] 		{
				return *yytext;
			}
[/] 		{
				return *yytext;
			}
[;] 		{
				return *yytext;
			}
[(] 		{return *yytext;}
[)] 		{return *yytext;}

{assign}    {return *yytext;}

{id1}        {yylval = *yytext - 'a'+27;return id1;}
{id2}        {yylval = *yytext - 'A';return id2;}
			

%%
int yywrap(void) {
    return 1;
}
