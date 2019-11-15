CC = clang
BUILDDIR = ./build
LIBDIR = ./lib
BIN = ./jcv
ARGC = https://discordapp.com/api
ARGV = 123

build: build-lib build-main
	$(CC) $(BUILDDIR)/httplibs.o $(BUILDDIR)/jcv.o -o jcv  -l curl websockets -L /usr/local/lib

build-test: build test

build-lib:
	$(CC) -c $(LIBDIR)/httplibs.c -o $(BUILDDIR)/httplibs.o
	$(CC) -c $(LIBDIR)/websocketlibs.c -o $(BUILDDIR)/websocketlibs.o

build-main:
	$(CC) -c jcv.c -o $(BUILDDIR)/jcv.o

clean-object:
	rm $(BUILDDIR)/*.o

clean-bin:
	rm $(BIN)

install:
	git clone https://libwebsockets.org/repo/libwebsockets
	#TODO a finir

test:
	$(BIN) $(ARGC) $(ARGV)
# websocketlibs.o
#./lib/websocketlibs.c
#@read -p "Entrer your endpoint:" ENDPOINT;
