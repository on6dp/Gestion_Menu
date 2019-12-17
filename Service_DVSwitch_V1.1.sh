#!/bin/bash
#
#===================================
# Creation le 30/11/2019
# Par F1PTL Bruno
# Version 1.1
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
OPTION=$(whiptail --title "F1PTL Service Version 1.1" --menu "		Choisir le Service" 25 60 19 \
1 "Arret Service Analog_Bridge" \
2 "Demarrage Service Analog_Bridge" \
3 "Status Service Analog_Bridge (5sec)" \
4 "Arret Service MMDVM_Bridge" \
5 "Demarrage Service MMDVM_Bridge" \
6 "Status Service MMDVM_Bridge (5sec)" \
7 "Arret Service NXDNGateway" \
8 "Demarrage Service NXDNGateway" \
9 "Status Service NXDNGateway (5sec)" \
10 "Arret Service P25Gateway" \
11 "Demarrage Service P25Gateway" \
12 "Status Service P25Gateway (5sec)" \
13 "Arret Service YSFGateway" \
14 "Demarrage Service YSFGateway" \
15 "Status Service YSFGateway (5sec)" \
16 "Arret Service AMBEServer" \
17 "Demarrage Service AMBEServer" \
18 "Status Service AMBEServer  (5sec)" \
19 "Reload Services" 3>&1 1>&2 2>&3)
 
exitstatus=$?

if [ $exitstatus != 0 ]; then
    echo "==> vous avez annule"; break;
fi

case $OPTION in
1)
sudo systemctl stop analog_bridge.service ;;
2)
sudo systemctl start analog_bridge.service ;;
3)
clear;sudo systemctl status analog_bridge.service;sleep 5 ;;
4)
sudo systemctl stop mmdvm_bridge.service ;;
5)
sudo systemctl start mmdvm_bridge.service ;;
6)
clear;sudo systemctl status mmdvm_bridge.service;sleep 5 ;;
7)
sudo systemctl stop nxdngateway.service ;;
8)
sudo systemctl start nxdngateway.service ;;
9)
clear;sudo systemctl status nxdngateway.service;sleep 5 ;;
10)
sudo systemctl stop p25gateway.service ;;
11)
sudo systemctl start p25gateway.service ;;
12)
clear;sudo systemctl status p25gateway.service;sleep 5 ;;
13)
sudo systemctl stop ysfgateway.service ;;
14)
sudo systemctl start ysfgateway.service ;;
15)
clear;sudo systemctl status ysfgateway.service;sleep 5 ;;
16)
sudo systemctl stop ambeserver.service ;;
17)
sudo systemctl start ambeserver.service ;;
18)
clear;sudo systemctl status ambeserver.service;sleep 5 ;;
19)
sudo systemctl daemon-reload ;;

esac
done
exit 0
