CC=gcc
CFLAGS=-I.

parallel_min_max : utils.o find_min_max.o utils.h find_min_max.h
	$(CC) -o parallel_min_max utils.o find_min_max.o parallel_min_max.c $(CFLAGS)

utils.o : utils.h
	$(CC) -o utils.o -c utils.c $(CFLAGS)
	
find_min_max.o : utils.h find_min_max.h
	$(CC) -o find_min_max.o -c find_min_max.c $(CFLAGS)
	
zombie : zombie.c
	$(CC) -o zombie zombie.c $(CFLAGS)
    
process_memory : process_memory.c
	$(CC) -o process_memory process_memory.c $(CFLAGS)
	
parallel_sum : parallel_sum.c utils.o utils.h
	$(CC) -o parallel_sum utils.o parallel_sum.c -lpthread -L./libsum -lsum $(CFLAGS)
	
libsum.o : ./libsum/libsum.c
	$(CC) -o ./libsum/libsum.o -c ./libsum/libsum.c $(CFLAGS)
	
libsum : ./libsum/libsum.o
	ar rcs ./libsum/libsum.a ./libsum/libsum.o
    
clean:
	rm parallel_min_max utils.o find_min_max.o zombie process_memory parallel_sum ./libsum/libsum.o ./libsum/libsum.a