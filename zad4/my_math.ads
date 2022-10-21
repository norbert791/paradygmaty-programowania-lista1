with Interfaces.C;
package my_math is

type DiophantineSolutionType is
    (VALID,
     NOT_FOUND,
     ANY);

for DiophantineSolutionType'Size use Interfaces.C.int'Size;
for DiophantineSolutionType use (VALID=>1, NOT_FOUND=>2, ANY=>3);

type DiophantineEquationResult is record
    x : Integer := 0;
    y : Integer := 0;
    gcd : Integer := 0;
    sol_type : DiophantineSolutionType := NOT_FOUND;
end record;

function factorial(n : Natural) return Natural with
    Export => True,
    Convention => C,
    External_Name => "my_math_factorial";
function gcd(a : Natural; b : Natural) return Natural with
    Export => True,
    Convention => C,
    External_Name => "my_math_gcd";
function solve_diophantine_equation(a : Integer; b : Integer; c : Integer) return DiophantineEquationResult with
    Export => True,
    Convention => C,
    External_Name => "my_math_solve_diophantine_equation";

private

type EuclideanResult is record
    x : Integer := 0;
    y : Integer := 0;
    gcd : Integer := 0;
end record;

function extended_euclidean(a : Integer; b : Integer) return EuclideanResult;

end my_math;