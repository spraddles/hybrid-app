#!/usr/bin/env bash


#******************************
#   INSTALL
#******************************

# OS dependencies
npm
cordova
git
iTSMTransporter


# initials

###### cmd > /dev/null #### hide output, show errors, show echo
# show STDERR, hide STDOUT, show ECHO

sudo -i
yum update
cd /
cd root
mkdir my_app
cd my_app


# NPM
yum install -y gcc-c++ make &> /dev/null
curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash - &> /dev/null
sudo yum install -y nodejs &> /dev/null
echo 'NPM installed'


# Git
yum install git -y &> /dev/null
git clone https://github.com/badsprad/testapp &> /dev/null
echo 'Git installed'


# Cordova
npm install -g cordova &> /dev/null
echo 'Cordova installed'



#******************************
#   CONFIG
#******************************

cordova telemetry off &> /dev/null
cordova create my_test_app com.testapp.my &> /dev/null
cd my_test_app
cordova platform add ios &> /dev/null
cordova platform add android &> /dev/null





# App dependencies








