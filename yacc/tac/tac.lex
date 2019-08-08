%{
#include <stdio.h>
#include <math.h>
#include "y.tab.h"
int c;
//extern char* yylval;
%}

DIGIT    [0-9]
ID       [a-z][a-z0-9]*

%%

" "       	;
{ID}     	{
				yylval.text = strdup(yytext);
            	return(ID);
          	}
          	
{DIGIT}+    {
            	yylval.text = strdup(yytext);
            	return(NUMBER);
          	}
          	
[^a-z0-9\b]	{
        		c = yytext[0];
                return(c);
            }

