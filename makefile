#makefile which generates the following files

# replaces the appearance of the word "debug" with "dd" in debug_info.c and deb.c
# modified contents are used to generate the d.c and dd.c files
dd.c: debug_info.c
     sed 's/debug/dd/' debug_info.c > dd.c

d.c: deb.c
     sed 's/debug/dd/' deb.c > d.c 


# generates the following files by compiling the corresponding c files
d.o: d.c
     gcc -c d.c

DA: dd.c d.o
     gcc -o DA dd.c d.o -D_dd_typeA
     
DB: dd.c d.o
     gcc -o DB dd.c d.o -D_dd_typeB

Program: dd.c d.o
     gcc -o Program dd.c d.o