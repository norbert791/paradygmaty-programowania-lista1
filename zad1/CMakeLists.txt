cmake_minimum_required(VERSION 3.16)
cmake_policy(SET CMP0048 NEW)
set(C_STANDARD_REQUIRED ON)

project(zad1
        VERSION 0.5.1
        DESCRIPTION "JPP Lista 1 zadanie 1"
)

add_executable(zad1_it app/main.c src_iterative/my_math.c)
target_include_directories(zad1_it PUBLIC inc)
target_compile_options(zad1_it PUBLIC -Wall -Wextra -pedantic)
set_property(TARGET zad1_it PROPERTY C_STANDARD 99)


add_executable(zad1_rec app/main.c src_recursive/my_math.c)
target_include_directories(zad1_rec PUBLIC inc)
target_compile_options(zad1_rec PUBLIC -Wall -Wextra -pedantic)
set_property(TARGET zad1_rec PROPERTY C_STANDARD 99)