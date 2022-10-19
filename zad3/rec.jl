fact(n :: Unsigned) = n > 1 ? n * fact(n - 1) : 1
mygcd(a :: Unsigned, b :: Unsigned) = b == 0 ? a : mygcd(b, a % b)

function extented_euclidean(a :: Signed, b :: Signed, x :: Signed, y :: Signed, r :: Signed, s :: Signed)
    if b <= 0
        return x, y, a
    end

    c :: Signed = a % b
    q :: Signed = div(a, b)
    a = b
    b = c

    r_prim :: Signed = r
    s_prim :: Signed = s

    r = x - q * r
    s = y - q * s
    x = r_prim
    y = s_prim

    return extented_euclidean(a, b, x, y, r, s)
end

function solve_diophantic_equation(a :: Signed, b :: Signed, c :: Signed)
    if a == 0 && b == 0
        return c == 0 ? Nothing : Inf
    end
    x, y, g = extented_euclidean(abs(a), abs(b), 1, 0, 0, 1)
    if c % g != 0
        return Nothing
    end

    x *= div(c, g)
    y *= div(c, g)

    if a < 0 
        x = -x
    end

    if b < 0
        y = -y
    end

    return x, y, g
end

function main()
    f :: Unsigned = 5
    a0 :: Unsigned = 36
    b0 :: Unsigned = 24
    a :: Signed = 32
    b :: Signed = 48
    c :: Signed = -64

    f2 = fact(f)
    g = mygcd(a0, b0)

    temp = solve_diophantic_equation(a, b, c)

    if temp == Nothing
        println("No solutions")
        return
    end

    if temp == Inf
        println("Any two integers solve the equation")
        return
    end

    x, y, g2 = temp

    println("$(f)! == $f2")
    println("mygcd($(a),$(b)) == $g")
    println("$a * x + $b * y == $c is solved by: x = $x + k * $(div(b, g2)), y = $y - k * $(div(a, g2)), c")
end

main()