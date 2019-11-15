.DEFAULT_GOAL := help
CC = clang
BUILDDIR = ./build
LIBDIR = ./lib
BIN = ./jcv
ARGC = https://discordapp.com/api
ARGV = 123

## build command ##

build: build-lib build-main ## build project
	$(CC) $(BUILDDIR)/httplibs.o $(BUILDDIR)/jcv.o -o jcv  -l curl websockets -L /usr/local/lib

build-test: build test ## build and exec project

build-lib: ## build lib only
	$(CC) -c $(LIBDIR)/httplibs.c -o $(BUILDDIR)/httplibs.o
	$(CC) -c $(LIBDIR)/websocketlibs.c -o $(BUILDDIR)/websocketlibs.o

build-main: ## build main only
	$(CC) -c jcv.c -o $(BUILDDIR)/jcv.o
	
	
## clean command ##

clean-object: ## delete *.o file
	rm $(BUILDDIR)/*.o

clean-bin: ## delete all file in build directory
	rm $(BIN)


## install and testing command ##

install: install-libcurl install-libwebsockets ## install dependency
	# add clean build folder
	
install-libcurl: ## install libcurl dependency
	cd build && git clone https://github.com/curl/curl.git && cd ./curl && ./buildconf && ./configure && make
	
install-libwebsockets: ## install libwebsockets dependency
	cd build && git clone https://libwebsockets.org/repo/libwebsockets && cd ./libwebsockets && mkdir build && cd build && cmake .. && sudo make install

test: ## lunch project
	$(BIN) $(ARGC) $(ARGV)

help: 	
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# websocketlibs.o
#./lib/websocketlibs.c
#@read -p "Entrer your endpoint:" ENDPOINT;
