# flask deploy

Ansible script to deploy flask application in centos6 

## Prerequesites

You need to install ansible and have ssh access to the host where app will be deployed:

```
pip install ansible
git clone https://github.com/PedroAndrade89/flask-deploy.git
cd flask-deploy
```

## Deploying the app

Edit the host file in flask-deploy and run:
```
ansible-playbook -u root --inventory-file=hosts helloapp_deploy.yml
```

  
  
