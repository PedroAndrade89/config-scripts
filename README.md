# config-scripts
Poppulo project

Requirements:

inventory-file should have the following entries:

[webserver]
<server hostname>
  
[webserver:vars]
ansible_ssh_user=root
github_user="git hub username"
app_name="app name as seen in GitHub"

Use "ansible-playbook -u root --inventory-file=/etc/ansible/hosts /path/to/helloapp_deploy.yml" run playbook against a host.

flaskapp_deploy.yml is an ansible runbook to be run against centos6 OS systems, that will deploy a python flask app present in a GitHub repository
  
  
