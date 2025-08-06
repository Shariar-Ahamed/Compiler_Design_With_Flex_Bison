%{
#include "bison.tab.h"
#include<stdio.h>
%}

%%
if|for|while|else {return KEYWORD;}
.|\n ;
%%

int yywrap()
{return 1;}