VENDOR_PATH := vendor/OnePlusLab

# OnePlusLab
PRODUCT_SOONG_NAMESPACES += \
   vendor/OnePlusLab

PRODUCT_PACKAGES += \
    OnePlusLab \
    DaxUI \
    daxService

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/OnePlusLab/privapp-permissions-OnePlusLab.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-OnePlusLab.xml

PRODUCT_COPY_FILES += \
    vendor/OnePlusLab/rootdir/etc/init.onepluslab.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.onepluslab.rc

# OnePlus Dolby
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/OnePlusDolby/dolby/dax-default.xml:$(TARGET_COPY_OUT_ODM)/etc/dolby/dax-default.xml \
    $(LOCAL_PATH)/OnePlusDolby/dolby/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml \
    $(LOCAL_PATH)/OnePlusDolby/dolby/config-com.dolby.daxappui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/config-com.dolby.daxappui.xml \
    $(LOCAL_PATH)/OnePlusDolby/dolby/config-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/config-com.dolby.daxservice.xml \
    $(LOCAL_PATH)/OnePlusDolby/dolby/hiddenapi-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/hiddenapi-com.dolby.daxservice.xml \
    $(LOCAL_PATH)/OnePlusDolby/dolby/privapp-com.dolby.daxappui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.dolby.daxappui.xml \
    $(LOCAL_PATH)/OnePlusDolby/dolby/privapp-com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-com.dolby.daxservice.xml \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/OnePlusDolby/audio/,$(TARGET_COPY_OUT_VENDOR)/etc) \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/system/lib64/vendor.dolby.hardware.dms@2.0.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/vendor.dolby.hardware.dms@2.0.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/bin/hw/vendor.dolby.hardware.dms@2.0-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.dolby.hardware.dms@2.0-service \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/etc/init/vendor.dolby.hardware.dms@2.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.dolby.hardware.dms@2.0-service.rc \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib/libdapparamstorage.so:$(TARGET_COPY_OUT_VENDOR)/lib/libdapparamstorage.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib/libdeccfg.so:$(TARGET_COPY_OUT_VENDOR)/lib/libdeccfg.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib/libqtigef.so:$(TARGET_COPY_OUT_VENDOR)/lib/libqtigef.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib/libstagefright_soft_ac4dec.so:$(TARGET_COPY_OUT_VENDOR)/lib/libstagefright_soft_ac4dec.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib/libstagefright_soft_ddpdec.so:$(TARGET_COPY_OUT_VENDOR)/lib/libstagefright_soft_ddpdec.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib/libstagefrightdolby.so:$(TARGET_COPY_OUT_VENDOR)/lib/libstagefrightdolby.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib/soundfx/libeffectproxy.so:$(TARGET_COPY_OUT_VENDOR)/lib/soundfx/libeffectproxy.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib/soundfx/libhwdap.so:$(TARGET_COPY_OUT_VENDOR)/lib/soundfx/libhwdap.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib/soundfx/libswdap.so:$(TARGET_COPY_OUT_VENDOR)/lib/soundfx/libswdap.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib/soundfx/libswgamedap.so:$(TARGET_COPY_OUT_VENDOR)/lib/soundfx/libswgamedap.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib/vendor.dolby.hardware.dms@2.0.so:$(TARGET_COPY_OUT_VENDOR)/lib/vendor.dolby.hardware.dms@2.0.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib64/libdapparamstorage.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdapparamstorage.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib64/libdeccfg.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdeccfg.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib64/libdlbdsservice.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdlbdsservice.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib64/libstagefright_soft_ac4dec.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libstagefright_soft_ac4dec.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib64/libstagefright_soft_ddpdec.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libstagefright_soft_ddpdec.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib64/libstagefrightdolby.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libstagefrightdolby.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib64/soundfx/libeffectproxy.so:$(TARGET_COPY_OUT_VENDOR)/lib64/soundfx/libeffectproxy.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib64/soundfx/libhwdap.so:$(TARGET_COPY_OUT_VENDOR)/lib64/soundfx/libhwdap.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib64/soundfx/libswdap.so:$(TARGET_COPY_OUT_VENDOR)/lib64/soundfx/libswdap.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib64/soundfx/libswgamedap.so:$(TARGET_COPY_OUT_VENDOR)/lib64/soundfx/libswgamedap.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib64/vendor.dolby.hardware.dms@2.0-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.dolby.hardware.dms@2.0-impl.so \
    $(LOCAL_PATH)/OnePlusDolby/proprietary/vendor/lib64/vendor.dolby.hardware.dms@2.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.dolby.hardware.dms@2.0.so

# Sepolicy
BOARD_SEPOLICY_DIRS += $(VENDOR_PATH)/sepolicy

# Vendor properties
-include $(VENDOR_PATH)/vendor_prop.mk
