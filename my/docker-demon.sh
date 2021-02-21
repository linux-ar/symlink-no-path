#!/bin/bash

sudo docker ps
sudo chown $USER /var/run/docker.sock
sudo usermod -a -G docker $USER



sudo chown $USER /etc/docker

sudo echo "{" > /etc/docker/daemon.json
sudo echo "    \"data-root\": \"/mnt/docker-data\"," > /etc/docker/daemon.json
sudo echo "    \"storage-driver\": \"overlay2\"" > /etc/docker/daemon.json
sudo echo "}" > /etc/docker/daemon.json

sudo mkdir -p /etc/systemd/system/docker.service.d

sudo systemctl start docker
sudo service docker start
