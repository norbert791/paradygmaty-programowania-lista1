fact(n :: Unsigned) = n > 1 ? n * fact(n - 1) : 1
gcd(a :: Unsigned, b :: Unsigned) = b == 0 ? a : gcd(b, a % b)

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

    return extended_euclidean(a, b, x, y, r, s)
end