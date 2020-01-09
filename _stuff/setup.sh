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


# iTSMTransporter install
# ref: https://github.com/fastlane/fastlane/pull/11268
# ref: https://askubuntu.com/questions/338857/automatically-enter-input-in-command-line
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME"/"_stuff
tar -xvf archive.tar
sh iTMSTransporter_installer_linux_2.0.0.sh --target itms --noexec
rm -f iTMSTransporter_installer_linux_2.0.0.sh
cd itms
sed -e '15,43d' -i install_script.sh
yes | sh ./install_script.sh
echo 'iTSMTransporter installed...'



#******************************
#   CONFIG
#******************************


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


# NPM setup
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME
npm install
npm audit fix



#******************************
#   BUILD
#******************************

cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME
npm run webpack-build
#chmod +x ./cordova-prepare.sh
#sh ./cordova-prepare.sh

echo 'Build done...'






#******************************
#   DEPLOY
#******************************


echo 'Deploy done...'


