#!/bin/bash
#
# Create SD card #2
# for configuring freshly flashed OpenIPC firmware
# on a Wyze Cam V3 camera
#
# 2023 Paul Philippov, paul@themactep.com
#

show_help_and_exit() {
    echo "Usage: $0 -d <SD card device>"
    if [ "$EUID" -eq 0 ]; then
        echo -n "Detected devices: "
        fdisk -x | grep -B1 'SD/MMC' | head -1 | awk '{print $2}' | sed 's/://'
    fi
    exit 1
}

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    show_help_and_exit
fi

# command line arguments
while getopts d: flag; do
    case ${flag} in
        d) card_device=${OPTARG} ;;
    esac
done


[ -z "$card_device" ] && show_help_and_exit

# initialize list of files
            wlandev="rtl8189ftv-t31-wyze-v3"
            files="${files} lib/modules/3.10.14__isvp_swan_1.0__/extra/8189fs.ko"
            wlan_modline="extra/8189fs.ko: kernel/net/wireless/cfg80211.ko"

echo

while [ -z "$wlanssid" ]; do
    read -p "Enter Wireless network SSID: " wlanssid
done

while [ -z "$wlanpass" ]; do
    read -p "Enter Wireless network password: " wlanpass
done

echo
sdmount=$(mktemp -d)

echo "Copy common files"
mkdir -p ${sdmount}/files
cp -r $(dirname $0)/common/* ${sdmount}/files/

echo "Copy optional files"
for file in $files; do
  mkdir -p $(dirname ${sdmount}/files/${file})
  cp -v $(dirname $0)/addons/${file} ${sdmount}/files/${file}
done

echo "Create temporary file with additional module lines"
if [ -n "$sensor_modline" ]; then
  echo "${sensor_modline}" | tee -a modlines.add
fi
if [ -n "$wlan_modline" ]; then
  echo "${wlan_modline}" | tee -a modlines.add
fi

echo "Create installation script"
echo "#!/bin/sh

echo \"
wlandev ${wlandev}
wlanssid ${wlanssid}
wlanpass ${wlanpass}
ir850_led_pin 47
ir940_led_pin 49
\" >2env.txt

fw_setenv --script 2env.txt

cp -rv \$(dirname \$0)/files/* /
cat \$(dirname \$0)/modlines.add | tee -a /lib/modules/3.10.14__isvp_swan_1.0__/modules.dep
echo \"
Configuration is done.

\"
" > ${sdmount}/install.sh


echo "
--- GOTO root of the camera drive and run install.sh
cd \
sh install.sh
After that is done reboot camera and you should get an IP address from your dhcp
------------------------------------
"

exit 0