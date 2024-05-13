/* Declaration section*/
%{
	#define _CRT_SECURE_NO_WARNINGS
	
	#include <stdio.h>
    #include <errno.h>
	#include "grammar.tab.h"
	
	extern FILE* yyin;
	int line = 1;
	int flag_warning=1;
	#ifndef unix
	#define fileno _fileno
	#endif
%}

%option stack yylineno
%x attr_exp
%x title_attr_exp
%x title_text_exp
%x comment_continue
%x style_section
%x style_attr_exp
%x script_section
%x script_attr_exp

whitespace			[ \t\r\n]
int       			[0-9]+
name 				[a-zA-Z_]+[:a-zA-Z_0-9\.\-]*
str 				[a-zA-Z_]+[ :a-zA-Z_0-9\.]*

tagDOCTYPE			\![dD][oO][cC][tT][yY][pP][eE][ ]+[hH][tT][mM][lL]
tagHTML				[hH][tT][mM][lL]
tagHEAD				[hH][eE][aA][dD]
tagBODY				[bB][oO][dD][yY]
tagTITLE			[tT][iI][tT][lL][eE]

tagA				[aA]
tagAbbr				[aA][bB][bB][rR]
tagAddress 			[aA][dD][dD][rR][eE][sS][sS]
tagArticle			[aA][rR][tT][iI][cC][lL][eE]
tagAside			[aA][sS][iI][dD][eE]
tagAudio			[aA][uU][dD][iI][oO]
tagB				[bB]
tagBdi				[bB][dD][iI]
tagBdo				[bB][dD][oO]
tagBlockquote		[bB][lL][oO][cC][kK][qQ][uU][oO][tT][eE]
tagButton			[bB][uU][tT][tT][oO][nN]
tagCanvas			[cC][aA][nN][vV][aA][sS]
tagCaption			[cC][aA][pP][tT][iI][oO][nN]
tagCite				[cC][iI][tT][eE]
tagCode				[cC][oO][dD][eE]
tagColgroup			[cC][oO][lL][gG][rR][oO][uU][pP]
tagData				[dD][aA][tT][aA]
tagDatalist			[dD][aA][tT][aA][lL][iI][sS][tT]
tagDd 				[dD][dD]
tagDl				[dD][lL]
tagDt				[dD][tT]
tagDel				[dD][eE][lL]
tagDetails			[dD][eE][tT][aA][iI][lL][sS]
tagDfn				[dD][fF][nN]
tagDialog			[dD][iI][aA][lL][oO][gG]
tagDiv				[dD][iI][vV]
tagEm 				[eE][mM]
tagEmbed			[eE][mM][bB][eE][dD]
tagFieldset			[fF][iI][eE][lL][dD][sS][eE][tT]
tagFigcaption		[fF][iI][g][cC][aA][pP][tT][iI][oO][nN]
tagFigure			[fF][iI][gG][uU][rR][eE]
tagFooter			[fF][oO][oO][tT][eE][rR]
tagForm				[fF][oO][rR][mM]
tagH 				[hH]1|[hH]2|[hH]3|[hH]4|[hH]5|[hH]6
tagHeader			[hH][eE][aA][dD][eE][rR]
tagHgroup			[hH][gG][rR][oO][uU][pP]
tagI				[iI]
tagIframe			[iI][fF][rR][aA][mM][eE]
tagIns				[iI][nN][sS]
tagKbd				[kK][bB][dD]
tagKeygen			[kK][eE][yY][gG][eE][nN]
tagLabel			[lL][aA][bB][eE][lL]
tagLegend 			[lL][eE][gG][eE][nN]
tagLi				[lL][iI]
tagMap				[mM][aA][pP]
tagMain				[mM][aA][iI][nN]
tagMark				[mM][aA][rR][kK]
tagMenu				[mM][eE][nN][uU]
tagMeter			[mM][eE][tT][eE][rR]
tagNav				[nN][aA][vV]
tagObject 			[oO][bB][jJ][eE][cC][tT]
tagOl 				[oO][lL]
tagOptgroup			[oO][pP][tT][gG][rR][oO][uU][pP]
tagOption			[oO][pP][tT][iI][oO][nN]
tagOutput			[oO][uU][tT][pP][uU][tT]
tagP				[pP]
tagPicture			[pP][iI][cC][tT][uU][rR][eE]
tagPre				[pP][rR][eE]
tagProgress			[pP][rR][oO][gG][rR][eE][sS][sS]
tagQ				[qQ]
tagRp				[rR][pP]
tagRt				[rR][tT]
tagRuby 			[rR][uU][bB][yY]
tagSamp				[sS][aA][mM][pP]
tagSection			[sS][eE][cC][tT][iI][oO][nN]
tagSelect			[sS][eE][lL][eE][cC][tT]
tagSmall 			[sS][mM][aA][lL][lL]
tagSpan				[sS][pP][aA][nN]
tagStrong 			[sS][tT][rR][oO][nN][gG]
tagSub				[sS][uU][bB]
tagSup 				[sS][uU][pP]
tagSummary			[sS][uU][mM][mM][aA][rR][yY]
tagSvg				[sS][vV][gG]
tagTable			[tT][aA][bB][lL][eE]
tagTbody			[tT][bB][oO][dD][yY]
tagTd				[tT][dD]
tagTemplate			[tT][eE][mM][pP][lL][aA][tT][eE]
tagTextarea			[tT][eE][xX][tT][aA][rR][eE][aA]
tagTfoot			[tT][fF][oO][oO][tT]
tagTh				[tT][hH]
tagThead			[tT][hH][eE][aA][dD]
tagTime				[tT][iI][mM][eE]
tagTr				[tT][rR]
tagTrack			[tT][rR][aA][cC][kK]
tagUl				[uU][lL]
tagVar				[vV][aA][rR]
tagVideo			[vV][iI][dD][eE][oO]
tagWbr				[wW][bB][rR]

