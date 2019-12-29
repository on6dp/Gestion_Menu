#!/bin/bash
#
#===================================
# Creation le 29/12/2019
# Par F1PTL Bruno
# Version 1.5
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
OPTION=$(whiptail --title "F1PTL Gestion_Menu Version 1.5" --menu " Votre choix ?" 20 50 8 \
1 "Installation DVSwitch Server" \
2 "Modification DVSwitch Server" \
3 "Service DVSwitch Server" \
4 "Log DVSwitch Server" \
5 "Installation HBlink3 et HBmonitor" \
6 "Modification HBlink3 et HBmonitor" \
7 "Service HBlink3 et HBmonitor" \
8 "Redemarrage RaspBerryPi" 3>&1 1>&2 2>&3)
 
exitstatus=$?

if [ $exitstatus != 0 ]; then
    echo "==> vous avez annule"; break;
fi

case $OPTION in
1) ${REP_COURANT}/Installation_DVSwitch_V3.12.sh ;;
2) ${REP_COURANT}/Modification_DVSwitch_V1.0.sh ;;
3) ${REP_COURANT}/Service_DVSwitch_V1.1.sh ;;
4) ${REP_COURANT}/Log_DVSwitch_V1.0.sh ;;
5) ${REP_COURANT}/Installation_HB_V1.0.sh ;;
6) ${REP_COURANT}/Modification_HB_V1.0.sh ;;
7) ${REP_COURANT}/Service_HBlink3_V1.0.sh ;;
8) if (whiptail --title " Redemarrage RaspBerryPI  Oui / Non" --yesno "Redemarrage du RaspBerryPI ?" 10 60) then
	echo "Demarrage en cours ..." ; reboot
	else
	echo "==> vous avez annule"; exit 1
   fi ;;

esac
done
exit 0
