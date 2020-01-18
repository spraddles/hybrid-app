#!/usr/bin/env bash


#******************************
#   INSTALL
#******************************

clear
echo ' --- INSTALL ---'
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

# Phonegap
npm install -g phonegap &> /dev/null
echo 'Phonegap installed...'

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
tar -xvf archive.tar &> /dev/null
sh iTMSTransporter_installer_linux_2.0.0.sh --target itms --noexec &> /dev/null
rm -f iTMSTransporter_installer_linux_2.0.0.sh &> /dev/null
cd itms
sed -e '15,43d' -i install_script.sh &> /dev/null
yes | sh ./install_script.sh &> /dev/null
echo 'iTSMTransporter installed...'



#******************************
#   CONFIG
#******************************

echo ' --- CONFIG ---'

# Cordova config
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME
cordova telemetry off &> /dev/null
CORDOVA_APP_NAME="my_test_app"
CORDOVA_APP_ID="com.testapp.my"
cordova create $CORDOVA_APP_NAME $CORDOVA_APP_ID &> /dev/null
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME"/"$CORDOVA_APP_NAME
cordova platform add ios &> /dev/null
cordova platform add android &> /dev/null
echo 'Cordova config done...'

# NPM config
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME
npm install &> /dev/null
npm audit fix &> /dev/null
echo 'NPM config done...'



#******************************
#   BUILD
#******************************

echo ' --- BUILD ---'

# Vue build
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME
npm run webpack-build &> /dev/null
echo 'Vue build done...'

# Cordova prepare
CORDOVA_DIR=$APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME"/"$CORDOVA_APP_NAME
echo '1' $PWD
CORDOVA_WWW_DIR=$CORDOVA_DIR"/"www
echo '2' $PWD
cd / && cd $CORDOVA_WWW_DIR
if [ -d www ]; then
  rm -rf www
fi
echo '3' $PWD
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME
echo '4' $PWD
cp -rf ./dist/. ."/"$CORDOVA_APP_NAME"/"www"/" &> /dev/null
echo '5' $PWD
cp -rf ./_stuff/build.json ."/"$CORDOVA_APP_NAME &> /dev/null
echo '6' $PWD
echo 'Cordova prepare done...'
echo '7' $PWD

# Phonegap build
phonegap remote login --username brett.spradbury@gmail.com --password b_Sprad83 &> /dev/null
phonegap remote run ios > capture.txt &> /dev/null
PGB_URL="$(grep -E -o '(http[s]?:\/\/)?([^\/\s]+\/)(.*)' capture.txt)"
wget --user-agent=Mozilla $PGB_URL --output-document=pgb_response_ios.ipa &> /dev/null

#### now we have IPA file! continue to ITSMT









#******************************
#   CLEANUP
#******************************

echo ' --- CLEAN UP ---'
echo 'Clean up done...'

# LOGOUT OF SESSIONS:
# phonegap remote logout

# FILES TO REMOVE:
# setup.sh
# capture.txt
# certs




#******************************
#   DEPLOY
#******************************

# to each respective app store (iOS / Android)

echo ' --- DEPLOY ---'
echo 'Deploy done...'