tagsAll				{tagA}|{tagAbbr}|{tagAddress}|{tagArticle}|{tagAside}|{tagAudio}|{tagB}|{tagBdi}|{tagBdo}|{tagBlockquote}|{tagButton}|{tagCanvas}|{tagCaption}|{tagCite}|{tagCode}|{tagColgroup}|{tagData}|{tagDatalist}|{tagDd}|{tagDt}|{tagDl}|{tagDel}|{tagDetails}|{tagDfn}|{tagDialog}|{tagDiv}|{tagEm}|{tagEmbed}|{tagFieldset}|{tagFigure}|{tagFigcaption}|{tagFooter}|{tagForm}|{tagH}|{tagHeader}|{tagHgroup}|{tagI}|{tagIframe}|{tagIns}|{tagKbd}|{tagKeygen}|{tagLabel}|{tagLegend}|{tagLi}|{tagMap}|{tagMark}|{tagMain}|{tagMenu}|{tagMeter}|{tagNav}|{tagObject}|{tagOl}|{tagOptgroup}|{tagOption}|{tagOutput}|{tagP}|{tagPicture}|{tagPre}|{tagProgress}|{tagQ}|{tagRp}|{tagRt}|{tagRuby}|{tagSamp}|{tagSection}|{tagSelect}|{tagSmall}|{tagSpan}|{tagStrong}|{tagSub}|{tagSup}|{tagSummary}|{tagSvg}|{tagTable}|{tagTbody}|{tagTd}|{tagTemplate}|{tagTextarea}|{tagTfoot}|{tagTh}|{tagThead}|{tagTime}|{tagTr}|{tagTrack}|{tagUl}|{tagVar}|{tagVideo}|{tagWbr}

generalTags			[nN][oO][sS][cC][rR][iI][pP][tT]

styleTag			[sS][tT][yY][lL][eE]
scriptTag			[sS][cC][rR][iI][pP][tT]

headTagsVoid		[mM][eE][tT][aA]|[bB][aA][sS][eE]|[lL][iI][nN][kK]

