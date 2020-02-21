#!/bin/bash
#
#===================================
# Creation le 03/12/2019
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
OPTION=$(whiptail --title "F1PTL Service HBlink3 Version 1.0" --menu "		Choisir le Service" 25 60 7 \
1 "Arret Service HBlink3" \
2 "Demarrage Service HBlink3" \
3 "Status Service HBlink3 (5sec)" \
4 "Arret Service HBmonitor" \
5 "Demarrage Service HBmonitor" \
6 "Status Service HBmonitor (5sec)" \
7 "Reload Services" 3>&1 1>&2 2>&3)
 
exitstatus=$?

if [ $exitstatus != 0 ]; then
    echo "==> vous avez annule"; break;
fi

case $OPTION in
1)
sudo systemctl stop hblink3.service ;;
2)
sudo systemctl start hblink3.service ;;
3)
clear;sudo systemctl status hblink3.service;sleep 5 ;;
4)
sudo systemctl stop hbmonitor.service ;;
5)
sudo systemctl start hbmonitor.service ;;
6)
clear;sudo systemctl status hbmonitor.service;sleep 5 ;;
7)
sudo systemctl daemon-reload ;;


esac
done
exit 0
