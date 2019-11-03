#include <curl/curl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "libs/httplibs.h"

const char HANGAR_CHANNEL = 123;

void sayHello();
void getChannel();
int httpRequest();

int main(int argc, char ** argv) {
    int data = httpRequest(argc,argv);

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