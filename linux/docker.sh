#!/usr/bin/env bash
echo "------------start---------------------------"
sudo apt update -y
sudo apt upgrade -y
sudo apt-get install -y curl apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "--------------install docker--------------"
sudo apt install -y docker.io
apt-cache policy docker-ce
sudo apt -y install docker-ce
# sudo systemctl status docker
echo "--------------install docker-compose--------------"
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
sudo chmod 666 /var/run/docker.sock
echo "--------------Done--------------"
