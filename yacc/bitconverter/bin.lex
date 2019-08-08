%{
#include <stdio.h>
#include "y.tab.h"
int c;
//extern int yylval;
%}

%%

" "     ;
[0]		return(BITZERO);
[1]		return(BITONE);
[.]		return(SEPARATOR);
[\n]    { c = yytext[0]; return(c); }

