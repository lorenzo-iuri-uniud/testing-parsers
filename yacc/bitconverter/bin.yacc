%{
/* code aux */
#include <stdio.h>
%}

%start begin
%token BITZERO BITONE SEPARATOR
%union{
	struct s1 {double dval; int len;} bin;
}
%type <bin> list
%type <bin> bit

%%            /* beginning of rules section */

begin:    list '\n'                 {printf( "Decimal value: %.0f\n", $1.dval ); exit(0); }
		| list SEPARATOR list '\n'  {printf( "Decimal value: %f\n", $1.dval + $3.dval/$3.len ); exit(0); }
		;

list:     list bit  {$$.len = $1.len *2; $$.dval = 2*$1.dval + $2.dval;}
		| bit       {$$.len = $1.len; $$.dval = $1.dval;}
		;

bit:	  BITZERO  {$$.len = 2; $$.dval = 0;}
		| BITONE   {$$.len = 2; $$.dval = 1;}
		
%%
int main() {
	printf("write the binary number...\n");
	return(yyparse());
}

int yyerror(s) char *s; {
  fprintf(stderr, "%s\n",s);
}

int yywrap() {
  return(1);
}
