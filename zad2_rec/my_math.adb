package body my_math is

function factorial(n : Natural) return Natural is
    result : Natural := 1;
    begin
    if n > 1 then
        result := result * factorial(result - 1);
    end if;
    return result;
end factorial;

function gcd(a : Natural; b : Natural) return Natural is
    result : Natural := a;
    begin
    if b > 0 then
        result := gcd(b, a mod b);
    end if;
    return result;
end gcd;

function extended_euclidean(a : Integer; b : Integer;
                            x : Integer; y : Integer;
                            r : Integer; s : Integer) return EuclideanResult is
    b_priv : Integer := b;
    a_priv : Integer := a;
    x_priv : Integer := x;
    y_priv : Integer := y;
    r_priv : Integer := r;
    s_priv : Integer := s;
    c : Integer := 0;
    q : Integer := 0;
    result : EuclideanResult := (x => x, y => y, gcd => a);
    begin
    if b > 0 then

        c := a mod b;
        q := a / b;
        a_priv := b;
        b_priv := c;
        r_priv := x - q * r;
        s_priv := y - q * s;
        x_priv := r;
        y_priv := s;
    
        result := extended_euclidean(a => a_priv, b => b_priv,
                              x => x_priv, y => y_priv,
                              r => r_priv, s => s_priv);
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
    temp := extended_euclidean(a => abs(a), b => abs(b), x => 1, y => 0, r => 0, s => 1);
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