voidTags			[bB][rR]|[hH][rR]|[iI][nN][pP][uU][tT]|[aA][rR][eE][aA]|[cC][oO][lL]|[iI][mM][gG]|[pP][aA][rR][aA][mM]|[cC][oO][mM][mM][aA][nN][dD]|[sS][oO][uU][rR][cC][eE]
oldVersionTags		[aA][cC][rR][oO][nN][yY][mM]|[aA][pP][pP][lL][eE][tT]|[bB][aA][sS][eE][fF][oO][nN][tT]|[bB][iI][gG]|[cC][eE][nN][tT][eE][rR]|[dD][iI][rR]|[fF][oO][nN][tT]|[fF][rR][aA][mM][eE]|[fF][rR][aA][mM][eE][sS][eE][tT]|[nN][oO][fF][rR][aA][mM][eE][sS]|[sS][tT][rR][iI][kK][eE]|[tT][tT]|[kK][eE][yY][gG][eE][nN]

attributes1			[aA][cC][cC][eE][pP][tT]|[aA][cC][cC][eE][pP][tT][-][cC][hH][aA][rR][sS][eE][tT]|[aA][cC][cC][eE][sS][sS][kK][eE][yY]|[aA][cC][tT][iI][oO][nN]|[aA][lL][tT]|[aA][sS][yY][nN][cC]|[aA][uU][tT][oO][cC][oO][mM][pP][lL][eE][tT][eE]|[aA][uU][tT][oO][fF][oO][cC][uU][sS]|[aA][uU][tT][oO][pP][lL][aA][yY]|[cC][hH][aA][rR][sS][eE][tT]|[cC][hH][eE][cC][kK][eE][dD]|[cC][iI][tT][eE]|[cC][lL][aA][sS][sS]|[cC][oO][lL][sS]|[cC][oO][lL][sS][pP][aA][nN]|[cC][oO][nN][tT][eE][nN][tT]
attributes2			[cC][oO][nN][tT][eE][nN][tT][eE][dD][iI][tT][aA][bB][lL][eE]|[cC][oO][nN][tT][rR][oO][lL][sS]|[cC][oO][oO][rR][dD][sS]|[dD][aA][tT][aA]|[dD][aA][tT][eE][tT][iI][mM][eE]|[dD][eE][fF][aA][uU][lL][tT]|[dD][eE][fF][eE][rR]|[dD][iI][rR]|[dD][iI][rR][nN][aA][mM][eE]|[dD][iI][sS][aA][bB][lL][eE][dD]|[dD][oO][wW][nN][lL][oO][aA][dD]|[dD][rR][aA][gG][gG][aA][bB][lL][eE]|[eE][nN][cC][tT][yY][pP][eE]|[fF][oO][rR]|[fF][oO][rR][mM]|[fF][oO][rR][mM][aA][cC][tT][iI][oO][nN]|[hH][eE][aA][dD][eE][rR][sS]
attributes3			[hH][eE][iI][gG][hH][tT]|[hH][iI][dD][dD][eE][nN]|[hH][iI][gG][hH]|[hH][rR][eE][fF]|[hH][rR][eE][fF][lL][aA][nN][gG]|[hH][tT][tT][pP][-][eE][qQ][uU][iI][vV]|[iI][dD]|[iI][sS][mM][aA][pP]|[kK][iI][nN][dD]|[lL][aA][bB][eE][lL]|[lL][aA][nN][gG]|[lL][iI][sS][tT]|[lL][oO][oO][pP]|[lL][oO][wW]|[mM][aA][xX]|[mM][aA][xX][lL][eE][nN][gG][tT][hH]|[mM][eE][dD][iI][aA]|[mM][eE][tT][hH][oO][dD]|[mM][iI][nN]|[mM][uU][lL][tT][iI][pP][lL][eE]|[mM][uU][tT][eE][dD]|[nN][aA][mM][eE]|[nN][oO][vV][aA][lL][iI][dD][aA][tT][eE]
attributes4			[rR][eE][aA][dD][oO][nN][lL][yY]|[rR][eE][lL]|[rR][eE][qQ][uU][iI][rR][eE][dD]|[rR][eE][vV][eE][rR][sS][eE][dD]|[rR][oO][wW][sS]|[rR][oO][wW][sS][pP][aA][nN]|[sS][aA][nN][dD][bB][oO][xX]|[sS][cC][oO][pP][eE]|[sS][eE][lL][eE][cC][tT][eE][dD]|[sS][hH][aA][pP][eE]|[sS][iI][zZ][eE]|[sS][iI][zZ][eE][sS]|[sS][pP][aA][nN]|[sS][pP][eE][lL][lL][cC][hH][eE][cC][kK]|[sS][rR][cC]|[sS][rR][cC][dD][oO][cC]|[sS][rR][cC][lL][aA][nN][gG]|[sS][rR][cC][sS][eE][tT]|[sS][tT][aA][rR][tT]|[sS][tT][eE][pP]
attributes5			[tT][aA][bB][iI][nN][dD][eE][xX]|[tT][iI][tT][lL][eE]|[tT][aA][rR][gG][eE][tT]|[tT][rR][aA][nN][sS][lL][aA][tT][eE]|[tT][yY][pP][eE]|[uU][sS][eE][mM][aA][pP]|[vV][aA][lL][uU][eE]|[wW][iI][dD][tT][hH]|[wW][rR][aA][pP]|[pP][rR][oO][pP][eE][rR][tT][yY]|[sS][tT][yY][lL][eE]|[rR][oO][lL][eE]

