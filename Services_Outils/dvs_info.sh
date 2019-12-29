#!/bin/sh
#
#
#
dvsw="/opt/Analog_Bridge/dvswitch.sh"

mode=`$dvsw mode`
tune=`$dvsw tune`

$dvsw message "Connexion $mode $tune"
