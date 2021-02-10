LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES += $(shell \
    find $(LOCAL_PATH) -type f -iregex '^.*\.cpp$$' | \
    sed 's!^$(LOCAL_PATH)/!!g')

$(info -----------)
$(info $(LOCAL_SRC_FILES))
$(info -----------)


LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)

LOCAL_CFLAGS += \
    -std=c++17 \
    -Wall \
    -fvisibility=hidden \

LOCAL_LDFLAGS += \
    
LOCAL_SHARED_LIBRARIES := \
    libbinder \
    libdl \
    liblog \
    libcutils \
    libutils \
    libc

LOCAL_MODULE := ClientDemo
LOCAL_MODULE_TAGS := optional

LOCAL_CXX_STL := libc++
include $(BUILD_EXECUTABLE)