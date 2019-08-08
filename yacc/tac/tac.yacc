// non mette correttamente i numeri delle variabili aux

%{
/* code aux */
#include <stdio.h>
#include <string.h>

int c;
%}

%start begin
%token NUMBER ID
%union{
	struct s1 {char* code; char* addr;} expression;
	struct s2 {char* text;} token;
	char* text;
}
%type <expression> expr
%type <token> ID NUMBER
%left '+' '-'
%left '*' '/'

%%            /* beginning of rules section */

begin:     /*empty */
    	| stat '\n'  		{}
        ;
        
stat:     expr 				{}
        ;
        
expr:     expr '*' expr   {	$$.addr = (char*)malloc(5* sizeof(char)); 
							$$.addr[0] = 't'; 
							$$.addr[1] = c+'0'; c++;
							$$.addr[2] = 0; 
							printf("%s\n", $1.code); 
							printf("%s", $3.code); 
							printf("%s = %s * %s", $$.addr, $1.addr, $3.addr); }
        | expr '/' expr   {	$$.addr = (char*)malloc(5* sizeof(char)); 
        					$$.addr[0] = 't'; 
        					$$.addr[1] = c+'0'; c++;
        					$$.addr[2] = 0; 
        					printf("%s\n", $1.code); 
        					printf("%s", $3.code); 
        					printf("%s = %s / %s", $$.addr, $1.addr, $3.addr); }
        | expr '+' expr	  {	$$.addr = (char*)malloc(5* sizeof(char)); 
        					$$.addr[0] = 't'; 
        					$$.addr[1] = c+'0'; c++;
        					$$.addr[2] = 0; 
        					printf("%s\n", $1.code);
        					printf("%s\n", $3.code);
        					printf("%s = %s + %s\n", $$.addr, $1.addr, $3.addr); }
        | expr '-' expr	  {	$$.addr = (char*)malloc(5* sizeof(char)); 
        					$$.addr[0] = 't'; 
        					$$.addr[1] = c+'0'; c++;
        					$$.addr[2] = 0; 
        					printf("%s", $1.code);
        					printf("%s", $3.code);
        					printf("%s = %s - %s", $$.addr, $1.addr, $3.addr); }
        | ID 			  {	$$.code = (char*)malloc(10* sizeof(char)); 
        					$$.code[0] = 0;
        					$$.addr = (char*)malloc(10* sizeof(char)); 
        					strncpy($$.addr, $1.text, 10); }
        | NUMBER		  {	$$.code = (char*)malloc(10* sizeof(char));
        					$$.code[0] = 0; 
        					$$.addr = (char*)malloc(10* sizeof(char)); 
        					strncpy($$.addr, $1.text, 10);  }
        ;
		
%%
int main() {
	c = 0;
	return(yyparse());
}

int yyerror(s) char *s; {
  fprintf(stderr, "%s\n",s);
  return(1);
}

int yywrap() {
  return(1);
}
