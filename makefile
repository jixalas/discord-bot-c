CC = clang
BUILDDIR = ./build
LIBDIR = ./lib
BIN = ./jcv
ARGC = https://discordapp.com/api
ARGV = 123

build: build-lib build-main
	$(CC) $(BUILDDIR)/httplibs.o $(BUILDDIR)/jcv.o -o jcv -lcurl

build-test: build test

build-lib:
	$(CC) -c $(LIBDIR)/httplibs.c -o $(BUILDDIR)/httplibs.o

build-main:
	$(CC) -c jcv.c -o $(BUILDDIR)/jcv.o

clean-object:
	rm $(BUILDDIR)/*.o

clean-bin:
	rm $(BIN)

test:
	$(BIN) $(ARGC) $(ARGV)
# websocketlibs.o
#./lib/websocketlibs.c
#@read -p "Entrer your endpoint:" ENDPOINT;
