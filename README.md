# flask deploy

Ansible playbook to deploy flask application in centos6.X and centos7.X with nginx action as a reverse proxy.

According to the Nginx documentation, a reverse proxy can be used to provide load balancing, provide web acceleration through caching or compressing inbound and outbound data, and provide an extra layer of security by intercepting requests headed for back-end servers.

Gunicorn is designed to be an application server that sits behind a reverse proxy server that handles load balancing, caching, and preventing direct access to internal resources.

By exposing Gunicorn's synchronous workers directly to the internet, a DOS attack could be performed by creating a load that trickles data to the servers, like the Slowloris.

Included there is also another ansible playbook that deploys docker in a centos6/7.X system, creates 2 containers runnning the flask application and sets a nginx LB at the system level to balance the load between the 2 containerized instances

Additionally a container running prometheus is added that will monitor the request count and latency of requests to our flask application

### The playbook will:

Install docker in the remote machine, followed by deploying 2 docker containers running the flask application, along with a nginx LB acting as load balancer between the 2. Another docker container is deployed, running prometheus that monitors the requests from the flask application.


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

## Testing

```
curl -i -X GET "http://<webserver hostname>/hello"
curl -i -X GET "http://<LB hostname>/hello"
```


