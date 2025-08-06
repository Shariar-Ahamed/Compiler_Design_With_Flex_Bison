%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}
%union
{
int num;
char *str;
};

%token PRINT ADD
%token <str> STRING
%token <num> NUMBER

%%
start:
|start input
;
input:
STRING PRINT ';' {printf("output:%s\n",$1);}
| NUMBER ADD NUMBER ';' {printf("sum:%d\n",$1+$3);}
;
%%

void yyerror(const char *s)
{printf("syntax error: %s\n",s);}

int main()
{yyparse();
return 0;}
