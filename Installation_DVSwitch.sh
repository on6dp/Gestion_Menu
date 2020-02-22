#!/bin/sh
#
#===================================
# Creation le 21/02/2020
# Par F1PTL Bruno
# Version 3.15
#===================================
#####################################
# Variables #
#############
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

if (whiptail --title "F1PTL MENU Version 3.14" --yesno "Renseigner les informations demandees afin de mettre a jour tous les fichers d initialisations. Indicatif, ID-DMR, ID-NXDN, port USRP..." 8 78); then
    	echo "==> vous avez valider votre choix"
	else
    	echo "==> vous avez annule"; exit 1
fi


INDICATIF=$(whiptail --title "Input" --inputbox "Quel est ton indicatif ?" 10 60 FXXXX 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi
#
IDDMR7=$(whiptail --title "Input" --inputbox "Quel est ton ID-DMR 7 digits ?" 10 60 208XXXX 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi
#
IDDMR9=$(whiptail --title "Input" --inputbox "Quel est ton ID-DMR 9 digits ? \n (Modifier les 2 derniers digits)" 10 60 ${IDDMR7}01 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi
#
IDNXDN=$(whiptail --title "Input" --inputbox "Quel est ton ID-NXDN ? \n (Pas d ID-NXDN prendre 9999)" 10 60 9999 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi
#
USRP=$(whiptail --title "Input" --inputbox "Quel est le port USRP ? \n (Valeur a positionner dans votre SmartPhone)" 10 60 51234 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi
#
MASTER_IP_BM=$(whiptail --title "Choix du Master DMR" --radiolist \
"Cocher la case qui correspond a votre choix" 15 60 4 \
"213.222.29.197" "BM_Netherlands_2042" OFF \
"217.182.129.131" "BM_France_2082" OFF \
"158.69.203.89" "BM_Canada_3021" OFF \
"213.32.19.95" "HB_Nord" OFF \
"saint-appo.fr" "HB_Loire" OFF \
"151.80.37.99" "HB_Pyr.O" OFF \
"51.178.51.244" "HB_Limouzi" OFF \
"109.15.57.11" "HB_Yvelines" ON 3>&1 1>&2 2>&3)

if [ ${MASTER_IP_BM} = "109.15.57.11" ]; then
	PORT_HB=$(whiptail --title "Choix du Serveur HBlink" --radiolist \
	"Choisir en fonction du port disponible sur le serveur HBlink" 15 60 10 \
	"55570" "DMO70" ON \
	"55571" "DMO71" OFF \
	"55572" "DMO72" OFF \
	"55573" "DMO73" OFF \
	"55574" "DMO74" OFF \
	"55575" "DMO75" OFF \
	"55576" "DMO76" OFF \
	"55577" "DMO77" OFF \
	"55578" "DMO78" OFF \
	"55579" "DMO79" OFF 3>&1 1>&2 2>&3)
fi

if [ ${MASTER_IP_BM} = "51.178.51.244" ]; then
	PORT_HB=$(whiptail --title "Choix du Serveur HBlink" --radiolist \
	"Choisir en fonction du port disponible sur le serveur HBlink" 15 60 10 \
	"55570" "DMO70" ON \
	"55571" "DMO71" OFF \
	"55572" "DMO72" OFF \
	"55573" "DMO73" OFF \
	"55574" "DMO74" OFF \
	"55575" "DMO75" OFF \
	"55576" "DMO76" OFF \
	"55577" "DMO77" OFF \
	"55578" "DMO78" OFF \
	"55579" "DMO79" OFF 3>&1 1>&2 2>&3)
fi

if [ ${MASTER_IP_BM} = "151.80.37.99" ]; then
	PORT_HB=$(whiptail --title "Choix du Serveur HBlink" --radiolist \
	"Choisir en fonction du port disponible sur le serveur HBlink" 15 60 10 \
	"55570" "DMO70" ON \
	"55571" "DMO71" OFF \
	"55572" "DMO72" OFF \
	"55573" "DMO73" OFF \
	"55574" "DMO74" OFF \
	"55575" "DMO75" OFF \
	"55576" "DMO76" OFF \
	"55577" "DMO77" OFF \
	"55578" "DMO78" OFF \
	"55579" "DMO79" OFF 3>&1 1>&2 2>&3)
fi

if [ ${MASTER_IP_BM} = "saint-appo.fr" ]; then
	PORT_HB=$(whiptail --title "Choix du Serveur HBlink" --radiolist \
	"Choisir en fonction du port disponible sur le serveur HBlink" 15 60 10 \
	"55570" "DMO70" ON \
	"55571" "DMO71" OFF \
	"55572" "DMO72" OFF \
	"55573" "DMO73" OFF \
	"55574" "DMO74" OFF \
	"55575" "DMO75" OFF \
	"55576" "DMO76" OFF \
	"55577" "DMO77" OFF \
	"55578" "DMO78" OFF \
	"55579" "DMO79" OFF 3>&1 1>&2 2>&3)
fi

if [ ${MASTER_IP_BM} = "213.32.19.95" ]; then
	PORT_HB=$(whiptail --title "Choix du Serveur HBlink" --radiolist \
	"Choisir en fonction du port disponible sur le serveur HBlink" 15 60 10 \
	"55570" "DMO70" ON \
	"55571" "DMO71" OFF \
	"55572" "DMO72" OFF \
	"55573" "DMO73" OFF \
	"55574" "DMO74" OFF \
	"55575" "DMO75" OFF \
	"55576" "DMO76" OFF \
	"55577" "DMO77" OFF \
	"55578" "DMO78" OFF \
	"55579" "DMO79" OFF 3>&1 1>&2 2>&3)
fi

exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi

for file in ${REP_COURANT}/${FIC_REF}/*
do
  sed -i -e "s/indicatif/${INDICATIF}/g" "$file"
  sed -i -e "s/iddmr7/${IDDMR7}/g" "$file"
  sed -i -e "s/iddmr9/${IDDMR9}/g" "$file"
  sed -i -e "s/idnxdn/${IDNXDN}/g" "$file"
  sed -i -e "s/usrp_port/${USRP}/g" "$file"
  sed -i -e "s/master_ip_bm/${MASTER_IP_BM}/g" "$file"
  if [ ${MASTER_IP_BM} = "109.15.57.11" ]; then
        sed -i -e "s/Port=62031/Port=${PORT_HB}/g" "$file"
        sed -i -e "s/Password=passw0rd/Password=PASSWORD/g" "$file"
  fi
done

mv ${REP_COURANT}/${FIC_REF} ${REP_COURANT}/${FIC_REF}_${INDICATIF}
tar xf ${REP_COURANT}/${FIC_REF_TAR}
sleep 2
mv ${REP_COURANT}/${SER_OUTIL} ${REP_COURANT}/${SER_OUTIL}_${INDICATIF}
tar xf ${REP_COURANT}/${SER_OUTIL_TAR}


clear
echo "=================================================================="
echo "==> Lancement de l installation des composants DVSwitch Server <=="
echo "=================================================================="
sleep 3

if [ ! -d Fichiers_Ini_Ref_${INDICATIF} ]
	then
	echo ""
	echo "==> Le repertoire Fichiers_Ini_Ref_${INDICATIF} n existe pas !"
	exit 1
fi

echo ""
echo "######################################"
echo "==> Creation des repertoires de depots"
echo "######################################"
mkdir -p /depot/G4KLX
echo "mkdir -p /depot/G4KLX"
mkdir -p /depot/DVSwitch
echo "mkdir -p /depot/DVSwitch"

echo ""
echo "##############################"
echo "==> Installation dvswitch-repo"
echo "##############################"
wget http://dvswitch.org/install-dvswitch-repo
chmod +x install-dvswitch-repo
./install-dvswitch-repo

echo ""
echo "######################"
echo "==> APT-GET des outils"
echo "######################"
apt-get update -y
apt-get install git -y
apt-get install curl -y
apt-get install g++ -y
apt-get install make -y
apt-get install jq -y
apt-get install dvswitch -y
apt-get install quantar -y
apt-get install screen -y
apt-get install libwxgtk3.0-dev -y
apt-get install build-essential -y
apt-get install dos2unix -y
apt-get install htop -y
apt-get install python -y

echo ""
echo "#######################"
echo "==> Depot des logiciels"
echo "#######################"
cd /depot/G4KLX
git clone https://github.com/g4klx/P25Clients.git
git clone https://github.com/g4klx/YSFClients.git
git clone https://github.com/g4klx/NXDNClients.git
git clone https://github.com/g4klx/ircDDBGateway.git

cd /depot/DVSwitch
git clone https://github.com/DVSwitch/MMDVM_Bridge.git
git clone https://github.com/DVSwitch/Analog_Bridge.git
git clone https://github.com/DVSwitch/DVSwitch_Base.git
git clone https://github.com/marrold/AMBEServer.git

echo ""
echo "###########################################"
echo "==> Deplacement des logiciels dans /usr/src"
echo "###########################################"
cd /depot/G4KLX/NXDNClients
cp -rf NXDNGateway NXDNParrot /usr/src
echo "cp -rf NXDNGateway NXDNParrot /usr/src"
rm -rf /depot/G4KLX/NXDNClients

cd /depot/G4KLX/P25Clients
cp -rf P25Gateway P25Parrot /usr/src
echo "cp -rf P25Gateway P25Parrot /usr/src"
rm -rf /depot/G4KLX/P25Clients

cd /depot/G4KLX/YSFClients
cp -rf YSFGateway YSFParrot /usr/src
echo "cp -rf YSFGateway YSFParrot /usr/src"
rm -rf /depot/G4KLX/YSFClients

cd /depot/G4KLX
cp -rf ircDDBGateway /usr/src
echo "cp -rf ircDDBGateway /usr/src"
rm -rf /depot/G4KLX/YSFClients

cd /depot/DVSwitch
cp -rf MMDVM_Bridge /usr/src
echo "cp -rf MMDVM_Bridge /usr/src"
rm -rf /depot/DVSwitch/MMDVM_Bridge

cd /depot/DVSwitch
cp -rf Analog_Bridge /usr/src
echo "cp -rf Analog_Bridge /usr/src"
rm -rf /depot/DVSwitch/Analog_Bridge

cd /depot/DVSwitch
cp -rf DVSwitch_Base /usr/src
echo "cp -rf DVSwitch_Base /usr/src"
rm -rf /depot/DVSwitch/DVSwitch_Base

cd /depot/DVSwitch
cp -rf AMBEServer /usr/src
echo "cp -rf AMBEServer /usr/src"
rm -rf /depot/DVSwitch/AMBEServer


echo ""
echo "######################################################"
echo "==> Compilation des logiciels et deplacement dans /opt"
echo "######################################################"
cd /usr/src/NXDNGateway
make clean
make
[ -d /opt/NXDNGateway ] && rm -rf /opt/NXDNGateway
mkdir -p /opt/NXDNGateway
cp NXDNGateway /opt/NXDNGateway
cp -rf Audio /opt/NXDNGateway
cp NXDNGateway.ini /opt

cd /usr/src/NXDNParrot
make clean
make
[ -d /opt/NXDNParrot ] && rm -rf /opt/NXDNParrot
mkdir -p /opt/NXDNParrot
cp NXDNParrot /opt/NXDNParrot

cd /usr/src/P25Gateway
make clean
make
[ -d /opt/P25Gateway ] && rm -rf /opt/P25Gateway
mkdir -p /opt/P25Gateway
cp -rf P25Gateway /opt/P25Gateway
cp -rf Audio /opt/P25Gateway
cp P25Gateway.ini /opt

cd /usr/src/P25Parrot
make clean
make
[ -d /opt/P25Parrot ] && rm -rf /opt/P25Parrot
mkdir -p /opt/P25Parrot
cp -rf P25Parrot /opt/P25Parrot

cd /usr/src/YSFGateway
make clean
make
[ -d /opt/YSFGateway ] && rm -rf /opt/YSFGateway
mkdir -p /opt/YSFGateway
cp -rf YSFGateway /opt/YSFGateway
cp YSFGateway.ini /opt

cd /usr/src/YSFParrot
make clean
make
[ -d /opt/YSFParrot ] && rm -rf /opt/YSFParrot
mkdir -p /opt/YSFParrot
cp -rf YSFParrot /opt/YSFParrot

cd /usr/src/DVSwitch_Base
cp -rf /usr/src/DVSwitch_Base/usr/local/sbin/* /usr/local/sbin 

cd /usr/src/AMBEServer
make 
make install

cd /usr/src/ircDDBGateway
cp -rf $REP_COURANT/${SER_OUTIL}/Makefile_DStar /usr/src/ircDDBGateway/Makefile
make -f Makefile
sleep 2
make -f Makefile install


echo ""
echo "#############################################"
echo "==> Copie des binaires MMDVM et Analog_Bridge"
echo "#############################################"
cd /usr/src/MMDVM_Bridge/bin
PROC=`uname -m`
case ${PROC} in
	armv7l) cp -rf MMDVM_Bridge.armhf ../MMDVM_Bridge
		chmod 755 /usr/src/MMDVM_Bridge/MMDVM_Bridge ;;
			
	x86_64) cp -rf MMDVM_Bridge.amd64 ../MMDVM_Bridge
		chmod 755 /usr/src/MMDVM_Bridge/MMDVM_Bridge ;;
			
	     *) echo "Modele de serveur non pris en charge"
		exit 1 ;;
esac
[ -d /opt/MMDVM_Bridge ] && rm -rf /opt/MMDVM_Bridge
cp -rf /usr/src/MMDVM_Bridge /opt/MMDVM_Bridge
echo "cp -rf /usr/src/MMDVM_Bridge /opt/MMDVM_Bridge"


cd /usr/src/Analog_Bridge/bin
PROC=`uname -m`
case ${PROC} in
	armv7l) cp -rf Analog_Bridge.armhf ../Analog_Bridge
		chmod 755 /usr/src/Analog_Bridge/Analog_Bridge ;;
			
	x86_64) cp -rf Analog_Bridge.amd64 ../Analog_Bridge
		chmod 755 /usr/src/Analog_Bridge/Analog_Bridge ;;
			
	     *) echo "Modele de serveur non pris en charge"
		exit 1 ;;
esac
[ -d /opt/Analog_Bridge ] && rm -rf /opt/Analog_Bridge
cp -rf /usr/src/Analog_Bridge /opt/Analog_Bridge
echo "cp -rf /usr/src/Analog_Bridge /opt/Analog_Bridge"


echo ""
echo "#####################################"
echo "==> Mise en place des services outils"
echo "#####################################"
cp -rf $REP_COURANT/${SER_OUTIL}/*.service /lib/systemd/system
echo "cp -rf $REP_COURANT/${SER_OUTIL}/*.service /lib/systemd/system"
cp -rf $REP_COURANT/${SER_OUTIL}/dvs_*.sh /opt/Analog_Bridge
echo "cp -rf $REP_COURANT/${SER_OUTIL}/dvs_*.sh /opt/Analog_Bridge"
systemctl daemon-reload
cd $REP_COURANT/${SER_OUTIL}
systemctl enable *.service


echo ""
echo "#######################################"
echo "==> Mise en place du repertoire private"
echo "#######################################"
mkdir -p /var/lib/mmdvm/private
cp -rf $REP_COURANT/${SER_OUTIL}/*.txt /var/lib/mmdvm/private
echo "cp -rf $REP_COURANT/${SER_OUTIL}/*.txt /var/lib/mmdvm/private"


echo ""
echo "#######################################"
echo "==> Mise en place du repertoire ramdisk"
echo "#######################################"
mkdir -p /ramdisk
echo "tmpfs	/ramdisk	tmpfs	nodev,nosuid,size=10M	0	0" >> /etc/fstab


echo ""
echo "####################################"
echo "==> Execution des scripts de donnees"
echo "####################################"
cd /usr/local/sbin
for i in *
do
 echo "Execution $i ..."
 ./$i
 echo ""
done


echo ""
echo "###########################################"
echo "==> Copie des fichiers .ini de ${INDICATIF}"
echo "###########################################"
cd $REP_COURANT
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/Analog_Bridge.ini /opt/Analog_Bridge
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/Analog_Bridge.ini /opt/Analog_Bridge"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/dvsm.macro /opt/Analog_Bridge
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/dvsm.macro /opt/Analog_Bridge"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/DVSwitch.ini /opt/MMDVM_Bridge
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/DVSwitch.ini /opt/MMDVM_Bridge"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/MMDVM_Bridge.ini /opt/MMDVM_Bridge
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/MMDVM_Bridge.ini /opt/MMDVM_Bridge"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/NXDNGateway.ini /opt
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/NXDNGateway.ini /opt"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/P25Gateway.ini /opt
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/P25Gateway.ini /opt"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/YSFGateway.ini /opt
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/YSFGateway.ini /opt"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/ircddbgateway /etc
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/ircddbgateway /etc"

echo ""
echo "############################"
echo "==> Mise en place AMBEserver"
echo "############################"
cd $REP_COURANT
cp -rf ./Services_Outils/rc.local_init /etc/rc.local
echo "cp -rf ./Services_Outils/rc.local_init /etc/rc.local"
cp -rf ./Services_Outils/AMBEserver_init /etc/init.d/AMBEserver
echo "cp -rf ./Services_Outils/AMBEserver_init /etc/init.d/AMBEserver"


echo ""
echo ""
echo "=========================================================="
echo "     Tous les logiciels sont installes et configures"
echo "    Suppression du repertoire : install-dvswitch-repo"
echo "=========================================================="
rm -rf $REP_COURANT/install-dvswitch-repo


echo ""
echo "########################################"
echo "==>        Fin d installation        <=="
echo "==> Appuyer sur Enter pour continuer <=="
echo "########################################"
read x
