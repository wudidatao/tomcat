#!/bin/bash

yum install wget -y
wget http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.tar.gz
tar zxvf apache-tomcat-9.0.16.tar.gz
mv apache-tomcat-9.0.16 /usr/local/

#开机启动文件
echo "[Unit]
Description=Tomcat
After=syslog.target network.target remote-fs.target nss-lookup.target

[Service]
Type=oneshot
ExecStart=/usr/local/apache-tomcat-9.0.16/bin/startup.sh
ExecStop=/usr/local/apache-tomcat-9.0.16/bin/shutdown.sh
ExecReload=/bin/kill -s HUP $MAINPID
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
" > /usr/lib/systemd/system/tomcat.service

systemctl start tomcat.service
#systemctl stop tomcat.service
systemctl enable tomcat.service
