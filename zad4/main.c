#include <stdio.h>
#include "my_math.h"

int main(void) {
    unsigned factorial_number = 5;
    unsigned gcd_number_1 = 32;
    unsigned gcd_number_2 = 48;
    int dioph_number_1 = 48;
    int dioph_number_2 = 32;
    int dioph_number_3 = -64;

    int fact = my_math_factorial(factorial_number);
    int gcd = my_math_gcd(gcd_number_1, gcd_number_2);

    printf("%" "u" "! == " "%" "u" "\n", factorial_number, fact);
    printf("GCD of " "%" "u" " and " "%" "u" " is " "%" "u" "\n", gcd_number_1, gcd_number_2, gcd);

    MyMathDiophantineResult result = my_math_solve_diophantine_equation(dioph_number_1, dioph_number_2, dioph_number_3);
    printf("%" "d" " * x + (" "%" "d" ") * y == " "%" "d" , dioph_number_1, dioph_number_2, dioph_number_3);
    if (result.err == NOT_FOUND) {
        puts(" has no integral solutions");
        return 0;
    }
    if (result.err == ANY) {
        puts(" is solved by any pair of integers");
        return 0;
    }

    printf(" has solutions: x = %" "d" " + k * %" "d" " and y = %" "d" " - k * %" "d"
            " where k is any integer\n", result.x, dioph_number_2 / result.gcd, result.y, dioph_number_1 / result.gcd);

    return 0;
}
