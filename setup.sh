#!/bin/bash
#安装云监工环境脚本
#脚本适用ubuntu14、debian8

#更新源

sudo apt-get update 

#安装python3.4

sudo apt-get install -y python3.4 python3.4-dev 

#安装pip，确保本脚本和get-pip.py 文件在一个文件夹
BASE_DIR="$( cd "$( dirname "$0"  )" && pwd  )"
sudo chmod +x ${BASE_DIR}/get-pip.py
sudo python3.4 ${BASE_DIR}/get-pip.py

sudo pip3.4 install redis && sudo pip3.4 install requests && sudo pip3.4 install flask && sudo pip3.4 install flask-mail

#安装redis-server
sudo apt-get install -y redis-server 

#添加树莓派开机启动
sudo cp -f crysadm_start /etc/init.d/crysadm_start
sudo chmod 755 /etc/init.d/crysadm_start
sudo update-rc.d crysadm_start defaults

#运行云监工

sudo chmod +x ${BASE_DIR}/run.sh && sudo chmod +x ${BASE_DIR}/down.sh  
sudo sh ${BASE_DIR}/run.sh

#sudo python3.4 ${BASE_DIR}/crysadm/crysadm/crysadm_helper.py &
#sudo python3.4 ${BASE_DIR}/crysadm/crysadm/crysadm.py &

