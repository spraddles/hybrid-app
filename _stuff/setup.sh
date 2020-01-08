#!/usr/bin/env bash


#******************************
#   INSTALL
#******************************

echo 'Starting install...'


# Yum updates
yum update -y &> /dev/null
echo 'Yum updates done...'


# NPM
yum install -y gcc-c++ make &> /dev/null
curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash - &> /dev/null
sudo yum install -y nodejs &> /dev/null
echo 'NPM installed...'


# Git
yum install git -y &> /dev/null
echo 'Git installed...'


# Cordova
npm install -g cordova &> /dev/null
echo 'Cordova installed...'


# iTSMTransporter
# // TO DO
#(go to TAR dir)
#tar -xvf archive.tar
#(run) sh ./iTMSTransporter_installer_linux_2.0.0.sh -y
#echo 'iTSMTransporter installed...'


# DIR setup
cd / && cd root
APPLICATIONS_BASE_DIR_NAME="applications"
mkdir $APPLICATIONS_BASE_DIR_NAME
APPLICATIONS_BASE_DIR=root"/"$APPLICATIONS_BASE_DIR_NAME
cd / && cd $APPLICATIONS_BASE_DIR
echo 'DIR setup done...'


# clone Git source
APP_DIR_NAME='testapp'
git clone 'https://github.com/badsprad/'$APP_DIR_NAME &> /dev/null
echo 'Git repo cloned...'


# Cordova setup
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME
cordova telemetry off &> /dev/null
CORDOVA_APP_NAME="my_test_app"
CORDOVA_APP_ID="com.testapp.my"
cordova create $CORDOVA_APP_NAME $CORDOVA_APP_ID &> /dev/null
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME"/"$CORDOVA_APP_NAME
cordova platform add ios &> /dev/null
cordova platform add android &> /dev/null
echo 'Cordova setup done...'



#******************************
#   BUILD
#******************************

echo 'Build done...'






#******************************
#   DEPLOY
#******************************


echo 'Deploy done...'


