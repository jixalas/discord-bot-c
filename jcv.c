#include <curl/curl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lib/httplibs.h"
#include "lib/websocketlibs.c"

const char HANGAR_CHANNEL = 123;

void sayHello();
void getChannel();
int httpRequest();
int webSockets();

int main(int argc, char ** argv) {
    int data = httpRequest(argc,argv);
    int ws = webSockets();

    return data;

    
}

void sayHello() {

    //getChannel(HANGAR_CHANNEL*, char* info);
}

void getChannel(char* id) {

}

int httpRequest(int argc, char ** argv){


    char* data;
    char* auth = malloc(5000 * sizeof(char));

    if(argc < 2) {
        fprintf(stderr, "Must provide URL to fetch.\n");
        return 1;
    }
    strcat(auth,argv[2]);
    printf("%s\n", auth);
    data = handle_url(argv[1], auth);

    if(data) {
        printf("%s\n", data);
        free(data);
    }
    return 0;
}

int webSockets() {
 test();
}