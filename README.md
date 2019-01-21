# config-scripts
Poppulo project

Use "ansible-playbook -u root --inventory-file=/etc/ansible/hosts /path/to/helloapp_deploy.yml" run playbook against a host.

/etc/ansible/hosts should have entry like below:

[webserver2]
<server hostname>
