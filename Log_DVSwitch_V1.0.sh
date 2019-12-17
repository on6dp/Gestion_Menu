#!/bin/bash
#
#===================================
# Creation le 30/11/2019
# Par F1PTL Bruno
# Version 1.0
#===================================
#####################################
# Variables #
#############
REP_COURANT=`pwd`
FIC_REF="Fichiers_Ini_Ref"
FIC_REF_TAR="Fichiers_Ini_Ref_V1.tar"
#####################################
if [ $(id -u) -ne 0 ]
        then
        echo ""
        echo "==> Lancement avec les droits root"
        exit 1
fi

while : ; do
OPTION=$(whiptail --title "F1PTL Log Version 1.0" --menu "		Choisir le log a visualiser" 20 50 6 \
1 "Log Service Analog_Bridge" \
2 "Log Service MMDVM_Bridge" \
3 "Log Service NXDNGateway" \
4 "Log Service P25Gateway" \
5 "Log Service YSFGateway" \
6 "Log Service AMBEServer" 3>&1 1>&2 2>&3)
 
exitstatus=$?

if [ $exitstatus != 0 ]; then
    echo "==> vous avez annule"; break;
fi

case $OPTION in
1) whiptail --title "Analog_Bridge.log" --textbox $(find /ramdisk/Analog*.log -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ")  30 100 --scrolltext ;;

2) whiptail --title "MMDVM_Bridge.log" --textbox  $(find /ramdisk/MMDVM*.log -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ") 30 100 --scrolltext ;;

3) whiptail --title "NXDNGateway.log" --textbox $(find /ramdisk/NXDNGateway*.log -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ") 30 100 --scrolltext ;;

4) whiptail --title "P25Gateway.log" --textbox $(find /ramdisk/P25Gateway*.log -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ") 30 100 --scrolltext ;;

5) whiptail --title "YSFGateway.log" --textbox $(find /ramdisk/YSFGateway*.log -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ") 30 100 --scrolltext ;;

6) whiptail --title "AMBEserver.log" --textbox $(find /ramdisk/AMBEserver*.log -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ") 30 100 --scrolltext ;;

esac
done
exit 0
