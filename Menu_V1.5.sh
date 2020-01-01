#!/bin/bash
#
#===================================
# Creation le 31/12/2019
# Par F1PTL Bruno
#===================================
#####################################
# Variables #
#############
Version="1.5"
REP_COURANT=`pwd`
FIC_REF="Fichiers_Ini_Ref"
#####################################
if [ $(id -u) -ne 0 ]
        then
        echo ""
        echo "==> Lancement avec les droits root"
        exit 1
fi

chmod 755 ./Services_Outils/*

while : ; do
OPTION=$(whiptail --title "F1PTL Gestion_Menu Version ${Version}" --menu " Votre choix ?" 20 50 10 \
1 "Installation DVSwitch Server" \
2 "Modification DVSwitch Server" \
3 "Service DVSwitch Server" \
4 "Log DVSwitch Server" \
5 "Installation Users DVSwitch Server" \
6 "Suppression Users DVSwitch Server" \
7 "Installation HBlink3 et HBmonitor" \
8 "Modification HBlink3 et HBmonitor" \
9 "Service HBlink3 et HBmonitor" \
10 "Redemarrage RaspBerryPi" 3>&1 1>&2 2>&3)
 
exitstatus=$?

if [ $exitstatus != 0 ]; then
    echo "==> vous avez annule"; break;
fi

case $OPTION in
1) ${REP_COURANT}/Installation_DVSwitch_V3.13.sh ;;
2) ${REP_COURANT}/Modification_DVSwitch_V1.0.sh ;;
3) ${REP_COURANT}/Service_DVSwitch_V1.1.sh ;;
4) ${REP_COURANT}/Log_DVSwitch_V1.0.sh ;;
5) ${REP_COURANT}/Installation_Users_DVSwitch.sh ;;
6) ${REP_COURANT}/Suppression_Users_DVSwitch.sh ;;
7) ${REP_COURANT}/Installation_HB_V1.0.sh ;;
8) ${REP_COURANT}/Modification_HB_V1.0.sh ;;
9) ${REP_COURANT}/Service_HBlink3_V1.0.sh ;;
10) if (whiptail --title " Redemarrage RaspBerryPI  Oui / Non" --yesno "Redemarrage du RaspBerryPI ?" 10 60) then
	echo "Demarrage en cours ..." ; reboot
	else
	echo "==> vous avez annule"; exit 1
   fi ;;

esac
done
exit 0
