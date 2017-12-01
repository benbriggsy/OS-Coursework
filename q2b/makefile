all: fib.o bigint.o bigintadd.o bigint.h bigintprivate.h
	gcc -O3 -D NDEBUG -o fib fib.o bigint.o bigintadd.o bigint.h bigintprivate.h -I.
fib.o: fib.c
	gcc -O3 -D NDEBUG -c fib.c -o fib.o
bigint.o: bigint.c
	gcc -O3 -D NDEBUG -c bigint.c -o bigint.o
bigintadd.o: bigintadd.c
	gcc -O3 -D NDEBUG -c bigintadd.c -o bigintadd.o
clean:
	rm -f *.o  

