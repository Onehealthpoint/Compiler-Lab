%{
#include <stdio.h>
%}

%%

[aAeEiIoOuU]    printf("%s is a vowel\n", yytext);
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z] printf("%s is a consonant\n", yytext);
[^a-zA-Z]        printf("%s is not a valid letter\n", yytext);

%%

int main() {
    printf("Enter a character: ");
    yylex();  // Start the lexical analysis
    return 0;
}

int yywrap() {
    return 1;  // End of input
}
