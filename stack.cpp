#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "grammar.tab.h"

int line;
int line_body;
typedef struct stack {
	char tagName[20];
	int line;
	struct stack* link;
} tagStack;

tagStack* top;
tagStack* root;

void StackPush(char* value) {
	tagStack* tmp, * tmp2;
	tmp = (tagStack*)malloc(sizeof(tagStack));
	tmp2 = (tagStack*)malloc(sizeof(tagStack));
	for (int i = 0; i < strlen(value); i++)
		tmp->tagName[i] = value[i];
	tmp->tagName[strlen(value)] = '\0';
	tmp2 = root;
	while (tmp2->link != NULL)
		tmp2 = tmp2->link;
	tmp->link = top;
	top = tmp;
	tmp->line=line;
}

void StackPop() {
	tagStack* tmp;
	if (top == NULL) {
		printf("\nStack Underflow");
		return;
	}
	tmp = top;
	top = top->link;
	tmp->link = NULL;
	free(tmp);
}

int StackIsEmpty() {
	return (top == NULL);
}

char* StackTop() {
	if (!StackIsEmpty())
		return top->tagName;
	else exit(1);
}
void StackPrint() {
	tagStack* tmp;

	if (top == NULL) {
		printf("\nStack Underflow");
		exit(1);
	}

	tmp = top;
	while (tmp != NULL) {
		for(int i=1;i<20&&tmp->tagName[i]!='\0';i++) printf("%c", tmp->tagName[i]);
		printf(", line: %d; ", tmp->line);
		tmp = tmp->link;
	}
}
void StackDeinit() {
	if(!StackIsEmpty()){
		printf("ERROR: No closing tag was found for: %s>\nThe following closing tags were not found due to program termination:\nbody, line: %d; ", StackTop(), line_body);
		StackPrint();
	}
	while (!StackIsEmpty()) StackPop();
}

void StackInit() {
	tagStack* tmproot;
	tmproot = (tagStack*)malloc(sizeof(tagStack));
	tmproot->link = NULL;
	root = tmproot;
	top = NULL;
}

void StackCheck(char* data) {

	if (StackIsEmpty()) {
		printf("ERROR: there were no opening tags.\n");
		exit(-1);
	}
	int i;
	char newData[20];
	newData[0] = '<';
	for (i = 2; i < strlen(data); i++)
		newData[i - 1] = data[i];
	newData[i - 2] = '\0';
	if (strcmp(newData, StackTop())) {
		printf("ERROR: incorrect nesting of tags on line %d.\n", line);
		printf("Expected: %s>; received: %s>.\n", StackTop(), newData);
		StackDeinit();
		exit(-1);
	}
	StackPop();
}
