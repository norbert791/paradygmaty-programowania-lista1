#!/bin/bash

#gnatmake -c my_math
#gcc -c main.c
#gnatbind -n my_math
#gnatlink my_math -o main --LINK=gcc main.o

if [ ! -d build ]
then
    mkdir build
else
    rm -R build
    mkdir build
fi
gnatmake -c my_math -D build
gcc -c main.c -o build/main.o
cd build
gnatbind -n my_math
gnatlink my_math -o main --LINK=gcc main.o
cd ..