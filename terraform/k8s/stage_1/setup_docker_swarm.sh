#!/bin/bash

# update
yum update -y

# uninstall old docker versions
yum remove -y docker \
              docker-client \
              docker-client-latest \
              docker-common \
              docker-latest \
              docker-latest-logrotate \
              docker-logrotate \
              docker-engine

# install utils
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# add docker repository
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# install docker ce
yum -y install docker-ce

# start docker and enable it
systemctl start docker && sudo systemctl enable docker

# add cloud_user to the docker group:
usermod -aG docker cloud_user

# test the docker installation:
docker --version

# init docker swarm
docker swarm init \
    --advertise-addr 172.31.21.195 # private ip

# join swarm
docker swarm join \
    --token SWMTKN-1-0c6zbluholb5vpmerv5wi50d5aavbyj73eo29gzhq72030bi7u-6qcn5ncsr84u9s4159wa22d1o 172.31.21.195:2377 # [Token] [PrivateIP]

# check docker swarm cluster status
docker node ls

# install terraform
curl -O https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
yum install -y unzip
unzip terraform_0.11.13_linux_amd64.zip -d /usr/local/bin/

terraform version