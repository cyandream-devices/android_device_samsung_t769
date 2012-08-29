## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := blaze4g

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/blaze4g/device_blaze4g.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := blaze4g
PRODUCT_NAME := cm_blaze4g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := blaze4g
PRODUCT_MANUFACTURER := samsung
