%{
#include<stdio.h>
int yylex(void);
void yyerror(const char *s);
%}

%token KEYWORD

%%
start:
|start input
;
input:
KEYWORD {printf("valid keyword.");}
%%

void yyerror(const char *s)
{printf("syntax error: %s\n",s);}

int main()
{yyparse();
return 0;}