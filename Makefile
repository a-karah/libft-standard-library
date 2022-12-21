NAME := libft.a

INCS := include

SRC_DIR := src
BUILD_DIR := .build
SUBDIRS := libft ft_printf get_next_line
SUBDIRS := $(addprefix $(BUILD_DIR)/, $(SUBDIRS))

SRCS :=
OBJS :=

include $(SRC_DIR)/libft/module.mk
include $(SRC_DIR)/ft_printf/module.mk
include $(SRC_DIR)/get_next_line/module.mk

DEPS := $(OBJS:.o=.d)

CC := gcc
CFLAGS := -Wall -Werror -Wextra
CPPFLAGS := $(addprefix -I, $(INCS)) -MMD -MP

AR := ar
ARFLAGS := -rcs

RM := rm -rf

all: $(NAME)

debug: CFLAGS += -g -DDEBUG
debug: all

address: CFLAGS += -fsanitize=address -g
address: re

thread: CFLAGS += -fsanitize=thread -g
thread: re

print-%: ; @echo $* = $($*)

$(NAME): $(SUBDIRS) $(OBJS)
	$(AR) $(ARFLAGS) $(NAME) $(OBJS)

$(SUBDIRS):
	@test -d $@ || mkdir -p $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

clean:
	$(RM) $(BUILD_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

-include $(DEPS)

.PHONY: all clean fclean re debug address thread
