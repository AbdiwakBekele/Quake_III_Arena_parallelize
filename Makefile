# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -g

# Linker flags and libraries
LDFLAGS = -L/usr/local/opt/mesa/lib
LDLIBS = -lGL -lm -lz -lpthread -ldl

# Include directories
CPPFLAGS = -I/usr/local/opt/mesa/include/GL -Icode/renderer -Icode/qcommon -Icode/game -Icode/client

# Source files
SRCS = \
    code/renderer/tr_curve.c \
    code/renderer/tr_init.c \
    code/renderer/tr_main.c \
    code/renderer/tr_backend.c \
    code/renderer/tr_light.c \
    code/renderer/tr_model.c \
    code/renderer/tr_world.c \
    code/renderer/tr_image.c \
    code/game/q_shared.c \
    code/game/q_math.c \
    code/qcommon/common.c \
    code/qcommon/files.c \
    code/game/bg_lib.c \
    code/game/bg_misc.c \
    code/client/cl_main.c \
    code/client/cl_cgame.c \
    code/client/cl_parse.c \
    code/client/cl_input.c

# Object files
OBJS = $(SRCS:.c=.o)

# Target executable
TARGET = quake3

# Default target
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) $(LDLIBS) -o $(TARGET)

code/renderer/%.o: code/renderer/%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

code/qcommon/%.o: code/qcommon/%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

code/game/%.o: code/game/%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

code/client/%.o: code/client/%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

# Clean up
clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean
