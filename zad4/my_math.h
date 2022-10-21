#ifndef MY_MATH_H
#define MY_MATH_H

typedef enum EMyMathError{
    VALID = 1,
    NOT_FOUND,
    ANY
} EMyMathError;

typedef struct MyMathDiophantineResult {
    int x;
    int y;
    int gcd;
    EMyMathError err;
} MyMathDiophantineResult;

extern unsigned my_math_factorial(unsigned n);
extern unsigned my_math_gcd(unsigned a, unsigned b);
extern MyMathDiophantineResult my_math_solve_diophantine_equation(int a, int b, int c);

#endif /* MY_MATH_H */