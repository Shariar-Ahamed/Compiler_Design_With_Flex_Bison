%{ 
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}
%union
{int num;};

%token <num> NUMBER

%%
start:
|start expr
;
expr:
NUMBER '+' NUMBER ';' {printf("sum:%d\n",$1+$3);}
|NUMBER '-' NUMBER ';' {printf("sub:%d\n",$1-$3);}
|NUMBER '/' NUMBER ';' {printf("div:%d\n",$1/$3);}
|NUMBER '*' NUMBER ';' {printf("mul:%d\n",$1*$3);}
%%

void yyerror(const char *s)
{printf("syntax error: %s\n",s);}

int main()
{yyparse();
return 0;}