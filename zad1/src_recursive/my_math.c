#include <errno.h>
#include <my_math.h>
#include <tgmath.h>

typedef struct MyMathExtendedEuclideanResult {
    int64_t gcd;
    int64_t x;
    int64_t y;
} MyMathExtendedEuclideanResult;

static inline MyMathExtendedEuclideanResult extended_euclidean(int64_t a, int64_t b, int64_t x, int64_t y, int64_t r, int64_t s);

uint64_t my_math_factorial(register const uint64_t num) {
    if (num < 1) {return 1;}
    return num * my_math_factorial(num - 1);
}

uint64_t my_math_gcd(register const uint64_t a, register const uint64_t b) {
    if (b == 0) {return a;}
    return my_math_gcd(b, a % b);
}

MyMathDiophantineResult my_math_solve_diophantine_equation(int64_t a, int64_t b, int64_t c) {
    if (a == 0 && b == 0) {
        errno = c == 0 ? DiophanticSolutionAny : DiophanticSolutionNone;
        return (MyMathDiophantineResult) {0};
    }
    
    int64_t x = 1;
    int64_t y = 0;
    int64_t r = 0;
    int64_t s = 1;

    MyMathExtendedEuclideanResult result = extended_euclidean(fabs(a), fabs(b), x, y, r, s);
    if (c % result.gcd != 0) {
        errno = DiophanticSolutionNotFound;
        return (MyMathDiophantineResult) {0};
    }

    result.x *= c / result.gcd;
    result.y *= c / result.gcd;
    if (a <  0) {result.x = -result.x;}
    if (b < 0) {result.y = -result.y;}

    return (MyMathDiophantineResult) {.x = result.x, .y = result.y, .gcd = result.gcd};
}

static inline MyMathExtendedEuclideanResult extended_euclidean(int64_t a, int64_t b, int64_t x, int64_t y, int64_t r, int64_t s) {
    
    if (b <= 0) {
        return (MyMathExtendedEuclideanResult) {.gcd = a, .x = x, .y = y};
    }
 
    int64_t c = a % b;
    int64_t q = a / b;
    a = b;
    b = c;

    int64_t r_prim = r;
    int64_t s_prim = s;
    r = x - q * r;
    s = y - q * s;
    x = r_prim;
    y = s_prim;
    
    return extended_euclidean(a, b, x, y, r, s);
}