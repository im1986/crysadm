#!/bin/bash
#安装云监工环境脚本
#脚本适用ubuntu14、debian8

#更新源

apt-get update 

#安装python3.4

apt-get install -y python3.4 python3.4-dev 

#安装pip，确保本脚本和get-pip.py 文件在一个文件夹
BASE_DIR="$( cd "$( dirname "$0"  )" && pwd  )"
chmod +x ${BASE_DIR}/get-pip.py
python3.4 ${BASE_DIR}/get-pip.py

pip3.4 install redis && pip3.4 install requests && pip3.4 install flask && pip3.4 install flask-mail

#安装redis-server
apt-get install -y redis-server 

#添加树莓派开机启动
cp -f crysadm_start /etc/init.d/crysadm_start
chmod 755 /etc/init.d/crysadm_start
update-rc.d crysadm_start defaults

#运行云监工

chmod +x ${BASE_DIR}/run.sh && chmod +x ${BASE_DIR}/down.sh  
sh ${BASE_DIR}/run.sh

#python3.4 ${BASE_DIR}/crysadm/crysadm/crysadm_helper.py &
#python3.4 ${BASE_DIR}/crysadm/crysadm/crysadm.py &

