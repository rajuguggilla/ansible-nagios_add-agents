## Deploying Nagios Agents (.cfg) files on the nagios server using Ansible

nagios_agents
------------

This is an ansible role, which consists of ansible role directory structure and files. 

nagios_agents/files/clients.csv 
-----------------------
consists of the ipaddress and hostname of the ec2 instances which need to be added in the creation of .cfg files. 
and these values are seperated by comma (,) . 

nagios_agents/files/generate.sh
------------------------------------------
this script will be executed on the nagios server, and read the contents from clients.csv file

nagios_agents/files/template.cfg
------------------------------------
this is a common template, which will be deployed on the nagios server

execute this ansible role
-------------------------
ansible-playbook nagios-add-host.yml --private-key=path of pem file -u=remote user
