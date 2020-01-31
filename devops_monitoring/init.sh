#!/bin/bash

 sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
 sudo apt-key fingerprint 0EBFCD88
 sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
 sudo apt-get install docker-ce

 sudo usermod -aG docker vagrant

 curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
 sudo chmod +x nodesource_setup.sh
 sudo ./nodesource_setup.sh
 sudo apt-get install nodejs
 sudo apt-get install build-essential

 sudo apt-get install git -y
 git clone https://github.com/linuxacademy/content-devops-monitoring-app.git forethought

 cd forethought
 docker build -t forethought .