events1				[oO][nN][aA][bB][oO][rR][tT]|[oO][nN][aA][fF][tT][eE][rR][pP][rR][iI][nN][tT]|[oO][nN][bB][eE][fF][oO][rR][eE][pP][rR][iI][nN][tT]|[oO][nN][bB][eE][fF][oO][rR][eE][uU][nN][lL][oO][aA][dD]|[oO][nN][bB][lL][uU][rR]|[oO][nN][cC][aA][nN][pP][lL][aA][yY]|[oO][nN][cC][aA][nN][pP][lL][aA][yY][tT][hH][rR][oO][uU][gG][hH]|[oO][nN][cC][hH][aA][nN][gG][eE]|[oO][nN][cC][lL][iI][cC][kK]|[oO][nN][cC][oO][nN][tT][eE][xX][tT][mM][eE][nN][uU]|[oO][nN][cC][oO][pP][yY]
events2				[oO][nN][cC][uU][eE][cC][hH][aA][nN][gG][eE]|[oO][nN][cC][uU][tT]|[oO][nN][dD][bB][lL][cC][lL][iI][cC][kK]|[oO][nN][dD][rR][aA][gG]|[oO][nN][dD][rR][aA][gG][eE][nN][dD]|[oO][nN][dD][rR][aA][gG][eE][nN][tT][eE][rR]|[oO][nN][dD][rR][aA][gG][lL][eE][aA][vV][eE]|[oO][nN][dD][rR][aA][gG][oO][vV][eE][rR]|[oO][nN][dD][rR][aA][gG][sS][tT][aA][rR][tT]|[oO][nN][dD][rR][oO][pP]|[oO][nN][dD][uU][rR][aA][tT][iI][oO][nN][cC][hH][aA][nN][gG][eE]|[oO][nN][eE][mM][pP][tT][iI][eE][dD]|[oO][nN][eE][nN][dD][eE][dD]
events3				[oO][nN][eE][rR][rR][oO][rR]|[oO][nN][fF][oO][cC][uU][sS]|[oO][nN][hH][aA][sS][hH][cC][hH][aA][nN][gG][eE]|[oO][nN][iI][nN][pP][uU][tT]|[oO][nN][iI][nN][vV][aA][lL][iI][dD]|[oO][nN][kK][eE][yY][dD][oO][wW][nN]|[oO][nN][kK][eE][yY][pP][rR][eE][sS][sS]|[oO][nN][kK][eE][yY][uU][pP]|[oO][nN][lL][oO][aA][dD]|[oO][nN][lL][oO][aA][dD][eE][dD][dD][aA][tT][aA]|[oO][nN][lL][oO][aA][dD][eE][dD][mM][eE][tT][aA][dD][aA][tT][aA]|[oO][nN][lL][oO][aA][dD][sS][tT][aA][rR][tT]
events4				[oO][nN][mM][oO][uU][sS][eE][dD][oO][wW][nN]|[oO][nN][mM][oO][uU][sS][eE][mM][oO][vV][eE]|[oO][nN][mM][oO][uU][sS][eE][oO][uU][tT]|[oO][nN][mM][oO][uU][sS][eE][oO][vV][eE][rR]|[oO][nN][mM][oO][uU][sS][eE][uU][pP]|[oO][nN][mM][oO][uU][sS][eE][wW][hH][eE][eE][lL]|[oO][nN][oO][fF][fF][lL][iI][nN][eE]|[oO][nN][oO][nN][lL][iI][nN][eE]|[oO][nN][pP][aA][gG][eE][hH][iI][dD][eE]|[oO][nN][pP][aA][gG][eE][sS][hH][oO][wW]|[oO][nN][pP][aA][sS][tT][eE]|[oO][nN][pP][aA][uU][sS][eE]
events5				[oO][nN][pP][lL][aA][yY]|[oO][nN][pP][lL][aA][yY][iI][nN][gG]|[oO][nN][pP][oO][pP][sS][tT][aA][tT][eE]|[oO][nN][pP][rR][oO][gG][rR][eE][sS][sS]|[oO][nN][rR][aA][tT][eE][cC][hH][aA][nN][gG][eE]|[oO][nN][rR][eE][sS][eE][tT]|[oO][nN][rR][eE][sS][iI][zZ][eE]|[oO][nN][sS][cC][rR][oO][lL][lL]|[oO][nN][sS][eE][aA][rR][cC][hH]|[oO][nN][sS][eE][eE][kK][eE][dD]|[oO][nN][sS][eE][eE][kK][iI][nN][gG]|[oO][nN][sS][eE][lL][eE][cC][tT]|[oO][nN][sS][tT][aA][lL][lL][eE][dD]|[oO][nN][sS][tT][oO][rR][aA][gG][eE]
events6				[oO][nN][sS][uU][bB][mM][iI][tT]|[oO][nN][sS][uU][sS][pP][eE][nN][dD]|[oO][nN][tT][iI][mM][eE][uU][pP][dD][aA][tT][eE]|[oO][nN][tT][oO][gG][gG][lL][eE]|[oO][nN][uU][nN][lL][oO][aA][dD]|[oO][nN][vV][oO][lL][uU][mM][eE][cC][hH][aA][nN][gG][eE]|[oO][nN][wW][aA][iI][tT][iI][nN][gG]|[oO][nN][wW][hH][eE][eE][lL]|[oO][pP][eE][nN]|[oO][pP][tT][iI][mM][uU][mM]|[pP][aA][tT][tT][eE][rR][nN]|[pP][lL][aA][cC][eE][hH][oO][lL][dD][eE][rR]|[pP][oO][sS][tT][eE][rR]|[pP][rR][eE][lL][oO][aA][dD]

