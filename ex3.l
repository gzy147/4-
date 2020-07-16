%{
#include <stdio.h>
int nif=0; 
%}
%option yylineno
%%
"if"		{nif++;}        
[^"if"] 	{printf("1");}
%%
int main()
{ 
   printf("Press CTRL+d to quit.\nInput any text:\n");
   yylex();             /* 调用词法分析器，直到输入结束  */
   printf("\nnif=%d\n", nif);
   return 0;
}

/* 函数yywrap是LEX提供的一个库函数
 * 若生成可执行程序时没有链接LEX库，则必须手工定义
 * 反之，生成可执行程序时必须如此：
 * cc -o a.out lex.yy.c -ll    # for LEX
 * cc -o a.out lex.yy.c -lfl   # for FLEX
 * 其中-ll表示连接函数库libl.a(in UNIX)
 */
//int yywrap(){ return 1; }
