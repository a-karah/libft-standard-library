LOCAL_DIR := ft_printf
LOCAL_SRCS := ft_printf.c \
				print_nbr.c \
				print_nbr_utils.c \
				print_text.c
LOCAL_SRCS := $(addprefix $(LOCAL_DIR)/, $(LOCAL_SRCS))
LOCAL_OBJS := $(LOCAL_SRCS:%.c=$(BUILD_DIR)/%.o)

SRCS += $(LOCAL_SRCS)
OBJS += $(LOCAL_OBJS)