attributesALL       {attributes1}|{attributes2}|{attributes3}|{attributes4}|{attributes5}|{events1}|{events2}|{events3}|{events4}|{events5}|{events6}
oldVersionAttr		[aA][lL][iI][gG][nN]|[bB][gG][cC][oO][lL][oO][rR]|[bB][oO][rR][dD][eE][rR]|[cC][oO][lL][oO][rR]
attrWithoutValue	[iI][tT][eE][mM][sS][cC][oO][pP][eE]|[aA][sS][yY][nN][cC]|[dD][eE][fF][eE][rR]
attributesValue     \"[^<"]*\")|("'"[^<']*"'"
			  
commentTagStart		"\<\!\-\-"
commentTagEnd		"\-\-\>"
cdataTag			"\<!\[CDATA"
xmlTAG				"<\?"[xX][mM][lL]			
tagDOCTYPEold		\![dD][oO][cC][tT][yY][pP][eE][ ]+[hH][tT][mM][lL][ ]+[pP][uU][bB][lL][iI][cC]
			
%%
\<{tagDOCTYPE}\> {
	return TAG_DOCKTYPE;
}

\<{tagDOCTYPEold} {
	HandlerWarning("Old version of the docktype for HTML5");
	return TAG_DOCKTYPE;
}

{xmlTAG} {
	printf("ERROR: XML declaration %d.\n", line);
	exit(-1);
}

