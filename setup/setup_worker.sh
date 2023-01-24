#!/bin/bash
echo Installing Docker...
source /vagrant/setup/install_docker.sh

echo Swarm Join...
sudo docker swarm join --token $(cat /vagrant/worker_token) 10.10.10.100:2377