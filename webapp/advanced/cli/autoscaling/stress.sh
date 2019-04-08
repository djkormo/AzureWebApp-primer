# http://www.ubuntugeek.com/stress-ng-tool-to-load-and-stress-your-ubuntu-system.html
apt-get install stress-ng -y

stress-ng --cpu 4 --io 2 --vm 1 --vm-bytes 256M --timeout 60s






#!/bin/bash
while :
do
        echo "Press [CTRL+C] to stop.."
        ab  -t 60 -n 10000000 https://azwebapp-2019-autoscale22825.azurewebsites.net/
        sleep 1
done

# using Curl from Azure Cloud Shell 

for i in {0..600}; do (curl -Is http://azwebapp-2019-slot1832.azurewebsites.net/www/pi.php | head -n1 &) 2>/dev/null; sleep 1; done;

https://azwebapp-2019-autoscale14160.azurewebsites.net/


./letsencrypt-auto --apache -d djkormo.ml -d www.djkormo.ml