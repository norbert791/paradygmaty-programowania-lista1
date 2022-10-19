

function fact(n :: Unsigned) :: Unsigned
    result = 1
    while n > 1
        result *= n
        n -= 1
    end
    return result
end

function mygcd(a :: Unsigned, b :: Unsigned) :: Unsigned
    while b > 0
        a, b = b, a % b
    end
    return a
end

function extended_euclidean(a :: Signed, b :: Signed)
    s :: Signed = 0
    old_s :: Signed = 1
    r :: Signed = b
    old_r :: Signed = a

    while r != 0
        q :: Signed = div(old_r, r)
        temp :: Signed = r
        r = old_r - q * r
        old_r = temp
        temp = s
        s = old_s - q * r
        old_s = temp
    end

    if b != 0
        return old_r, old_s, div((old_r - old_s * a), b)
    end
    return old_r, old_s, 0
end

function solve_diophantic_equation(a :: Signed, b :: Signed, c :: Signed)
if a == 0 && b == 0
    return c == 0 ? Nothing : Inf
end
    gcd, x, y = extended_euclidean(abs(a), abs(b))
    if c % gcd != 0
        return Nothing
    end

    x *= div(c, gcd)
    y *= div(c, gcd)

    if a < 0 
        x = -x
    end

    if b < 0
        y = -y
    end

    return x, y, gcd
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

    println(f2)
    println(g)

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
    println("gcd($(a),$(b)) == $g")
    println("$a * x + $b * y == $c is solved by: x = $x + k * $(div(b, g2)), y = $y - k * $(div(a, g2)), c")
end

main()