#!/bin/bash
echo Installing Docker...
source /vagrant/setup/install_docker.sh

echo Swarm Init...
sudo docker swarm init --listen-addr 10.10.10.100:2377 --advertise-addr 10.10.10.100:2377
sudo docker swarm join-token --quiet worker > /vagrant/worker_token
#sudo docker swarm join-token worker | grep docker > /vagrant/worker_token