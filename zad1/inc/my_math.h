#ifndef MY_MATH_H
#define MY_MATH_H

#include <inttypes.h>

enum EMyMathError{
    DiophanticSolutionNotFound = 1,
    DiophanticSolutionAny,
    DiophanticSolutionNone
};

typedef struct MyMathDiophantineResult {
    uint_fast64_t x;
    uint_fast64_t y;
} MyMathDiophantineResult;

uint_fast64_t my_math_factorial(uint_fast64_t number);
uint_fast64_t my_math_gcd(uint_fast64_t a, uint_fast64_t b);
MyMathDiophantineResult my_math_solve_diophantine_equation(int_fast64_t a, int_fast64_t b, int_fast64_t c);

#endif /* MY_MATH_H */