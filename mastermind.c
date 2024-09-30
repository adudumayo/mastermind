#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

void run_game() {
    static int masterCode[4];
    char playerCode[4];
    int playerDigits[4];
    int placed = 0;
    int unplaced = 0;
    srand(time(0));

    // insert the first random master digit
    masterCode[0] = (rand() % 8) + 1;
    
    int idx = 1;

    while (true) {
        bool duplicateFound = false;
        int randomNumber = (rand() % 8) + 1;

        for (int j = 0; j < idx; j++) {
            if (randomNumber == masterCode[j]) {
                duplicateFound = true;
                break;
            }
        }

        if (duplicateFound) {
            continue;
        }

        masterCode[idx] = randomNumber;
        idx++;
        
        if (idx == 4) {
            break;
        }
    }
    
    printf("The code is ");
    for (int i = 0; i < 4; i++) {
        printf("%d", masterCode[i]);
    }

    printf("\n");

    int lives = 12;

    while (1) {
        printf("You have %d lives left\n", lives);

        printf("Enter your code: ");
        scanf("%4s", &playerCode);

        for (int i = 0; i < 4; i++) {
            playerDigits[i] = playerCode[i] - '0';
            if (playerDigits[i] == masterCode[i]) {
                placed++;
            } else {
                for (int j = 0; j < 4; j++) {
                    if (playerDigits[i] == masterCode[j]) {
                        unplaced++;
                    }
                }
            }
        }

        printf("Correctly placed: %d\n", placed);
        printf("Incorrectly placed: %d\n", unplaced);

        if (lives == 0) {
            printf("Game over!!\n");
            break;
        } else if (placed == 4) {
            printf("You Won!!\n");
            break;
        }

        unplaced = 0;
        placed = 0;
        lives--;
    }
}

int main() {
    run_game();
    return 0;
}
