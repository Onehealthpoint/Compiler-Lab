%{
#include <stdio.h>
int wordCount = 0;
%}

%%
[a-zA-Z]+ { wordCount++; }
[ \t\n] {}
. {}
%%

int main() {
    printf("Enter your text: ");
    yylex();
    printf("\nWords Detected: %d\n",wordCount);
    return 0;
}

int yywrap() {
    return 1;
}
