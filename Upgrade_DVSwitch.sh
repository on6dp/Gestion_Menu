#!/bin/sh
#
#===================================
# Creation le 15/05/2020
# Par F1PTL Bruno
# Version 2.0
#===================================
#####################################
# Variables #
#############
REP_COURANT=`pwd`
DATE=`date +%Y%m%d_%H:%M:%S`
Version="2.0"
#####################################
if [ $(id -u) -ne 0 ]
        then
        echo ""
        echo "==> Lancement avec les droits root"
        exit 1
fi
if (whiptail --title "F1PTL UPGRADE Version ${Version}" --yesno "Mise a jour des logiciels : \n/opt/Analog_Bridge \n/opt/MMDVM_Bridge.\n\nSauvegarde et copie : \nLes nouveaux fichiers Macros ..." 13 55); then
    	echo "==> vous avez valider votre choix"
	else
    	echo "==> vous avez annule"; exit 1
fi

clear
echo "========================================================================"
echo "==> Lancement de la mise a jour des logiciels Analog et MMDVM_Bridge <=="
echo "========================================================================"
sleep 3

echo ""
echo "######################################"
echo "==> Creation des repertoires de depots"
echo "######################################"
mkdir -p /depot/DVSwitch
echo "mkdir -p /depot/DVSwitch"

echo ""
echo "#######################"
echo "==> Depot des logiciels"
echo "#######################"
cd /depot/DVSwitch
git clone https://github.com/DVSwitch/MMDVM_Bridge.git
git clone https://github.com/DVSwitch/Analog_Bridge.git

echo ""
echo "###########################################"
echo "==> Deplacement des logiciels dans /usr/src"
echo "###########################################"
cd /depot/DVSwitch
cp -rf MMDVM_Bridge /usr/src
echo "cp -rf MMDVM_Bridge /usr/src"
rm -rf /depot/DVSwitch/MMDVM_Bridge

cd /depot/DVSwitch
cp -rf Analog_Bridge /usr/src
echo "cp -rf Analog_Bridge /usr/src"
rm -rf /depot/DVSwitch/Analog_Bridge

echo ""
echo "#############################################"
echo "==> Arret des services Analog et MMDVM_Bridge"
echo "#############################################"
sudo systemctl stop analog_bridge.service
echo "sudo systemctl stop analog_bridge.service"
sleep 1
sudo systemctl stop mmdvm_bridge.service
echo "sudo systemctl stop mmdvm_bridge.service"
sleep 1

echo ""
echo "##################################################"
echo "==> Sauvegarde des fichiers Analog et MMDVM_Bridge"
echo "##################################################"
mkdir -p /usr/src/svg
cp -rf /opt/Analog_Bridge /usr/src/svg/Analog_Bridge_${DATE}
echo "cp -rf /opt/Analog_Bridge /usr/src/svg/Analog_Bridge_${DATE}"
cp -rf /opt/MMDVM_Bridge /usr/src/svg/MMDVM_Bridge_${DATE}
echo "cp -rf /opt/MMDVM_Bridge /usr/src/svg/MMDVM_Bridge_${DATE}"

echo ""
echo "#############################################"
echo "==> Copie des binaires MMDVM et Analog_Bridge"
echo "#############################################"
cd /usr/src/MMDVM_Bridge/bin
PROC=`uname -m`
case ${PROC} in
        aarch64) cp -rf MMDVM_Bridge.arm64 ../MMDVM_Bridge
                 chmod 755 /usr/src/MMDVM_Bridge/MMDVM_Bridge ;;

	armv7l) cp -rf MMDVM_Bridge.armhf ../MMDVM_Bridge
		chmod 755 /usr/src/MMDVM_Bridge/MMDVM_Bridge ;;
			
	x86_64) cp -rf MMDVM_Bridge.amd64 ../MMDVM_Bridge
		chmod 755 /usr/src/MMDVM_Bridge/MMDVM_Bridge ;;
			
	     *) echo "Modele de serveur non pris en charge"
		exit 1 ;;
esac
cp -rf /usr/src/MMDVM_Bridge/MMDVM_Bridge /opt/MMDVM_Bridge
echo "cp -rf /usr/src/MMDVM_Bridge/MMDVM_Bridge /opt/MMDVM_Bridge"
cp -rf /usr/src/MMDVM_Bridge/dvswitch.sh /opt/MMDVM_Bridge
echo "cp -rf /usr/src/MMDVM_Bridge/dvswitch.sh /opt/MMDVM_Bridge"

cd /usr/src/Analog_Bridge/bin
PROC=`uname -m`
case ${PROC} in
        aarch64) cp -rf Analog_Bridge.arm64 ../Analog_Bridge
                chmod 755 /usr/src/Analog_Bridge/Analog_Bridge ;;

	armv7l) cp -rf Analog_Bridge.armhf ../Analog_Bridge
		chmod 755 /usr/src/Analog_Bridge/Analog_Bridge ;;
			
	x86_64) cp -rf Analog_Bridge.amd64 ../Analog_Bridge
		chmod 755 /usr/src/Analog_Bridge/Analog_Bridge ;;
			
	     *) echo "Modele de serveur non pris en charge"
		exit 1 ;;
esac
cp -rf /usr/src/Analog_Bridge/Analog_Bridge /opt/Analog_Bridge
echo "cp -rf /usr/src/Analog_Bridge/Analog_Bridge /opt/Analog_Bridge"

echo ""
echo "######################################"
echo "==> Deplacement du fichier dvswitch.sh"
echo "######################################"
cp -rf /usr/src/MMDVM_Bridge/dvswitch.sh /opt/Analog_Bridge
echo "cp -rf /usr/src/MMDVM_Bridge/dvswitch.sh /opt/Analog_Bridge"


echo ""
echo "##################################"
echo "==> Sauvegarde des fichiers macros"
echo "##########i#######################"
cd $REP_COURANT
cp -rf /opt/Analog_Bridge/dvsm.macro /opt/Analog_Bridge/dvsm.macro_${DATE}
echo "Sauvegarde dvsm.macro ..."
echo""
cd /opt/Analog_Bridge
for i in *.txt
do
 echo "Sauvegarde ${i} ..."
 cp -rf /opt/Analog_Bridge/${i} /opt/Analog_Bridge/${i}_${DATE}
 sleep 1
 echo ""
done


echo ""
echo "#############################"
echo "==> Copie des fichiers macros"
echo "##########i##################"
cd $REP_COURANT
cp -rf ./Fichiers_Ini_Ref/dvsm.macro /opt/Analog_Bridge
echo "cp -rf ./Fichiers_Ini_Ref/dvsm.macro /opt/Analog_Bridge"
cp -rf ./Fichiers_Ini_Ref/*.txt /opt/Analog_Bridge
echo "cp -rf ./Fichiers_Ini_Ref/*.txt /opt/Analog_Bridge"


echo ""
echo "#################################################"
echo "==> Demarrage des services Analog et MMDVM_Bridge"
echo "#################################################"
sudo systemctl start analog_bridge.service
echo "sudo systemctl start analog_bridge.service"
sleep 1
sudo systemctl start mmdvm_bridge.service
echo "sudo systemctl start mmdvm_bridge.service"
sleep 1

echo ""
echo ""
echo "==========================================================="
echo " Fin d upgrade des logiciels Analog_Bridge et MMDVM_Bridge"
echo "==========================================================="


echo ""
echo "#####################"
echo "==> Fin d upgrade <=="
echo "#####################"

