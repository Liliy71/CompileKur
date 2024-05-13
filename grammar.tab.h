/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_GRAMMAR_TAB_H_INCLUDED
# define YY_YY_GRAMMAR_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    CLOSING_MORE_SIGN = 258,       /* CLOSING_MORE_SIGN  */
    TAG_DOCKTYPE = 259,            /* TAG_DOCKTYPE  */
    TAG_COMMENT_START = 260,       /* TAG_COMMENT_START  */
    TAG_COMMENT_END = 261,         /* TAG_COMMENT_END  */
    TAG_HTML = 262,                /* TAG_HTML  */
    TAG_HTML_CLOSE = 263,          /* TAG_HTML_CLOSE  */
    TAG_HEAD = 264,                /* TAG_HEAD  */
    TAG_HEAD_CLOSE = 265,          /* TAG_HEAD_CLOSE  */
    GENERAL_TAG = 266,             /* GENERAL_TAG  */
    GENERAL_TAG_CLOSE = 267,       /* GENERAL_TAG_CLOSE  */
    HEAD_SECTION_VOID_TAG = 268,   /* HEAD_SECTION_VOID_TAG  */
    TAG_BODY = 269,                /* TAG_BODY  */
    TAG_BODY_CLOSE = 270,          /* TAG_BODY_CLOSE  */
    COMMON_TAG = 271,              /* COMMON_TAG  */
    COMMON_TAG_CLOSE = 272,        /* COMMON_TAG_CLOSE  */
    COMMON_VOID_TAG = 273,         /* COMMON_VOID_TAG  */
    TAG_TITLE = 274,               /* TAG_TITLE  */
    TAG_TITLE_CLOSE = 275,         /* TAG_TITLE_CLOSE  */
    TITLE_TEXT = 276,              /* TITLE_TEXT  */
    TAG_STYLE = 277,               /* TAG_STYLE  */
    TAG_STYLE_CLOSE = 278,         /* TAG_STYLE_CLOSE  */
    TAG_SCRIPT = 279,              /* TAG_SCRIPT  */
    TAG_SCRIPT_CLOSE = 280,        /* TAG_SCRIPT_CLOSE  */
    ATTRIBUTE = 281,               /* ATTRIBUTE  */
    VALUE = 282                    /* VALUE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_GRAMMAR_TAB_H_INCLUDED  */
