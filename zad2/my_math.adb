package body my_math is

function factorial(n : Natural) return Natural is
    result : Natural := 1;
    begin

    for I in 2 .. n loop
        result := result * I;
    end loop;

    return result;
end factorial;

function gcd(a : Natural; b : Natural) return Natural is
    c : Natural := 0;
    a_priv : Natural := a;
    b_priv : Natural := b;
    begin

    while b_priv > 0 loop
        c := a_priv mod b_priv;
        a_priv := b_priv;
        b_priv := c;
    end loop;

    return a_priv;
end gcd;

function extended_euclidean(a : Integer; b : Integer) return EuclideanResult is
    s : Integer := 0;
    old_s : Integer := 1;
    r : Integer := b;
    old_r : Integer := a;
    q : Integer := 0;
    temp : Integer := 0;
    result : EuclideanResult;
    begin

    while r /= 0 loop
        q := old_r / r;
        temp := r;
        r := old_r - q * r;
        old_r := temp;
        temp := s;
        s := old_s - q * r;
        old_s := temp;
    end loop;

    if b /= 0 then 
        result := (x => old_s, y => (old_r - old_s * a) / b, gcd => old_r);
    else
        result := (x => old_s, y => 0, gcd => old_r);
    end if;

    return result;
end extended_euclidean;

function solve_diophantine_equation(a : Integer; b : Integer; c : Integer) return DiophantineEquationResult is
    result : DiophantineEquationResult;
    temp : EuclideanResult;
    x : Integer;
    y : Integer;
    begin
    if a = 0 and b = 0 then
        if c = 0 then
            result := (x => 0, y => 0, gcd => 0, sol_type => ANY);
        else
            result := (x => 0, y => 0, gcd => 0, sol_type => NOT_FOUND);
        end if;
    end if;
    temp := extended_euclidean(a => abs(a), b => abs(b));
    if c mod temp.gcd /= 0 then
        result := (x => 0, y => 0, gcd => 0, sol_type => NOT_FOUND);
    else
        x := temp.x * (c / temp.gcd);
        y := temp.y * (c / temp.gcd);
        if a < 0 then x := -x; end if;
        if b < 0 then y := -y; end if;
        result := (x => x, y => y, gcd => temp.gcd, sol_type => VALID);
    end if;

    return result;

end solve_diophantine_equation;

end my_math;