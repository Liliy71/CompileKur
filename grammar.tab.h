/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     CLOSING_MORE_SIGN = 258,
     TAG_DOCKTYPE = 259,
     TAG_COMMENT_START = 260,
     TAG_COMMENT_END = 261,
     TAG_HTML = 262,
     TAG_HTML_CLOSE = 263,
     TAG_HEAD = 264,
     TAG_HEAD_CLOSE = 265,
     GENERAL_TAG = 266,
     GENERAL_TAG_CLOSE = 267,
     HEAD_SECTION_VOID_TAG = 268,
     TAG_BODY = 269,
     TAG_BODY_CLOSE = 270,
     COMMON_TAG = 271,
     COMMON_TAG_CLOSE = 272,
     COMMON_VOID_TAG = 273,
     TAG_TITLE = 274,
     TAG_TITLE_CLOSE = 275,
     TITLE_TEXT = 276,
     TAG_STYLE = 277,
     TAG_STYLE_CLOSE = 278,
     TAG_SCRIPT = 279,
     TAG_SCRIPT_CLOSE = 280,
     ATTRIBUTE = 281,
     VALUE = 282
   };
#endif
/* Tokens.  */
#define CLOSING_MORE_SIGN 258
#define TAG_DOCKTYPE 259
#define TAG_COMMENT_START 260
#define TAG_COMMENT_END 261
#define TAG_HTML 262
#define TAG_HTML_CLOSE 263
#define TAG_HEAD 264
#define TAG_HEAD_CLOSE 265
#define GENERAL_TAG 266
#define GENERAL_TAG_CLOSE 267
#define HEAD_SECTION_VOID_TAG 268
#define TAG_BODY 269
#define TAG_BODY_CLOSE 270
#define COMMON_TAG 271
#define COMMON_TAG_CLOSE 272
#define COMMON_VOID_TAG 273
#define TAG_TITLE 274
#define TAG_TITLE_CLOSE 275
#define TITLE_TEXT 276
#define TAG_STYLE 277
#define TAG_STYLE_CLOSE 278
#define TAG_SCRIPT 279
#define TAG_SCRIPT_CLOSE 280
#define ATTRIBUTE 281
#define VALUE 282




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

