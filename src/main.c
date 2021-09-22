#include <stdio.h>
#include <string.h>
#include "structs.h"

int config_read(struct config_t *config) {
    char buffer[FILENAME_LENGTH + 1] = {0};
    FILE *fp;

    fp = fopen(config->fileName, "r+");
    if (fp == NULL) {
        return EEXIST;
    }
    fgets(buffer, KEY_LENGTH, (FILE*)fp);
    strncpy(config->key, buffer, KEY_LENGTH);

    fclose(fp);
    return 0;
}

int main() {
    return 0;
}