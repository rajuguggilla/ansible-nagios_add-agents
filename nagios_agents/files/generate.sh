#!/bin/bash
## Purpose: Generate Nagios Configuration
src_dir=$HOME/devops
dest_dir=/usr/local/nagios/etc/servers

if [[ ! -e $src_dir/agents ]]; then 
   mkdir -p $src_dir/agents
else
   echo "directory already exists..!"
fi

####
if [[ ! -e $dest_dir ]]; then
   mkdir -p $dest_dir
else
   echo "$dest_dir already exists..!"
fi
 
chown -R nagios:nagios $src_dir/agents/

cat $src_dir/files/clients.csv | while read -r LINE
do
    HostIP=`echo $LINE | cut -d, -f1`
    HostName=`echo $LINE | cut -d, -f2`
    sed -e "s/XXXX/$HostName/g; s/ZZZZ/$HostIP/g" $src_dir/files/template.cfg > $src_dir/agents/$HostIP.cfg

    src_cfg=$src_dir/agents/$HostIP.cfg

    cp $src_cfg $dest_dir/$HostIP.cfg
done
