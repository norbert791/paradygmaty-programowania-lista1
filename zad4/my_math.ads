package my_math is

type DiophantineSolutionType is
    (VALID,
     NOT_FOUND,
     ANY);

type DiophantineEquationResult is record
    x : Integer := 0;
    y : Integer := 0;
    gcd : Integer := 0;
    sol_type : DiophantineSolutionType := NOT_FOUND;
end record;

function factorial(n : Natural) return Natural;
function gcd(a : Natural; b : Natural) return Natural;
function solve_diophantine_equation(a : Integer; b : Integer; c : Integer) return DiophantineEquationResult;

private

type EuclideanResult is record
    x : Integer := 0;
    y : Integer := 0;
    gcd : Integer := 0;
end record;

function extended_euclidean(a : Integer; b : Integer) return EuclideanResult;

end my_math;