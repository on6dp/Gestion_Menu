#!/bin/sh
#
#
#
sudo systemctl stop mmdvm_bridge_hblink.service
sudo systemctl start mmdvm_bridge.service
sleep 2
/opt/Analog_Bridge/dvswitch.sh message "Transfert HBlink vers BM"
