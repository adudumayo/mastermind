#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void run_game() {
    int digits[4];
    srand(time(0));
    
    for (int i = 0; i <4; i++) {
        int randomNumber = (rand() % 8) + 1;
        digits[i] = randomNumber;
    }

    printf("The code has been generated\n");

    char userCode[4];

    printf("Enter your code: ");
    scanf("%s", &userCode);

    for (int i = 0; userCode[i] != '\0'; i++) {
        char digit = userCode[i];
        printf("%lu\n", sizeof(digit));
    }

    if (1 == 1) {
        printf("Yeah buddy!");
    }
}

int main() {
    run_game();
    return 0;
}
