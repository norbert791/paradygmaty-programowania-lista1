with my_math_ada, Ada.Text_IO;
--use type my_math_ada.DiophantineSolutionType;

procedure main is
    integral_result : my_math_ada.Uint64_t := 0; 
    gcd_result : my_math_ada.Uint64_t := 0;
    dioph_result : my_math_ada.DiophantineEquationResult;
    a : my_math_ada.Int64_t := 32;
    b : my_math_ada.Int64_t := 48;
    c : my_math_ada.Int64_t := my_math_ada.neg_int(64);
begin
    integral_result := my_math_ada.factorial(5);
    gcd_result := my_math_ada.gcd(80, 14);
    dioph_result := my_math_ada.solve_diophantine_equation(a =>  a, b => b, c => c);
    
    Ada.Text_IO.Put_Line(my_math_ada.uint_to_string(integral_result));
    Ada.Text_IO.Put_Line(my_math_ada.uint_to_string(gcd_result));
    Ada.Text_IO.Put_Line("x := " & my_math_ada.int_to_string(dioph_result.x) & " + k * " &
                my_math_ada.int_to_string(my_math_ada.div_int(b, dioph_result.gcd)) & " and y := " & 
                my_math_ada.int_to_string(dioph_result.y) & " - k * " & 
                my_math_ada.int_to_string(my_math_ada.div_int(a,dioph_result.gcd)));
end main;