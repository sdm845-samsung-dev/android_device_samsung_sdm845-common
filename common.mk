#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze \

# GSI specific tasks on boot
PRODUCT_PACKAGES += \
    gsi_skip_mount.cfg \
    init.gsi.rc \

# Init
PRODUCT_PACKAGES += \
    init.recovery.qcom.rc \
    init.samsung.display.rc \
    init.samsung.eif.rc \

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage \

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml \

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := \
    28 \
    29 \
    30 \
    31 \

# WiFi
PRODUCT_PACKAGES += \
    WifiOverlay \
