%{
	#define YYERROR_VERBOSE 1
	#include <stdio.h>
	#include <stdlib.h>
	extern int line;
	int yylex(void);
	void yyerror(char *msg);

%}
%token CLOSING_MORE_SIGN
%token TAG_DOCKTYPE TAG_COMMENT_START TAG_COMMENT_END
%token TAG_HTML TAG_HTML_CLOSE
%token TAG_HEAD TAG_HEAD_CLOSE
%token GENERAL_TAG GENERAL_TAG_CLOSE HEAD_SECTION_VOID_TAG
%token TAG_BODY TAG_BODY_CLOSE
%token COMMON_TAG COMMON_TAG_CLOSE COMMON_VOID_TAG
%token TAG_TITLE TAG_TITLE_CLOSE TITLE_TEXT
%token TAG_STYLE TAG_STYLE_CLOSE TAG_SCRIPT TAG_SCRIPT_CLOSE
%token ATTRIBUTE VALUE
%%
html_doc: TAG_DOCKTYPE html_section
		| comments TAG_DOCKTYPE html_section
		| error { yyerrok; printf("in line %d.\n", line); exit(-1);}

comments: TAG_COMMENT_START TAG_COMMENT_END
			| comments TAG_COMMENT_START TAG_COMMENT_END

html_section: html_start head_section body_section TAG_HTML_CLOSE
			| html_start head_section body_section TAG_HTML_CLOSE comments

html_start: TAG_HTML payload
			| comments TAG_HTML payload

head_section: head_section_start head_section_content title_section head_section_content TAG_HEAD_CLOSE

head_section_start: TAG_HEAD payload
				  | comments TAG_HEAD payload

head_section_content: 
	   | head_section_content GENERAL_TAG payload head_section_content GENERAL_TAG_CLOSE
	   | head_section_content HEAD_SECTION_VOID_TAG payload
	   | head_section_content TAG_STYLE payload TAG_STYLE_CLOSE
	   | head_section_content TAG_SCRIPT payload TAG_SCRIPT_CLOSE
	   | head_section_content TAG_COMMENT_START TAG_COMMENT_END

title_section: TAG_TITLE payload TITLE_TEXT TAG_TITLE_CLOSE

body_section: body_section_start body_section_content TAG_BODY_CLOSE

body_section_start: TAG_BODY payload
				  | comments TAG_BODY payload

body_section_content:
	   | body_section_content COMMON_TAG payload body_section_content COMMON_TAG_CLOSE
	   | body_section_content GENERAL_TAG payload body_section_content GENERAL_TAG_CLOSE
	   | body_section_content COMMON_VOID_TAG payload
	   | body_section_content TAG_SCRIPT payload TAG_SCRIPT_CLOSE
	   | body_section_content TAG_COMMENT_START TAG_COMMENT_END
payload: CLOSING_MORE_SIGN
	   | atr_sequence CLOSING_MORE_SIGN
atr_sequence: ATTRIBUTE VALUE
	   | atr_sequence ATTRIBUTE VALUE