#!/bin/sh
#
#===================================
# Creation le 29/12/2019
# Par F1PTL Bruno
#===================================
#####################################
# Variables #
#############
Version="1.0"
REP_COURANT=`pwd`
FIC_REF="Fichiers_Ini_Ref"
FIC_REF_TAR="Fichiers_Ini_Ref.tar"
SER_OUTIL="Services_Outils"
SER_OUTIL_TAR="Services_Outils.tar"
#####################################
if [ $(id -u) -ne 0 ]
        then
        echo ""
        echo "==> Lancement avec les droits root"
        exit 1
fi

if (whiptail --title "F1PTL MENU Suppression Users DVSwitch Version ${Version}" --yesno "Renseigner les informations demandees afin de mettre a jour tous les fichers d initialisations. Suppression de l indicatif, ID-DMR..." 8 78); then
    	echo "==> vous avez valider votre choix"
	else
    	echo "==> vous avez annule"; exit 1
fi


INDICATIF=$(whiptail --title "Input" --inputbox "Quel est l indicatif a supprimer ?" 8 60 FXXXX 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi

clear
echo "============================================================="
echo "==> Suppression de ${INDICATIF} sur votre DVSwitch Server <=="
echo "============================================================="
sleep 3
systemctl daemon-reload

echo ""
echo "###################################"
echo "==> Arret des services ${INDICATIF}"
echo "###################################"

sudo systemctl stop md380-emu_${INDICATIF}.service
sudo systemctl stop analog_bridge_${INDICATIF}.service
sudo systemctl stop mmdvm_bridge_${INDICATIF}.service

sudo systemctl disable md380-emu_${INDICATIF}.service
sudo systemctl disable analog_bridge_${INDICATIF}.service
sudo systemctl disable mmdvm_bridge_${INDICATIF}.service

echo ""
echo "#######################################"
echo "==> Recherche des repertoires dans /opt"
echo "#######################################"
sudo find /opt -name "*${INDICATIF}*" -exec rm -rf {} \; > /dev/null 2>&1

echo ""
echo "#########################################################"
echo "==> Recherche des repertoires dans ${REP_COURANT}"
echo "#########################################################"
sudo find ${REP_COURANT} -name "*${INDICATIF}*" -exec rm -rf {} \; > /dev/null 2>&1

echo ""
echo "######################################################"
echo "==> Recherche des repertoires dans /lib/systemd/system"
echo "######################################################"
sudo find /lib/systemd/system -name "*${INDICATIF}*" -exec rm -rf {} \; > /dev/null2>&1


echo ""
echo ""
echo "====================================="
echo " Tous les repertoires sont supprimes "
echo "       Indicatif : ${INDICATIF}      "
echo "====================================="

echo ""
echo "########################################"
echo "==>        Fin d installation        <=="
echo "==> Appuyer sur Enter pour continuer <=="
echo "########################################"
read x
