#!/bin/sh

#yum update
yum update -y 

# disable iptables
service iptables stop

# disable selinux
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# install ntp and gcc
yum install -y ntp
yum install -y gcc
service ntp start
chkconfig ntpd on

# install git
yum install -y git

#configure git
git config --global user.email="pedromca89@gmail.com" user.name"PedroAndrade89"

git config --global http.sslVerify false

#install python-ip
yum install -y python-pip

#install nginx
yum install -y nginx
/etc/init.d/nginx start
chkconfig nginx on

#create nginx conf file for our flask app, nginx will work as a reverse proxy to our app

echo "server {
      	location / {
	    	proxy_pass http://127.0.0.1:8000;
      	}
      }" > /etc/nginx/conf.d/flask_app.conf

file=/etc/nginx/conf.d/default.conf

if [ -f $file ]; then
	rm -f $file
else
   echo "File $file does not exist."
fi


/etc/init.d/nginx restart

# create git location of flask app
mkdir -p /home/centos/webapps/
mkdir -p /var/www/
cd /home/centos/webapps/

# create repository location and clone flask app repository

git init 
git clone https://github.com/PedroAndrade89/helloWorld.git

#show results

ln -s /home/centos/webapps/helloWorld/ /var/www/helloWorld

# install virtualenv
yum install -y python-virtualenv

cd /var/www/helloWorld

virtualenv venv
. venv/bin/activate
pip install flask gunicorn

echo '#!/bin/bash
# helloapp    Init script for helloApp
#
# chkconfig: 345 99 01
# processname: helloapp
# description: Starts and Stops helloapp.

# Source function library.
. /var/www/helloWorld/venv/bin/activate

#Change to helloapp directory
cd /var/www/helloWorld

NAME=helloapp
PIDFILE=/var/run/$NAME.pid
APP_DIRECTORY=/var/www/helloWorld

start() {
        printf "Starting %s...\n" "$NAME"
        cd $APP_DIRECTORY
        PID=`gunicorn --workers=1 hello:app > /dev/null 2>&1 & echo $!`
        if [ -z $PID ]; then
            printf "%s\n" "Fail"
        else
            echo $PID > $PIDFILE
            printf "%s %s\n" "$NAME" "started"
        fi
}

stop(){
        printf "%-50s" "Stopping $NAME"
            PID=`cat $PIDFILE`
            cd $APP_DIRECTORY
        if [ -f $PIDFILE ]; then
            kill -HUP $PID
            printf "%s\n" "Ok"
            rm -f $PIDFILE
        else
            printf "%s\n" "pidfile not found"
        fi
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
    *)
        echo "Usage: helloapp {start|stop|restart}"
 exit 1
        ;;
esac' > /etc/init.d/helloapp

chmod 755 /etc/init.d/helloapp

chkconfig --add helloapp

/etc/init.d/helloapp start


#cd /var/www/helloWorld

#gunicorn hello:app







