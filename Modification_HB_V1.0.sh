#!/bin/bash
#
#===================================
# Creation le 08/12/2019
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
OPTION=$(whiptail --title "F1PTL Modification HBlink Version 1.0" --menu "		Choisissez le fichier a modifier" 20 50 4 \
1 "Fichier configuration hblink.cfg" \
2 "Fichier des regles rules.py" \
3 "Fichier HBmonitor config.py" \
4 "Redemarrage Serveur"  3>&1 1>&2 2>&3)
 
exitstatus=$?

if [ $exitstatus != 0 ]; then
    echo "==> vous avez annule"; break;
fi

case $OPTION in
1)
sudo nano /opt/hblink3/hblink.cfg ;;
2)
sudo nano /opt/hblink3/rules.py ;;
3)
sudo nano /opt/HBmonitor/config.py ;;
4)
sudo reboot
 
esac
 
done
exit 0
