LOCAL_DIR := get_next_line
LOCAL_SRCS := get_next_line.c
LOCAL_SRCS := $(addprefix $(LOCAL_DIR)/, $(LOCAL_SRCS))
LOCAL_OBJS := $(LOCAL_SRCS:%.c=$(BUILD_DIR)/%.o)

SRCS += $(LOCAL_SRCS)
OBJS += $(LOCAL_OBJS)
