#include <stdio.h>
#include <inttypes.h>
#include <errno.h>
#include <my_math.h>


int main(void) {
    uint64_t factorial_number = 5;
    uint64_t gcd_number_1 = 32;
    uint64_t gcd_number_2 = 48;
    int64_t dioph_number_1 = 48;
    int64_t dioph_number_2 = 32;
    int64_t dioph_number_3 = -64;

    uint64_t fact = my_math_factorial(factorial_number);
    uint64_t gcd = my_math_gcd(gcd_number_1, gcd_number_2);

    printf("%" PRIu64 "! == " "%" PRIu64 "\n", factorial_number, fact);
    printf("GCD of " "%" PRIu64 " and " "%" PRIu64 " is " "%" PRIu64 "\n", gcd_number_1, gcd_number_2, gcd);

    MyMathDiophantineResult result = my_math_solve_diophantine_equation(dioph_number_1, dioph_number_2, dioph_number_3);
    printf("%" PRId64 " * x + (" "%" PRId64 ") * y == " "%" PRId64 , dioph_number_1, dioph_number_2, dioph_number_3);
    if (errno == DiophanticSolutionNotFound) {
        errno = 0;
        puts(" has no integral solutions");
        return 0;
    }
    if (errno == DiophanticSolutionAny) {
        errno = 0;
        puts(" is solved by any pair of integers");
        return 0;
    }

    printf(" has solutions: x = %" PRId64 " + k * %" PRId64 " and y = %" PRId64 " - k * %" PRId64
            " where k is any integer\n", result.x, dioph_number_2 / result.gcd, result.y, dioph_number_1 / result.gcd);

    return 0;
}
