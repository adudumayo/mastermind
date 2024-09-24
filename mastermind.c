#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void run_game() {
    int masterCode[4];
    char userCode[4];
    int userDigits[4];
    srand(time(0));
    
    for (int i = 0; i <4; i++) {
        //int randomNumber = (rand() % 8) + 1;
        // masterCode[i] = randomNumber;
        masterCode[i] = i;
    }

    printf("The code has been generated\n");

    printf("Enter your code: ");
    scanf("%s", &userCode);

    for (int i = 0; i < 4; i++) {
        userDigits[i] = userCode[i] - '0';
    }

    printf("Checing the conversion\n");

    for (int i = 0; i < 4; i++) {
        printf("The number is %d\n", userDigits[i]);
    }
}

int main() {
    run_game();
    return 0;
}
