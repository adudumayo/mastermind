#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void run_game() {
    int masterCode[4];
    char playerCode[4];
    int playerDigits[4];
    srand(time(0));
    
    for (int i = 0; i <4; i++) {
        //int randomNumber = (rand() % 8) + 1;
        // masterCode[i] = randomNumber;
        masterCode[i] = i;
    }

    printf("The code has been generated\n");

    printf("Enter your code: ");
    scanf("%4s", &playerCode);

    for (int i = 0; i < 4; i++) {
        playerDigits[i] = playerCode[i] - '0';
        if (playerDigits[i] == masterCode[i]) {
            printf("Correct\n");
        } else {
            printf("Incorrect\n");
        }
    }
    
}

int main() {
    run_game();
    return 0;
}
