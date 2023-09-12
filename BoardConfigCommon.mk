#
# Copyright (C) 2021 The LineageOS Project
# Copyright (C) 2021 AOSPK
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

COMMON_PATH := device/samsung/sdm845-common

ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Include
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Audio
TARGET_EXCLUDES_AUDIOFX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm845

# Firmware
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
BOARD_VENDOR := samsung
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := sdm845

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo385

# Secondary Architecture
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo385

TARGET_SUPPORTS_64_BIT_APPS := true

# Kernel SDM845
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += ehci-hcd.park=3 lpm_levels.sleep_disabled=1 service_locator.enable=1 $
BOARD_KERNEL_CMDLINE += androidboot.configfs=true androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware_mnt/image/ loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive root=/dev/block/sda22
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
TARGET_KERNEL_SOURCE := kernel/samsung/sdm845
TARGET_KERNEL_LLVM_BINUTILS := false
TARGET_KERNEL_OPTIONAL_LD := true
TARGET_KERNEL_ADDITIONAL_FLAGS := \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# Mkbootimg
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(COMMON_PATH)/configs/hardware/samsung/mkbootimg.mk

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE    := 336592896
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4650418176
BOARD_FLASH_BLOCK_SIZE := 131072

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs
BOARD_ROOT_EXTRA_FOLDERS := efs
TARGET_COPY_OUT_VENDOR := vendor

# Graphics
TARGET_USES_HWC2 := true
OVERRIDE_RS_DRIVER := libRSDriverArm.so
BACKLIGHT_PATH := "/sys/class/backlight/panel0-backlight/brightness"

# Properties
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE := true
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/recovery/recovery.fstab
BOARD_HAS_DOWNLOAD_MODE := true

# HIDL
DEVICE_FRAMEWORK_MANIFEST_FILE := $(COMMON_PATH)/configs/vintf/framework_manifest.xml

# Sepolicy
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private
SELINUX_IGNORE_NEVERALLOWS := true

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Inherit from the proprietary version
include vendor/samsung/sdm845-common/BoardConfigVendor.mk
