#!/usr/bin/env bash


# OS dependencies
npm
cordova
git
iTSMTransporter


# initials
sudo -i
cd /
cd root
mkdir my_app
cd my_app


# NPM
yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash -
sudo yum install -y nodejs
echo 'NPM installed'

# Cordova-cli
npm install cordova -y



# App dependencies
