%{
#include "new.tab.h"
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
%}

%%
print {return PRINT;}
add {return ADD;}
\"[^\"]+\" {yylval.str=strdup(yytext); return STRING;}
[0-9]+ {yylval.num=atoi(yytext); return NUMBER;}
[ \n\t] ;
. {return yytext[0];}
%%

int yywrap()
{return 1;}