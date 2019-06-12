#!/bin/sh

PUB_KEY=$1
HOST_LIST=$2
ID_RSA=`cat ~/.ssh/id_rsa.pub` 

set_ssh() {
        while read  line;
	do
                echo "Copying id_rsa pub key to $line authorized_keys..."
                ssh -i $PUB_KEY centos@$line "echo $ID_RSA >> ~/.ssh/authorized_keys" < /dev/null
        done < $HOST_LIST
}


if [[ $# -lt 2 ]]; then
	echo "Missing arguments! Usage : './passwordless_ssh.sh public_key_file hosts_list_file'"
elif [[ $# -gt 2 ]]; then
	echo "Too many  arguments! Usage : './passwordless_ssh.sh public_key_file hosts_list_file'"
else
	set_ssh
fi
