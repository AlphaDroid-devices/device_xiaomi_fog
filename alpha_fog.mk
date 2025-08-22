#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/alpha/config/common_full_phone.mk)
TARGET_BOOT_ANIMATION_RES := 720

# Inherit GMS if available
$(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)

# Inherit from fog device
$(call inherit-product, device/xiaomi/fog/device.mk)

PRODUCT_NAME := alpha_fog
PRODUCT_DEVICE := fog
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi 10C

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="fog_global-user 13 TKQ1.221114.001 V14.0.8.0.TGEMIXM release-keys" \
    BuildFingerprint=Redmi/fog_global/fog:13/TKQ1.221114.001/V14.0.8.0.TGEMIXM:user/release-keys


# Device config
TARGET_ENABLE_BLUR := true
TARGET_EXCLUDES_AUDIOFX := false 
TARGET_FACE_UNLOCK_SUPPORTED := true

# Build config

# TARGET_BUILD_PACKAGE options:
# 1 - vanilla (default)
# 2 - microg
# 3 - gapps
TARGET_BUILD_PACKAGE := 3

ifeq ($(TARGET_BUILD_PACKAGE),3)
# (valid only for GAPPS builds)
TARGET_INCLUDE_PIXEL_LAUNCHER := true
TARGET_INCLUDE_GOOGLE_COMMS := false
TARGET_SUPPORTS_QUICK_TAP := false
TARGET_SUPPORTS_CALL_RECORDING := true
TARGET_INCLUDE_STOCK_ARCORE := false
TARGET_INCLUDE_LIVE_WALLPAPERS := false
TARGET_SUPPORTS_GOOGLE_RECORDER := true
endif

# Debugging
TARGET_INCLUDE_MATLOG := false
WITH_ADB_INSECURE := false
TARGET_BUILD_PERMISSIVE := false 
SELINUX_IGNORE_NEVERALLOWS := false

# Extras
TARGET_INCLUDE_SIMPLE_TUNE := false

# Maintainer
ALPHA_BUILD_TYPE := Official
ALPHA_MAINTAINER := Romeo13card

