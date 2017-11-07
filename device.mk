#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL geehdc devices, and
# are also specific to geehdc devices
#
# Everything in this directory will become public
#
$(call inherit-product, device/lge/gproj-common/gproj.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PACKAGES += \
	lights.geehdc

# for old wifi driver need system/etc/firmware/wlan/prima 
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
	$(LOCAL_PATH)/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
	$(LOCAL_PATH)/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
	$(LOCAL_PATH)/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
	$(LOCAL_PATH)/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
	$(LOCAL_PATH)/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/thermald-geehdc.conf:system/etc/thermald.conf

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/initlogo.rle:root/initlogo.rle888 \
	$(LOCAL_PATH)/init.geehdc.rc:root/init.geehdc.rc \
	$(LOCAL_PATH)/fstab.geehdc:root/fstab.geehdc \
	$(LOCAL_PATH)/twrp.fstab:recovery/root/etc/twrp.fstab \
	$(LOCAL_PATH)/ueventd.geehdc.rc:root/ueventd.geehdc.rc

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl \
	$(LOCAL_PATH)/keypad_8064.kl:system/usr/keylayout/keypad_8064.kl \
	$(LOCAL_PATH)/apq8064-tabla-snd-card_Button_Jack.kcm:system/usr/keychars/apq8064-tabla-snd-card_Button_Jack.kcm \
	$(LOCAL_PATH)/keypad_8064.kcm:system/usr/keychars/keypad_8064.kcm

# This hw ships locked, work around it with loki
PRODUCT_PACKAGES += \
	loki_tool \
	loki.sh

#These are hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320

PRODUCT_PACKAGES += \
	hci_qcomm_init

#PRODUCT_PACKAGES += \
#	power.msm8960

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.geehdc.bt.sh:system/etc/init.geehdc.bt.sh

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.bt.hci_transport=smd

PRODUCT_PACKAGES += \
	camera.msm8960 \
	libmmcamera_interface2 \
	libmmcamera_interface

PRODUCT_PACKAGES += \
	libwfcu \
	conn_init

PRODUCT_PACKAGES += \
	keystore.msm8960

PRODUCT_PROPERTY_OVERRIDES += \
        ro.cdma.home.operator.numeric=44054  \
        ro.cdma.home.operator.alpha=KDDI \
        telephony.lteOnCdmaDevice=1 \
        telephony.lte.cdma.device=1 \
        ro.telephony.default_network=8 \
        ro.ril.def.preferred.network=8 \
        ril.subscription.types=NV,RUIM \
        ro.cdma.subscribe_on_ruim_ready=true \
        persist.radio.no_wait_for_card=1 \
        keyguard.no_require_sim=true \
        telephony.sms.pseudo_multipart=1 \
        DEVICE_PROVISIONED=1

PRODUCT_PACKAGES += \
	wpa_supplicant_overlay.conf \
	p2p_supplicant_overlay.conf

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
