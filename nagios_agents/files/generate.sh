#!/bin/bash
## Purpose: Generate Nagios Configuration
mkdir -p /home/ubuntu/devops/agents/
cat  /home/ubuntu/devops/servers/clients.csv | while read LINE
do
    HostIP=`echo $LINE | cut -d, -f1`
    HostName=`echo $LINE | cut -d, -f2`
    sed -e "s/XXXX/$HostName/g; s/ZZZZ/$HostIP/g" /home/ubuntu/devops/servers/template.cfg > /home/ubuntu/devops/agents/$HostIP.cfg
done

cp /home/ubuntu/devops/agents/$HostIP.cfg /usr/local/nagios/etc/servers/ 