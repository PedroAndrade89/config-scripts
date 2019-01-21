#!/bin/sh

#yum update
yum update -q

# disable selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# install ntp
yum install -y ntp
service ntp start
chkconfig ntpd on

# install git
yum install -y git

#configure git
git config --global user.email="pedromca89@gmail.com" user.name"PedroAndrade89"

#install python-ip
yum install python-ip

#install nginx
yum install -y nginx
/etc/init.d/nginx start

# install uwsgi
yum install -y uwsgi
/etc/init.d/uwsgi start 


cd /var/www/helloWorld

# create git location of flask app
mkdir -p /home/centos/webapps/
mkdir -p /var/www/
cd /home/centos/webapps/

# create repository location and clone flask app repository
git config http.sslVerify false
git init 
git clone https://github.com/PedroAndrade89/helloWorld.git

#show results

ln -s /home/centos/webapps/helloWorld/ /var/www/helloWorld

# install virtualenv
yum install python-virtualenv

cd /var/www/helloWorld

virtualenv venv
. venv/bin/activate
pip install flask gunicorn

gunicorn hello:app







