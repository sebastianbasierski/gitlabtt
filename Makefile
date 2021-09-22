SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin
TEST_DIR := test

EXE := $(BIN_DIR)/main
SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC))

TEST_EXE := $(BIN_DIR)/test
TEST := $(wildcard $(TEST_DIR)/*.c)
OBJ_TEST := $(patsubst $(TEST_DIR)/%.c, $(OBJ_DIR)/%.o, $(TEST))

CPPFLAGS := -Iinclude -MMD -MP
CFLAGS   := -Wall -g
CFLAGS_TEST   := $(CFLAGS) -Dmain=_main_disabled
LDFLAGS  := -Llib
LDLIBS   := -lm
LDLIBS_TEST   := $(LDLIBS) -lcunit

.PHONY: all test clean

all: $(EXE)

$(EXE): $(OBJ) | $(BIN_DIR)
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@

test: $(TEST_EXE)

$(TEST_EXE): $(OBJ_TEST) | $(BIN_DIR)
	$(CC) $(LDFLAGS) $^ $(LDLIBS_TEST) -o $@

$(OBJ_DIR)/%.o: $(TEST_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CPPFLAGS) $(CFLAGS_TEST) -c $< -o $@

test_run: test
	bin/test


clean:
	@$(RM) -rv $(BIN_DIR) $(OBJ_DIR)

-include $(OBJ:.o=.d)