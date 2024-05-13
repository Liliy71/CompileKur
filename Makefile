all:
	bison -d grammar.y --verbose
	flex lex.l stack.cpp
	cc lex.yy.c grammar.tab.c -o out

clean:
	rm grammar.tab.c grammar.tab.h lex.yy.c grammar.output out
test:
	./out test/test.txt
	./out test/test.txt