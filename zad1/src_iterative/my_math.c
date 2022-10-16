#include <tgmath.h>
#include <stdbool.h>
#include <my_math.h>
#include <errno.h>
#include <stdio.h>

typedef struct MyMathExtendedEuclideanResult {
    int64_t gcd;
    int64_t x;
    int64_t y;
} MyMathExtendedEuclideanResult;

static inline MyMathExtendedEuclideanResult extended_euclidean(int64_t a, int64_t b);

uint64_t my_math_factorial(uint64_t number) {
    uint64_t result = 1;
    while (number > 1) {
        result *= number;
        number--;
    }
    return result;
}

uint64_t my_math_gcd(uint64_t a, uint64_t b) {
    while (b > 0) {
        uint64_t c = a % b;
        a = b;
        b = c;
    }
    return a;
}

MyMathDiophantineResult my_math_solve_diophantine_equation(int64_t a, int64_t b, int64_t c) {
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
    if (a < 0) {result.x = -result.x;}
    if (b < 0) {result.y = -result.y;}

    return (MyMathDiophantineResult) {.x = result.x, .y = result.y, .gcd = result.gcd};
}

static inline MyMathExtendedEuclideanResult extended_euclidean(int64_t a, int64_t b) {
    int64_t s = 0;
    int64_t old_s = 1;
    int64_t r = b;
    int64_t old_r = a;

    while (r != 0) {
        int64_t q = old_r / r;
        int64_t temp = r;
        r = old_r - q * r;
        old_r = temp;
        temp = s;
        s = old_s - q * r;
        old_s = temp;
    }

    if (b != 0) {return (MyMathExtendedEuclideanResult) {.gcd = old_r, .x = old_s, .y = (old_r - old_s * a) / b};};
    return (MyMathExtendedEuclideanResult) {.gcd = old_r, .x = old_s, .y = 0};
}