{cdataTag} {
	printf("ERROR: CDATA declaration (XML), %d.\n", line);
	exit(-1);	
}

\<{tagHTML} {
	BEGIN(attr_exp);
	return TAG_HTML;
}

\<{tagHEAD} {
	BEGIN(attr_exp);
	return TAG_HEAD;
}

\<{tagBODY} {
	BEGIN(attr_exp);
	return TAG_BODY;
}

\<{tagTITLE} {
	BEGIN(title_attr_exp);
	return TAG_TITLE;
}

\<{tagsAll} {
	tagStackPush(yytext);
	BEGIN(attr_exp);
	return COMMON_TAG;
}

\<\/{tagHTML}{whitespace}*\> {
	return TAG_HTML_CLOSE;
}

\<\/{tagHEAD}{whitespace}*\> {
	return TAG_HEAD_CLOSE;
}

\<\/{tagBODY}{whitespace}*\> {
	return TAG_BODY_CLOSE;
}

\<\/{tagTITLE}{whitespace}*\> {
	return TAG_TITLE_CLOSE;
}

\<{generalTags} {
	BEGIN(attr_exp);
	return GENERAL_TAG;
}

\<\/{generalTags}{whitespace}*\> {
	return GENERAL_TAG_CLOSE;
}

\<{oldVersionTags} {
	HandlerWarning("Old version of the tag for HTML5");
	tagStackPush(yytext);
	BEGIN(attr_exp);
	return COMMON_TAG;
}
			 
\<{voidTags} {
	BEGIN(attr_exp);
	return COMMON_VOID_TAG;
}

\<{headTagsVoid} {
    BEGIN(attr_exp);
	return HEAD_SECTION_VOID_TAG;
}

\<{styleTag} {
	BEGIN(style_attr_exp);
	return TAG_STYLE;
}

\<{scriptTag} {
	BEGIN(script_attr_exp);
	return TAG_SCRIPT;
}
			 
\<\/{tagsAll}{whitespace}*\> {
	tagStackCheck(yytext);
	return COMMON_TAG_CLOSE;
}
			 
\<\/{voidTags}{whitespace}*\> {
	HandlerWarning("Non-HTML5 construction");
}
			 
\<{name} { 
	HandlerWarning("Unknown tag");
}
			 
\<\/{name}{whitespace}*\> { 
	HandlerWarning("Unknown end tag");
}


<attr_exp>{
	{attributesALL}{whitespace}*[=] {
		return ATTRIBUTE; 
	}
	
	{oldVersionAttr}{whitespace}*[=] {
		HandlerWarning("Old version of the attribute for HTML5");
		return ATTRIBUTE; 
	}
	
	{name}{whitespace}*[=] { 
		HandlerWarning("Unknown attribute");
		flag_warning=0;
		return ATTRIBUTE;
	}
			 
	{whitespace}*{attributesValue} {
		return VALUE;
	}
	
	[\n] {
		line++;
	}

	\/\> {
		HandlerWarning("Non-HTML5 construction - selfclosing void tag");
		BEGIN(0);
		return CLOSING_MORE_SIGN;
	}

	[>] {
		BEGIN(0);
		return CLOSING_MORE_SIGN;
	}
			
	{whitespace} ;

	{attrWithoutValue}{whitespace}* ;

	. ;
}

