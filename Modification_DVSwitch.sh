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
FIC_REF_TAR="Fichiers_Ini_Ref.tar"
#####################################
if [ $(id -u) -ne 0 ]
        then
        echo ""
        echo "==> Lancement avec les droits root"
        exit 1
fi

while : ; do
OPTION=$(whiptail --title "F1PTL Modification Version 1.0" --menu "		Choisissez le fichier a modifier" 20 50 7 \
1 "Fichier Analog_Bridge.ini" \
2 "Fichier MMDVM_Bridge.ini" \
3 "Fichier NXDNGateway.ini" \
4 "Fichier P25Gateway.ini" \
5 "Fichier YSFGateway.ini" \
6 "Fichier DVSwitch.ini" \
7 "Redemarrage Serveur"  3>&1 1>&2 2>&3)
 
exitstatus=$?

if [ $exitstatus != 0 ]; then
    echo "==> vous avez annule"; break;
fi

case $OPTION in
1)
sudo nano /opt/Analog_Bridge/Analog_Bridge.ini ;;
2)
sudo nano /opt/MMDVM_Bridge/MMDVM_Bridge.ini ;;
3)
sudo nano /opt/NXDNGateway.ini ;;
4)
sudo nano /opt/P25Gateway.ini ;;
5)
sudo nano /opt/YSFGateway.ini ;;
6)
sudo nano /opt/MMDVM_Bridge/DVSwitch.ini ;;
7)
sudo reboot
 
esac
 
done
exit 0
