using Libdl

lib = dlopen("./libzad1_it.so")

myFactorialPtr = dlsym(lib, "my_math_factorial")
mygcdPointer = dlsym(lib, "my_math_gcd")
myDiophinePointer = dlsym(lib, "my_math_solve_diophantine_equation")

struct myType
    x :: Int64
    y :: Int64
    g :: Int64
end

function myFactorial(n :: UInt64)
    result :: UInt64 = 0
    result = ccall(myFactorialPtr, UInt64, (UInt64,), n)
    return result
end

mygcd(a ::UInt64, b :: UInt64) = ccall(mygcdPointer, UInt64, (UInt64, UInt64), a, b)

function myDiophine(a :: Int64, b :: Int64, c :: Int64)
    result = ccall(myDiophinePointer, myType, (Int64, Int64, Int64), a, b, c)
    return result
end

function main()
    println(myFactorial(UInt64(5)))
    println(mygcd(UInt64(36), UInt64(48)))
    a = 32
    b = 48
    c = -64
    temp = myDiophine(32, 48, -64)
    println("$a * x + $b * y == $c ma rozwiązanie:")
    println("x = $(temp.x) + k * $(div(b, temp.g)); y = $(temp.y) - k * $(div(a, temp.g))")
end

main()
