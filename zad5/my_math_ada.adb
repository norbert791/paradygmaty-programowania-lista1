package body my_math_ada is

function uint_to_string(num : Uint64_t) return String is
    begin
    return Uint64_t'Image(num);
end uint_to_string;

function int_to_string(num : Int64_t) return String is
    begin
    return Int64_t'Image(num);
end int_to_string;

function div_int(a : Int64_t; b : Int64_t) return Int64_t is
    begin
    return a / b;
end div_int;

function neg_int(a : Int64_t) return Int64_t is
    begin
    return -a;
end neg_int;

end my_math_ada;