<title_attr_exp>{
	{attributesALL}{whitespace}*[=] {
		return ATTRIBUTE; 
	}
	
	{oldVersionAttr}{whitespace}*[=] { 
		HandlerWarning("Old version of the attribute for HTML5");
		return ATTRIBUTE; 
	}
	
	{name}{whitespace}*[=] { 
		HandlerWarning("Unknown attribute");
		return ATTRIBUTE;
	}
			 
	{whitespace}*{attributesValue} {
		return VALUE;
	}
	
	[>] {
		BEGIN(title_text_exp);
		return CLOSING_MORE_SIGN;
	}

	[\n] {
		line++;
	}

	{whitespace} ;
}

<title_text_exp>{
	\<\/{tagTITLE}{whitespace}*\> {
		return TAG_TITLE_CLOSE;
	}

	[^ \t\r\n] {
		BEGIN(0);
		return TITLE_TEXT;
	}

	. ;
}

<style_attr_exp>{
	{attributesALL}{whitespace}*[=] {
		return ATTRIBUTE; 
	}
	
	{oldVersionAttr}{whitespace}*[=] { 
		HandlerWarning("Old version of the attribute for HTML5");
		return ATTRIBUTE; 
	}
	
	{name}{whitespace}*[=] { 
		HandlerWarning("Unknown attribute");
		return ATTRIBUTE;
	}
			 
	{whitespace}*{attributesValue} {
		return VALUE;
	}
	
	[>] {
		BEGIN(style_section);
		return CLOSING_MORE_SIGN;
	}

	[\n] {
		line++;
	}

    {whitespace} ;
}

<style_section>{
	\<\/{styleTag}{whitespace}*\> {
		BEGIN(0);
		return TAG_STYLE_CLOSE;
	}

	[\n] {
		line++;
	}

	. ;
}

<script_attr_exp>{
	{attributesALL}{whitespace}*[=] {
		return ATTRIBUTE; 
	}
	{oldVersionAttr}{whitespace}*[=] { 
		HandlerWarning("Old version of the attribute for HTML5");
		return ATTRIBUTE; 
	}
	{name}{whitespace}*[=] {
		HandlerWarning("Unknown attribute");
		return ATTRIBUTE;
	}
	{whitespace}*{attributesValue} {
		return VALUE;
	}
	[>] {
		BEGIN(script_section);
		return CLOSING_MORE_SIGN;
	}

	[\n] {
		line++;
	}
			
	{whitespace} ;

	{attrWithoutValue}{whitespace}* ;
}

<script_section>{
	\<\/{scriptTag}{whitespace}*\> {
		BEGIN(0);
		return TAG_SCRIPT_CLOSE;
	}

	[\n] {
		line++;
	}

	. ;
}

{commentTagStart} {
	BEGIN(comment_continue);
	return TAG_COMMENT_START;
}

<comment_continue>{
	{commentTagEnd} {
		BEGIN(0);
		return TAG_COMMENT_END;
	}

	[\n] {
		line++;
	}

	. ;
}

{str} 			;

[\n] 			{line++;}
[\r]			; 

. 				;

%% 
void HandlerWarning(const char* msg){
	printf("WARNING: %s\n, line: %d\n", msg, line);
	flag_warning=0;
}
int yywrap(){}

void yyerror(char *msg){
    fprintf(stderr,"ERROR: %s\n", msg);
}
int main(int argc, char*argv[]){
	errno=0;
    
	if (argc < 2){
		printf("ERROR: Incorrect number of command arguments\n");
		exit(-1);
	}
    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
		printf("ERROR: The text file was not found\n");
		exit(-1);
	} 
	tagStackInit();
	yyparse();
	tagStackDeinit();
	fclose(yyin);
	if(flag_warning) printf("Program is correct.\n");
    return 0;
}
