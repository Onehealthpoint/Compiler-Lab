%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>

#define MAX_KEYWORDS 10

// List of keywords
char *keywords[] = {"int", "float", "if", "else", "while", "for", "return", "void", "char", "double"};

int isKeyword(const char *str) {
    for (int i = 0; i < MAX_KEYWORDS; i++) {
        if (strcmp(str, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {
    if (isKeyword(yytext)) {
        printf("Keyword: %s\n", yytext);
    } else {
        printf("Identifier: %s\n", yytext);
    }
}
[0-9]+(\.[0-9]+)? {
    printf("Number: %s\n", yytext);
}
[+\-*/=<>&|!] {
    printf("Operator: %s\n", yytext);
}
[ \t\n]+ ; // Ignore whitespaces
. {
    printf("Unknown character: %s\n", yytext);
}
%%

int main(int argc, char *argv[]) {
    printf("Enter the input: ");
    yylex(); // Start scanning input
    return 0;
}

int yywrap() {
    return 1; // Indicates the end of input
}
