#!/usr/bin/env bash


#******************************
#   INSTALL
#******************************

clear
echo ' --- INSTALL ---'
echo 'Starting install...'

# RHEL updates
sudo yum update -y &> /dev/null
sudo yum install zip -y &> /dev/null
sudo yum install jq -y &> /dev/null
echo 'Yum updates done...'

# NPM
yum install -y gcc-c++ make &> /dev/null
curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash - &> /dev/null
sudo yum install -y nodejs &> /dev/null
echo 'NodeJS installed...'

# Git
sudo yum install git -y &> /dev/null
echo 'Git installed...'

# Cordova
sudo npm install -g cordova &> /dev/null
echo 'Cordova installed...'

# Phonegap
sudo npm install -g phonegap &> /dev/null
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

# Node file patch
cd / && cd usr/lib/node_modules/phonegap/node_modules/phonegap-build/lib/phonegap-build/create
sudo rm zip.js
curl -O https://raw.githubusercontent.com/phonegap/node-phonegap-build/80e42cb029d133b15026842b10925cab9272ed77/lib/phonegap-build/create/zip.js &> /dev/null
echo 'Node file patched...'


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
CORDOVA_WWW_DIR=$CORDOVA_DIR"/"www
cd / && cd $CORDOVA_WWW_DIR
if [ -d www ]; then
  rm -rf www
fi
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME
cp -rf ./dist/. ."/"$CORDOVA_APP_NAME"/"www"/" &> /dev/null
cp -rf ./_stuff/build.json ."/"$CORDOVA_APP_NAME &> /dev/null
cd / && cd $CORDOVA_DIR
cordova prepare ios
echo 'Cordova prepare done...'

# Phonegap cloud build
echo '1' $PWD
phonegap analytics off &> /dev/null
phonegap remote login --username brett.spradbury@gmail.com --password b_Sprad83 &> /dev/null
phonegap remote run ios > capture_url.txt
PGB_URL="$(grep -E -o '(http[s]?:\/\/)?([^\/\s]+\/)(.*)' capture_url.txt)"
wget --user-agent=Mozilla $PGB_URL --output-document=pgb_response_ios.ipa
echo '2' $PWD
echo 'Phonegap cloud build done...'

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
# capture_url.txt
# certs




#******************************
#   DEPLOY
#******************************

# to each respective app store (iOS / Android)

echo ' --- DEPLOY ---'
echo 'Deploy done...'


