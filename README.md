# config-scripts
Poppulo project

Requirements:

inventory-file should have structure as seen in hosts file

Use "ansible-playbook -u root --inventory-file=/etc/ansible/hosts /path/to/helloapp_deploy.yml" run playbook against a host.

flaskapp_deploy.yml is an ansible runbook to be run against centos6 OS systems, that will deploy a python flask app present in a GitHub repository
  
  
