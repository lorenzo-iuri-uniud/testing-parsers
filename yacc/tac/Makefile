all: tac

y.tab.c : tac.yacc
	yacc -d tac.yacc

y.tab.h : tac.yacc
	yacc -d tac.yacc

lex.yy.c : y.tab.h y.tab.c
	lex tac.lex

tac : y.tab.c lex.yy.c
	cc y.tab.c lex.yy.c -o tac && echo "run with ./tac"

clean : 
	rm -f lex.yy.c y.tab.c y.tab.h tac

