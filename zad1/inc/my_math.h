#ifndef MY_MATH_H
#define MY_MATH_H

#include <inttypes.h>

enum EMyMathError{
    DiophanticSolutionNotFound = 1,
    DiophanticSolutionAny,
    DiophanticSolutionNone
};

typedef struct MyMathDiophantineResult {
    int64_t x;
    int64_t y;
    int64_t gcd;
} MyMathDiophantineResult;

uint_fast64_t my_math_factorial(uint64_t number);
uint_fast64_t my_math_gcd(uint64_t a, uint64_t b);
MyMathDiophantineResult my_math_solve_diophantine_equation(int64_t a, int64_t b, int64_t c);

#endif /* MY_MATH_H */