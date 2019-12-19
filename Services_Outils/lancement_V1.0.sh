#!/bin/sh
#
# Version 1.0
#
echo "####################################"
echo "==> Execution des scripts de donnees"
echo "####################################"
cd /usr/local/sbin
for i in *.sh
do
 echo "Execution $i ..."
 ./$i
 echo ""
done
