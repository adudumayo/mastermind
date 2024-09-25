#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void run_game() {
    static int masterCode[4];
    char playerCode[4];
    int playerDigits[4];
    int correctDigits = 0;
    int incorrectDigits = 0;
    srand(time(0));
    
    for (int i = 0; i <4; i++) {
        int randomNumber = (rand() % 8) + 1;
        masterCode[i] = randomNumber;
    }

    printf("The code is ");
    for (int i = 0; i < 4; i++) {
        printf("%d", masterCode[i]);
    }

    printf("\n");

    printf("Enter your code: ");
    scanf("%4s", &playerCode);

    for (int i = 0; i < 4; i++) {
        playerDigits[i] = playerCode[i] - '0';
        printf("Comparing %d to %d\n", playerDigits[i], masterCode[i]);
        if (playerDigits[i] == masterCode[i]) {
            printf("Correct\n");
            correctDigits++;
        } else {
            printf("Incorrect\n");
            incorrectDigits++;
        }
    }

    printf("Number of correct digits is %d\n", correctDigits);
    printf("Number of incorrect digits is %d\n", incorrectDigits);
    
}

int main() {
    run_game();
    return 0;
}
