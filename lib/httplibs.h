#include <curl/curl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct url_data {
    size_t size;
    char* data;
};
char *handle_url(char* url, char* auth);
size_t write_data(void *ptr, size_t size, size_t nmemb, struct url_data *data);