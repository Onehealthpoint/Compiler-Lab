%{
#include <stdio.h>
#include <stdlib.h>

%}

%%

[0-9]+ {
    int num = atoi(yytext); 
    if (num % 2 == 0)
        printf("%d is even\n", num);
    else
        printf("%d is odd\n", num);
}

[ \t\n]+

. {
    printf("Invalid input: %s\n", yytext);
}

%%

int main() {
    printf("Enter a number: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
