NAME := libtemplate.a

INCS := include

SRC_DIR := src
BUILD_DIR := .build

SRCS := print_hello.c

OBJS := $(SRCS:%.c=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

CC := gcc
CFLAGS := -Wall -Werror -Wextra
CPPFLAGS := $(addprefix -I, $(INCS)) -MMD -MP

AR := ar
ARFLAGS := -rcs

RM = rm -rf

all: $(NAME)

debug: CFLAGS += -g -DDEBUG
debug: all

address: CFLAGS += -fsanitize=address -g
address: re

thread: CFLAGS += -fsanitize=thread -g
thread: re

$(NAME): $(BUILD_DIR) $(OBJS)
	$(AR) $(ARFLAGS) $(NAME) $(OBJS)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

clean:
	$(RM) $(BUILD_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

-include $(DEPS)

.PHONY: all clean fclean re debug address thread
