# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from common msm8660
-include device/samsung/msm8660-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/samsung/t769/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := MSM8660_SURF
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
TARGET_CPU_SMP := true

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

BOARD_USE_CUSTOM_RECOVERY_FONT := "\"roboto_15x24.h\""
TARGET_RECOVERY_INITRC := device/samsung/t769/recovery/init.rc
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/t769/recovery/graphics.c
BOARD_CUSTOM_RECOVERY_UI := ../../device/samsung/t769/recovery/recovery_ui.c
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_HAS_INTERNAL_PARTITIONS := true

TARGET_OTA_ASSERT_DEVICE := SGH-T769,T769,sgh-t769,t769,Blaze4G,Blaze4g,blaze4G,blaze4g

# Kernel
TARGET_KERNEL_CONFIG        := cyanogenmod_t769_defconfig
TARGET_KERNEL_SOURCE        := kernel/samsung/msm8660-common
BOARD_KERNEL_CMDLINE        := androidboot.hardware=qcom usb_id_pin_rework=true no_console_suspend=true zcache
BOARD_KERNEL_BASE           := 0x40400000
BOARD_KERNEL_PAGESIZE       := 2048
BOARD_FORCE_RAMDISK_ADDRESS := 0x41800000

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p22: 00fffc00 00000200 "recovery"
#mmcblk0p8: 01000000 00000200 "boot"
#mmcblk0p24: 5ffffc00 00000200 "system"
#mmcblk0p26: 13fffe00 00000200 "cache"
#mmcblk0p25: 9ffffe00 00000200 "userdata"

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 20044333056
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p28
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true

USE_OPENGL_RENDERER :=true

# Suppress the WIPE command since it can brick our EMMC
BOARD_SUPPRESS_EMMC_WIPE := true

# Workaround for glitches while cropping bypass layers
TARGET_NO_BYPASS_CROPPING := true

# MTP
#BOARD_MTP_DEVICE := "/dev/mtp_usb"

# Disable initlogo, Samsungs framebuffer is weird
TARGET_NO_INITLOGO := true

# Preload the boot animation to avoid jerkiness
TARGET_BOOTANIMATION_PRELOAD := true
