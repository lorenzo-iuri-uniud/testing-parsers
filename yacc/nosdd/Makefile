all: calc

y.tab.c : calc.yacc
	yacc -d calc.yacc

y.tab.h : calc.yacc
	yacc -d calc.yacc

lex.yy.c : y.tab.h y.tab.c
	lex calc.lex

calc : y.tab.c lex.yy.c
	cc y.tab.c lex.yy.c -o calc && echo "run with ./calc"

clean : 
	rm -f lex.yy.c y.tab.c y.tab.h calc

