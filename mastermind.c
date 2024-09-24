#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void run_game() {
    int masterCode[4];
    srand(time(0));
    char userCode[4];
    
    for (int i = 0; i <4; i++) {
        //int randomNumber = (rand() % 8) + 1;
        // masterCode[i] = randomNumber;
        masterCode[i] = i;
    }

    printf("The code has been generated\n");

    // int arraySize = sizeof(masterCode)/sizeof(masterCode[0]);

    printf("Enter your code: ");
    scanf("%s", &userCode);

    for (int i = 0; userCode[i] != '\0'; i++) {
        char userDigit = userCode[i];
        if (userDigit == masterCode[i]) {
            printf("%c looks right, but is it?\n", userDigit);
        } else {
            printf("%c is not right\n", userDigit);
        }
    }

}

int main() {
    run_game();
    return 0;
}
