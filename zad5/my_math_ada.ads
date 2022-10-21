with Interfaces;
package my_math_ada is

type Uint64_t is new Interfaces.Unsigned_64;

type Int64_t is new Interfaces.Integer_64;

type DiophantineEquationResult is record
    x : Int64_t := 0;
    y : Int64_t := 0;
    gcd : Int64_t := 0;
end record;
 
function uint_to_string(num : Uint64_t) return String;

function int_to_string(num : Int64_t) return String;

function div_int(a : Int64_t; b : Int64_t) return Int64_t;

function neg_int(a : Int64_t) return Int64_t;

function factorial(num : Uint64_t) return Uint64_t with
    Convention => C,
    Import => True,
    External_Name => "my_math_factorial";

function gcd(a : Uint64_t; b : Uint64_t) return Uint64_t with
    Convention => C,
    Import => True,
    External_Name => "my_math_gcd";

function solve_diophantine_equation(a : Int64_t; b : Int64_t; c : Int64_t) return DiophantineEquationResult with
    Convention => C,
    Import => True,
    External_Name => "my_math_solve_diophantine_equation";

private

end my_math_ada;
