android_device_geehdc-kddi
==========================

CyanogenMod 11.0 device tree for LGL21 (KDDI Optimus G) 

Working:
* Graphics
* Sound
* Wifi
* Bluetooth
* Sensors
* GPS
* Camera
* Video
* Vibrator
* Phone  

Known issues:
* 3G/LTE Communication is not working (I don't have au LTE SIM)

Build Notes: 
    Directory-name is device/lge/geedhc  (is not geehdc-kddi)

Notes:
1. Almost Proprietary files is kbc-develoopers's for L01E-CM11, but RIL is LGL21 ICS original's

2. WLAN Driver 
   Source is from Mako's Old Source 
   #define QWLAN_VERSIONSTR               "3.1.7.11"
   WCNSS_qcom_wlan_nv.bin                 LGL21 4.0 firmware     

3. overlay/ ... /config.xml 
   modified config_autoBrightnessLevels, config_autoBrightnessLcdBacklightValues


