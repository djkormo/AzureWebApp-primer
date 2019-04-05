# http://www.ubuntugeek.com/stress-ng-tool-to-load-and-stress-your-ubuntu-system.html
apt-get install stress-ng -y

stress-ng --cpu 4 --io 2 --vm 1 --vm-bytes 256M --timeout 60s






#!/bin/bash
while :
do
        echo "Press [CTRL+C] to stop.."
        ab  -t 60 -n 10000000 https://mywebapp2019fordemoauto.azurewebsites.net/
        sleep 1
done


for i in {0..60}; do (curl -Is https://mywebapp2019fordemoauto11375.azurewebsites.net | head -n1 &) 2>/dev/null; sleep 1; done;

