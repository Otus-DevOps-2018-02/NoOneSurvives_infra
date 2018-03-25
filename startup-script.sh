#!/bin/bash
#Install mongodb-org
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod
echo "Mongodb installation complete"
#Install ruby + bundler
sleep 3
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
ruby -v && bundler -v
echo "Ruby and bundler installation complete"
#Deploy app
sleep 3
cd /home/appuser && git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
ps aux | grep puma
echo "Check yours app in http://url:port"
curl -I 127.0.0.1:9292
