#!/bin/sh
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
FIC_REF_TAR="Fichiers_Ini_Ref_V1.tar"
HB_DEPOT="HB_Depot"
#####################################
if [ $(id -u) -ne 0 ]
        then
        echo ""
        echo "==> Lancement avec les droits root"
        exit 1
fi

pause ()
{
echo "Appuyer sur ENTER pour continuer .."
read
clear
}


if (whiptail --title "F1PTL HBlink3 Version 1.0" --yesno "     Installation du module HBlink3 et HBMonitor.\n\n      Votre choix pour continuer." 10 60); then
        echo "==> vous avez valider votre choix"
        else
        echo "==> vous avez annule"; exit 1
fi

clear
echo "================================================================="
echo "==> Lancement de l installation des composants HBlink3 Server <=="
echo "================================================================="
sleep 3

echo ""
echo "####################################"
echo "==> Installation du logiciel Python3"
echo "####################################"
apt-get update
apt-get install git -y
apt-get install curl -y
apt-get install g++ -y
apt-get install make -y
apt-get install jq -y
apt-get install screen -y
apt-get install libwxgtk3.0-dev -y
apt-get install build-essential -y
apt-get install dos2unix -y
apt-get install python3-dev -y
apt-get install python3-twisted -y
apt-get install python3-wheel -y
apt-get install python-configparser -y
apt-get install python3 -y
apt-get install python3-pip -y
apt-get install libffi-dev -y
apt-get install libssl-dev -y

echo ""
echo "###############################################################"
echo "==> Telechargement des modules HBlink3, DMR_Utils3 et HBmonitor"
echo "###############################################################"
mkdir -p ${REP_COURANT}/${HB_DEPOT}
cd ${REP_COURANT}/${HB_DEPOT}
sudo git clone https://github.com/n0mjs710/hblink3.git
sudo git clone https://github.com/n0mjs710/dmr_utils3.git
sudo git clone https://github.com/sp2ong/HBmonitor.git

echo ""
echo "#############################################################"
echo "==> Installation des modules HBlink3, DMR_Utils3 et HBmonitor"
echo "#############################################################"
cd ${REP_COURANT}/${HB_DEPOT}/dmr_utils3
./install.sh

cd ${REP_COURANT}/${HB_DEPOT}/hblink3
pip3 install -r requirements.txt
sleep 2
cp -rf hblink-SAMPLE.cfg hblink.cfg
cp -rf rules_SAMPLE.py rules.py

cd ${REP_COURANT}/${HB_DEPOT}/HBmonitor
pip3 install setuptools wheel
pip3 install -r requirements.txt
sleep 2
cp -rf config_SAMPLE.py config.py

echo ""
echo "##############################################"
echo "==> Deplacement HBlink3 et HBmonitor dans /opt"
echo "##############################################"
mv ${REP_COURANT}/${HB_DEPOT}/hblink3 /opt
mv ${REP_COURANT}/${HB_DEPOT}/HBmonitor /opt


echo ""
echo "################################################"
echo "==> Mise en place des fichiers de configurations"
echo "################################################"
cp -rf ${REP_COURANT}/Services_Outils/hblink.cfg_hb /opt/hblink3/hblink.cfg
cp -rf ${REP_COURANT}/Services_Outils/rules.py_hb /opt/hblink3/rules.py
cp -rf ${REP_COURANT}/Services_Outils/config.py_hb /opt/HBmonitor/config.py

echo ""
echo "#######################################"
echo "==> Mise en place des fichiers Services"
echo "#######################################"
cp -rf ${REP_COURANT}/Services_Outils/hblink3.service /lib/systemd/system/hblink3.service
cp -rf ${REP_COURANT}/Services_Outils/hbmonitor.service /lib/systemd/system/hbmonitor.service
systemctl enable *.service
echo "systemctl enable *.service"

echo ""
echo "######################################"
echo "==> Suppression du repertoire de Depot"
echo "######################################"
rm -rf ${REP_COURANT}/${HB_DEPOT}
echo "rm -rf ${REP_COURANT}/${HB_DEPOT}"

echo ""
echo "#######################################"
echo "==>        Fin d installation       <=="
echo "==> Appuyer sur Enter pour continue <=="
echo "#######################################"
read x
