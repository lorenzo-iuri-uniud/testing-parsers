all: bin

y.tab.c : bin.yacc
	yacc -d bin.yacc

y.tab.h : bin.yacc
	yacc -d bin.yacc

lex.yy.c : y.tab.h y.tab.c
	lex bin.lex

bin : y.tab.c lex.yy.c
	cc y.tab.c lex.yy.c -o bin && echo "run with ./bin"

clean : 
	rm -f lex.yy.c y.tab.c y.tab.h bin

