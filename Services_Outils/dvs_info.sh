#!/bin/sh
#
#
#
dvsw="/opt/MMDVM_Bridge/dvswitch.sh"

mode=`$dvsw mode`
tune=`$dvsw tune`

$dvsw message "Connexion $mode $tune"
