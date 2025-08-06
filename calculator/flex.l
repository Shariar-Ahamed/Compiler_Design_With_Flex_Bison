%{
#include "bison.tab.h"
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
%}

%%
[0-9]+ {yylval.num=atoi(yytext); return NUMBER;}
[ \n\t] ;
. {return yytext[0];}
%%

int yywrap()
{return 1;}