with my_math, Ada.Text_IO;
use type my_math.DiophantineSolutionType;

procedure main is
    integral_result : Natural := 0; 
    gcd_result : Natural := 0;
    dioph_result : my_math.DiophantineEquationResult;
    a : Integer := 32;
    b : Integer := 48;
    c : Integer := -64;
begin
    integral_result := my_math.factorial(5);
    gcd_result := my_math.gcd(80, 14);
    dioph_result := my_math.solve_diophantine_equation(a =>  a, b => b, c => c);
    
    Ada.Text_IO.Put_Line(Natural'Image(integral_result));
    Ada.Text_IO.Put_Line(Natural'Image(gcd_result));
    if dioph_result.sol_type = my_math.ANY then
        Ada.Text_IO.Put_Line("Solution is given by any two integers");
    elsif dioph_result.sol_type = my_math.NOT_FOUND then
        Ada.Text_IO.Put_Line("Solution does not exist");
    else
        Ada.Text_IO.Put_Line("x := " & Integer'Image(dioph_result.x) & " + k * " &
                    Integer'Image(b / dioph_result.gcd) & " and y := " & 
                    Integer'Image(dioph_result.y) & " - k * " & 
                    Integer'Image(a / dioph_result.gcd));
    end if;
end main;