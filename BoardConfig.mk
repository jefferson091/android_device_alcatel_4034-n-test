# mt6580 platform boardconfig
LOCAL_PATH := device/alcatel/4034
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include


# Platform
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := mt6580
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true
TARGET_OTA_ASSERT_DEVICE := 4034_Base,4034G,4034A,4034D,4034

# MTK Hardware
BOARD_USES_MTK_HARDWARE := true
BOARD_USES_LEGACY_MTK_AV_BLOB := true
BOARD_USES_MTK_AUDIO := true
USE_CAMERA_STUB := true
USE_MTK_CAMERA_WRAPPER := true
BOARD_PROVIDES_RILD := true
BOARD_RIL_CLASS := ../../../device/alcatel/4034/ril

# CPU
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := mt6580

# Kernel
BOARD_KERNEL_CMDLINE += \
	bootopt=64S3,32S1,32S1 \
	androidboot.selinux=permissive
BUILD_NUMBER := $(shell date +%s)
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0x0e000000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)
TARGET_PREBUILT_KERNEL := device/alcatel/4034/rootdir/kernel

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
BOARD_HAS_LARGE_FILESYSTEM := true

# USB OTG and External Sdcard
TARGET_USES_EXFAT := true
TARGET_USES_NTFS := true

# Display
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true

RECOVERY_VARIANT := twrp

ifneq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/etc/recovery.fstab
endif

# Carliv
ifeq ($(RECOVERY_VARIANT),carliv)
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
DEVICE_SCREEN_WIDTH := 480
DEVICE_SCREEN_HEIGHT := 854
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness
VIBRATOR_TIMEOUT_FILE := /sys/devices/virtual/timed_output/vibrator/enable
DEVICE_RESOLUTION := 480x854
BOARD_HAS_MTK_CPU := true
BOARD_INCLUDE_CRYPTO := true
BOARD_USE_ADOPTED_STORAGE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"font_10x18.h\"
endif

# TWRP
ifeq ($(RECOVERY_VARIANT),twrp)
DEVICE_RESOLUTION := 480x800
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
TW_THEME := portrait_mdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/etc/twrp.fstab
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TW_MAX_BRIGHTNESS := 255
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_FB2PNG := true
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/emmc"
TW_INTERNAL_STORAGE_MOUNT_POINT := "emmc"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/mtk-msdc.0/11120000.msdc0/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,discard,noauto_da_alloc,data=ordered"
TW_EXCLUDE_SUPERSU := true
TW_USE_TOOLBOX := false
endif

TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

TARGET_LDPRELOAD += libgui_shim.so

# Seccomp filter
BOARD_SECCOMP_POLICY := $(LOCAL_PATH)/seccomp
