CC = gcc
CFLAGS = -Wall -Wextra -O2 -g

SRC_DIR = src
BUILD_DIR = build
BIN_DIR = bin

# find all .c files in directories
CLIENT_SRC = $(wildcard $(SRC_DIR)/client/*.c)
SERVER_SRC = $(wildcard $(SRC_DIR)/server/*.c)

# transform .c files to object files
CLIENT_OBJ = $(patsubst $(SRC_DIR)/%, $(BUILD_DIR)/%, $(CLIENT_SRC:.c=.o))
SERVER_OBJ = $(patsubst $(SRC_DIR)/%, $(BUILD_DIR)/%, $(SERVER_SRC:.c=.o))

CLIENT_BIN = $(BIN_DIR)/client
SERVER_BIN = $(BIN_DIR)/server

all: $(CLIENT_BIN) $(SERVER_BIN)

$(CLIENT_BIN): $(CLIENT_OBJ)
	mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $^

$(SERVER_BIN): $(SERVER_OBJ)
	mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $^

# rule to convert .c to .o files and put them in build directory
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)
