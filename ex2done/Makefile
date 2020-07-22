CC = gcc
CFLAGS = -Wall -g -std=c99 -m32
LD = gcc
LDFLAGS = -m32
AR = ar
ARFLAGS = -cvq
INCLUDE = lib
LIB = lib
SRC = src
BIN = bin
OBJECT_FILES = $(BIN)/foo.o
INPUT =

all: libfoo.a main001

main001: $(BIN)/main001.o libfoo.a
	$(LD) -o $@ $^ $(LDFLAGS) -I$(INCLUDE)

$(BIN)/main001.o: $(SRC)/main001.c | $(BIN)
	$(CC) -c -o $@ $< $(CFLAGS) -I$(INCLUDE)

libfoo.a: $(BIN)/foo.o | $(BIN)
	$(AR) $(ARFLAGS) $@ $^

$(BIN)/foo.o: $(LIB)/foo.c $(LIB)/foo.h $(BIN) | $(BIN)
	$(CC) -c -o $@ $< $(CFLAGS) -I$(INCLUDE)

$(BIN):
	mkdir $@

install: libfoo.a $(LIB)/foo.h main001
	cp libfoo.a $(prefix)/usr/lib/.
	cp $(LIB)/foo.h $(prefix)/usr/include/.
	cp main001 $(prefix)/usr/bin/.

uninstall:
	rm -f $(prefix)/usr/lib/libfoo.a
	rm -f $(prefix)/usr/include/foo.h
	rm -f $(prefix)/usr/bin/main001

clean:
	rm -f libfoo.a main001 $(BIN)/*

run:
	./main001

valgrind:
	valgrind --leak-check=full ./main001 < $(INPUT)
