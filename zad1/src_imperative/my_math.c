#include <tgmath.h>
#include <stdbool.h>
#include <my_math.h>
#include <errno.h>

typedef struct MyMathExtendedEuclideanResult {
    uint_fast64_t gcd;
    uint_fast64_t x;
    uint_fast64_t y;
} MyMathExtendedEuclideanResult;

static inline MyMathExtendedEuclideanResult extended_euclidean(int_fast64_t a, int_fast64_t b);

uint64_t my_math_factorial(uint_fast64_t number) {
    uint64_t result = 1;
    while (number > 1) {
        result *= number;
        number--;
    }
}

uint64_t my_math_gcd(uint_fast64_t a, uint_fast64_t b) {
    while (b > 0) {
        uint64_t c = a % b;
        a = b;
        b = c;
    }
    return a;
}

MyMathDiophantineResult my_math_solve_diophantine_equation(int_fast64_t a, int_fast64_t b, int_fast64_t c) {
    if (a == 0 && b == 0) {
        errno = c == 0 ? DiophanticSolutionAny : DiophanticSolutionNone;
        return (MyMathDiophantineResult) {0};
    }
    
    MyMathExtendedEuclideanResult result = extended_euclidean(fabs(a), fabs(b));
    if (c % result.gcd != 0) {
        errno = DiophanticSolutionNotFound;
        return (MyMathDiophantineResult) {0};
    }

    result.x *= c / result.gcd;
    result.y *= c / result.gcd;
    if (a <  0) {result.x = -result.x;}
    if (b < 0) {result.y = -result.y;}

    return (MyMathDiophantineResult) {.x = result.x, .y = result.y};
}

static inline MyMathExtendedEuclideanResult extended_euclidean(int_fast64_t a, int_fast64_t b) {
    int_fast64_t x = 1;
    int_fast64_t y = 0;
    int_fast64_t r = 0;
    int_fast64_t s = 1;

    while (b > 0) {
        int_fast64_t c = a % b;
        int_fast64_t q = a / b;
        a = b;
        b = c;

        int_fast64_t r_prim = r;
        int_fast32_t s_prim = s;
        r = x - q * r;
        s = y - q * s;
        x = r_prim;
        y = s_prim;
    }

    return (MyMathExtendedEuclideanResult) {.gcd = a, .x = x, .y = y};
}