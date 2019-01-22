# flask deploy

Ansible script to deploy flask application in centos6 

### The playbook will:

  - Upgrade all present packages in the system
  - Install packages gcc, ntp, nginx, git, tree, python-pip, python-virtualenv
  - Clone the repo and install Python requirements in a virtualenv
  - Creates upstart script and starts app

## Prerequesites

You need to install ansible and have provided ssh access to the sudo "ssh_user"  where app will be deployed

```
pip install ansible
git clone https://github.com/PedroAndrade89/flask-deploy.git
cd flask-deploy
```

## Deploying the app

Edit the host file in flask-deploy and run:
```
ansible-playbook -u "ssh_user" --inventory-file=hosts helloapp_deploy.yml
```

  
  
