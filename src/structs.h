#ifndef _structs_h_
#define _structs_h_

#define FILENAME_LENGTH 64
#define KEY_LENGTH      64

struct config_t {
    char fileName[FILENAME_LENGTH];
    char key[KEY_LENGTH];
};

#endif /* _structs_h_ */