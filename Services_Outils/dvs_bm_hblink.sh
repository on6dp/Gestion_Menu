#!/bin/sh
#
#
#
sudo systemctl stop mmdvm_bridge.service
sudo systemctl start mmdvm_bridge_hblink.service
sleep 2
/opt/Analog_Bridge/dvswitch.sh message "Transfert BM vers HBlink"
