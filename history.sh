#!/bin/bash

# elevate
sudo su

# install all required dependencies
apt-get install npm git libcurl3 openssl -y

# clone repo
git clone https://github.com/OWASP/NodeGoat.git
cd NodeGoat/

# install Mongo DB
# if it's debian based
if [ "$(lsb_release -is)" = $'Debian' ]
then
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
    echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/4.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
    wget https://fastdl.mongodb.org/src/mongodb-src-r4.0.10.tar.gz
    tar -zxvf mongodb-src-r4.0.10.tar.gz 
    cd mongodb-src-r4.0.10

elif [ "$(lsb_release -d)" = $'Description:\tUbuntu 16.04' ]
then
    # if it's ubuntu 16.04
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

elif [ "$(lsb_release -d)" = $'Description:\tUbuntu 18.04' ]
then
    # if it's ubuntu 18.04
    echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

else
    echo huh?

fi

echo next

apt-get update
apt-get install -y mongodb-org

echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

npm install
npm install grunt-cli -g 

# pwd

# change export PATH to the output of pwd
# export PATH=/home/vagrant/NodeGoat/mongodb-src-r4.0.10/bin:$PATH

# start mongodb service
# sudo service mongod start

# check if mongo started and is listening
# cat /var/log/mongodb/mongod.log 
# nano config/env/development.js 


# cat config/env/development.js 

# reset db to default settings
# grunt db-reset:development

# start site
# npm start