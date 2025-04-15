%{
#include <stdio.h>

int vowels = 0;		// Counter for vowels
int consonants = 0;   	// Counter for consonants
%}

%%

[aAeEiIoOuU]	{ vowels++; }     	// Count vowels
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]	{ consonants++; } 	// Count consonants
.	// Ignore other characters

%%

int main() {
    printf("Enter a string: ");
    yylex();	// Call lexical analyzer

    // Print the counts
    printf("\nNumber of vowels: %d\n", vowels);
    printf("Number of consonants: %d\n", consonants);

    return 0;
}

int yywrap() {
    return 1; 	// End of input
}
