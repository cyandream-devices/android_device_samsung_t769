## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := T769 

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/T769 /device_T769 .mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := T769 
PRODUCT_NAME := cm_T769 
PRODUCT_BRAND := samsung
PRODUCT_MODEL := T769 
PRODUCT_MANUFACTURER := samsung
