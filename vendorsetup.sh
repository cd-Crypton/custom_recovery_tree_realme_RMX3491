FDEVICE="golf"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
# Initial Info
      export ALLOW_MISSING_DEPENDENCIES=true
      export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
      export LC_ALL="C"
      export TW_DEFAULT_LANGUAGE="en"

	# Maintaining Info
      export OF_MAINTAINER=cd-Spidey
      export FOX_VERSION=$(date +%y.%m.%d)
      export FOX_BUILD_TYPE=Unofficial-Beta
	
	# Device
      export FOX_VARIANT="A12.1"
      export FOX_ARCH=arm64

	# Functions
      export FOX_REPLACE_BUSYBOX_PS=1
      export FOX_REPLACE_TOOLBOX_GETPROP=1
      export FOX_USE_TAR_BINARY=1
      export FOX_USE_SED_BINARY=1
      export FOX_USE_BASH_SHELL=1
      export FOX_ASH_IS_BASH=1
      export FOX_USE_GREP_BINARY=1
      export FOX_USE_XZ_UTILS=1
      export FOX_USE_NANO_EDITOR=1
      export OF_ENABLE_LPTOOLS=1
      export OF_FORCE_DISABLE_DM_VERITY=1
      export FOX_DELETE_AROMAFM=1

	# Display Settings
      export OF_SCREEN_H=2340
      export OF_STATUS_H=120
      export OF_STATUS_INDENT_LEFT=150
      export OF_STATUS_INDENT_RIGHT=20
      export OF_HIDE_NOTCH=1
      export OF_CLOCK_POS=1
      export OF_ALLOW_DISABLE_NAVBAR=0
      export OF_USE_GREEN_LED=0

	# Device Codename (other variant)
      export TARGET_DEVICE_ALT="RMX3491,RMX3491T2,RMX3493,RED8C1L1,ossi,qssi"

	# Partitions Handling
      export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
      export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

	# Passive Decryption Support upon OTA
      export OF_OTA_RES_DECRYPT=1
      export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
      export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
      export OF_NO_RELOAD_AFTER_DECRYPTION=1
      export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"; # Tuesday, January 1, 2019 12:00:00 AM GMT+00:00
      export OF_FBE_METADATA_MOUNT_IGNORE=1

	# Other Functions
      export OF_PATCH_AVB20=1
      export OF_NO_SPLASH_CHANGE=1
      export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	
	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
		export | grep "FOX" >> $FOX_BUILD_LOG_FILE
		export | grep "OF_" >> $FOX_BUILD_LOG_FILE
		export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
		export | grep "TW_" >> $FOX_BUILD_LOG_FILE
	fi
fi
#