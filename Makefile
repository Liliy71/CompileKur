# Определение переменных
CT_DIR := ./tests/CustomTests
CT_FILES := $(wildcard $(CT_DIR)/*.txt)
TE_DIR := ./tests/TestsWithErrors
TE_FILES := $(wildcard $(TE_DIR)/*.txt)
S_DIR := ./tests/Sites
S_FILES := $(wildcard $(S_DIR)/*.txt)
STT_DIR := ./tests/SingleTagTests
STT_FILES := $(wildcard $(STT_DIR)/*.txt)

# Цель по умолчанию
all: 
	bison -d grammar.y --verbose
	flex lex.l stack.cpp
	cc lex.yy.c grammar.tab.c -o out

clean:
	rm grammar.tab.c grammar.tab.h lex.yy.c grammar.output out

custom: $(CT_FILES)
	$(foreach file, $^, ./out $(file);)

single: $(STT_FILES)
	$(foreach file, $^, ./out $(file);)

sites: $(S_FILES)
	$(foreach file, $^, ./out $(file);)

err_tests: $(TE_FILES)
	$(foreach file, $^, ./out $(file);)

.PHONY: all clean custom single sites err_tests



