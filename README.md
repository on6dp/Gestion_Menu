# Gestion_Menu 1.7
Menus d'installations DVSwitch Server et HBlink3 pour RaspBerry PI3 et 4.

Possibilite de connexion a un serveur HBlink avec 5 ports de com disponibles pour le DVSwitch.
Ajout Multi Users maximum 6 pour un bon fonctionnement du RaspBerry PI. Autorisation DMR et C4FM (YSF) pour le Multi Users.

Prendre la documentation qui se trouve dans la repository "Documentations"

Se connecter avec les droits "root".

Se positionner dans le repertoire cd /home/pi

$ sudo apt install git -y

$ sudo git clone url.....

$cd Gestion_Menu

$sudo chmod 755 *.sh

$ sudo ./Menu_V1.7.sh

Dans un premier temps on lance l'installation du DVSwitch Server.

Si vous avez besoin de mettre en place un 2eme indicatif, prendre "Installation Users DVSwitch Server".

Extraction du tableau de N4IRS developpeur Analog et MMDVM_Bridge sur la compatibilité des binaires en fonction des architectures 
processeurs. utilisation de la commande : uname -a  ou  dpkg --print-architecture

==================================================================
binaire amd64 --- 64 bit Intel/AMD --- 3.16.0-4-amd64 #1 x86_64

binaire arm64 --- 64 bit ARM --- 5.3.0-1014-raspi2 aarch64 aarch64 aarch64

binaire armhf --- RPi2/3 --- 4.9.35-v7+ armv7l

binaire armv6l --- RPi 1/Zero --- 4.14.98+ armv6l

binaire i386 --- 32bit Intel/AMD --- 4.9.0-11-686-pae i686
==================================================================

73's
Bruno
