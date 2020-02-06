#!/usr/bin/env bash



#/******************************
#   SECRETS:
#/******************************

# Phonegap -SDK login [in args string command]
# Phonegap -auth token
# iTSMT -login [in args string command]
# iTSMT -provider [TPTVYTBHA6]
# iTSMT -apple ID in meta-info.sh file
# iTSMT -apiIssuer
# iTSMT -apiKey
# Make github repo private









START_TIME=$SECONDS

#/******************************
#   INSTALL
#/******************************

clear
echo ''
echo ' --- INSTALL ---'
echo 'Starting install...'

# System updates
#..............................
sudo yum update -y &> /dev/null
sudo yum install java-11-openjdk-devel -y &> /dev/null
sudo yum install zip -y &> /dev/null
sudo yum install jq -y &> /dev/null
sudo yum install wget -y &> /dev/null
sudo yum install unzip -y &> /dev/null
sudo yum install libimobiledevice -y &> /dev/null
echo 'Yum updates done...'

# NodeJS
#..............................
yum install -y gcc-c++ make &> /dev/null
curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash - &> /dev/null
sudo yum install -y nodejs &> /dev/null
echo 'NodeJS installed...'

# Git
#..............................
sudo yum install git -y &> /dev/null
echo 'Git installed...'

# Cordova
#..............................
sudo npm install -g cordova &> /dev/null
echo 'Cordova installed...'

# Phonegap
#..............................
sudo npm install -g phonegap &> /dev/null
echo 'Phonegap installed...'

# DIR setup
#..............................
cd / && cd root
APPLICATIONS_BASE_DIR_NAME="applications"
mkdir $APPLICATIONS_BASE_DIR_NAME
APPLICATIONS_BASE_DIR=root"/"$APPLICATIONS_BASE_DIR_NAME
cd / && cd $APPLICATIONS_BASE_DIR
echo 'DIR setup done...'

# clone Git source
#..............................
APP_DIR_NAME='testapp'
git clone 'https://github.com/badsprad/'$APP_DIR_NAME &> /dev/null
echo 'Git repo cloned...'

# iTSMTransporter
#..............................
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME"/"_tmp"/"ios"/"ITMST
sh iTMSTransporter_installer_linux_2.0.0.sh --target itms --noexec &> /dev/null
cd itms
# iTSMT workaround:
# ref: https://github.com/fastlane/fastlane/pull/11268
# ref: https://askubuntu.com/questions/338857/automatically-enter-input-in-command-line
# note: ITSMT auto updates upon running, no matter what current version is
sudo sed -e '15,43d' -i install_script.sh &> /dev/null
yes | sh install_script.sh &> /dev/null
echo 'iTSMTransporter installed...'

## Need to cleanup ITSMT files, already in '/usr/local/itms/bin' not needed in '/testapp/' etc





#/******************************
#   CONFIG
#/******************************

echo ''
echo ' --- CONFIG ---'

# Cordova config
#..............................
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME
cordova telemetry off &> /dev/null
CORDOVA_APP_NAME="cordova"
CORDOVA_APP_ID="com.testapp.my"
cordova create $CORDOVA_APP_NAME $CORDOVA_APP_ID &> /dev/null
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME"/"$CORDOVA_APP_NAME
cordova platform add ios &> /dev/null
cordova platform add android &> /dev/null
echo 'Cordova config done...'

# NPM config
#..............................
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME
npm install &> /dev/null
npm audit fix &> /dev/null
echo 'NPM config done...'

# Node file patch
#..............................
# fix zip upload issue
cd / && cd usr/lib/node_modules/phonegap/node_modules/phonegap-build/lib/phonegap-build/create
sudo rm zip.js
curl -O https://raw.githubusercontent.com/phonegap/node-phonegap-build/80e42cb029d133b15026842b10925cab9272ed77/lib/phonegap-build/create/zip.js &> /dev/null
echo 'Node file patched...'

# ITMS $PATH fix:
#..............................
cd / && cd usr/local/itms/bin
export PATH=$PATH:/usr/local/itms/bin
echo 'ITMS path fix done...'

# ITMS keyfile
#..............................
cd / && cd root
mkdir private_keys
IOS_KEYFILE='AuthKey_9CZ7Y9885P.p8'
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME"/"_tmp"/"ios
cp $IOS_KEYFILE $HOME/private_keys/$IOS_KEYFILE
echo 'ITMS keyfile copied...'


#/******************************
#   BUILD
#/******************************

echo ''
echo ' --- BUILD ---'

# Vue build
#..............................
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME
npm run webpack-build &> /dev/null
echo 'Vue build done...'

# Cordova prepare
#..............................
# copy DIST output from Vue to Cordova
CORDOVA_DIR=$APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME"/"$CORDOVA_APP_NAME
CORDOVA_WWW_DIR=$CORDOVA_DIR"/"www
cd / && cd $CORDOVA_WWW_DIR
if [ -d www ]; then
  rm -rf www
fi
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME
cp -rf ./dist/. ."/"$CORDOVA_APP_NAME"/"www"/" &> /dev/null
cp -rf ./_tmp/cordova/build.json ."/"$CORDOVA_APP_NAME &> /dev/null
cd / && cd $CORDOVA_DIR
cordova prepare ios
echo 'Cordova prepare done...'

# Phonegap cloud build
#..............................
phonegap analytics off &> /dev/null
phonegap remote login --username brett.spradbury@gmail.com --password b_Sprad83 &> /dev/null
# check if an app exists, if so remove
CORDOVA_TOKEN=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdXRoIiwiaXNzIjoicGdiIiwianRpIjoiNGFmODlhNjctNzBmNC00ZjJmLTkxNjgtMTQ0ZDFiZTQyMmJiIn0.PO1cFMwAYV49CaYxkT5y9khJ1DExvGg1EYHRupA80L0
CORDOVA_APP_ID="$(curl https://build.phonegap.com/api/v1/apps?auth_token=$CORDOVA_TOKEN 2>/dev/null | jq -r '.apps[].id')"
if [[ $CORDOVA_APP_ID > 0 ]]
then 
    # fix ref: https://github.com/phonegap/phonegap-cli/issues/122
    rm -f root/applications/testapp/$CORDOVA_APP_NAME/.cordova/config.json
    curl -X DELETE https://build.phonegap.com/api/v1/apps/$CORDOVA_APP_ID?auth_token=$CORDOVA_TOKEN &> /dev/null
fi
# download iTunes IPA file
phonegap remote run ios > capture_url.txt
PGB_URL="$(grep -E -o '(http[s]?:\/\/)?([^\/\s]+\/)(.*)' capture_url.txt)"
wget --user-agent=Mozilla $PGB_URL --output-document=pgb_response_ios.ipa &> /dev/null
#### now we have IPA file! continue to ITSMT

echo 'Phonegap cloud build done...'









#/******************************
#   PREPARE
#/******************************

echo ''
echo ' --- PREPARE ---'

# create .itmsp folder
ITMSP_DIR_NAME='myapp.itmsp'
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME"/"_tmp"/"ios
mkdir $ITMSP_DIR_NAME
echo '.itmsp folder create done...'

# move IPA into .itmsp folder
cd / && cd $CORDOVA_DIR
cp ./pgb_response_ios.ipa ../_tmp/ios/$ITMSP_DIR_NAME &> /dev/null

# generate XML meta file
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME"/"_tmp"/"ios
sh meta-generate.sh &> /dev/null
echo 'XML meta file generated...'

# get PLIST file
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME"/"_tmp"/"ios"/"$ITMSP_DIR_NAME
unzip pgb_response_ios.ipa -d ./unzipped &> /dev/null
cd unzipped && cd Payload
PHONEGAP_APP_NAME='HelloCordova.app'
cd $PHONEGAP_APP_NAME
cp ./Info.plist "/"$APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME"/"_tmp"/"ios"/"$ITMSP_DIR_NAME &> /dev/null
cd / && cd $APPLICATIONS_BASE_DIR"/"$APP_DIR_NAME"/"_tmp"/"ios"/"$ITMSP_DIR_NAME
mv Info.plist AppStoreInfo.plist &> /dev/null
rm -rf unzipped &> /dev/null

# convert PLIST file to XML
plistutil -i AppStoreInfo.plist -o AppStoreInfo.xml
rm -f AppStoreInfo.plist
mv AppStoreInfo.xml AppStoreInfo.plist
echo 'PLIST file extracted & converted to XML...'

# ITMST check:
ITMST_API_ISSUER='69a6de96-b5e0-47e3-e053-5b8c7c11a4d1'
ITMST_API_KEY='9CZ7Y9885P'
iTMSTransporter -m verify -apiIssuer $ITMST_API_ISSUER -apiKey $ITMST_API_KEY -v eXtreme -f myapp.itmsp -assetDescription myapp.itmsp/AppStoreInfo.plist










#/******************************
#   BACKUP
#/******************************


# iOS files
# Android files
# Web app files
# create a backup DIR for all of these
# document a restore process





echo ''
echo ' --- BACKUP ---'








#/******************************
#   DEPLOY
#/******************************

# to each respective app store (iOS / Android)



# upload .itmsp to iTunes





echo ''
echo ' --- DEPLOY ---'





echo 'Deploy done...'
















#/******************************
#   CLEANUP
#/******************************

echo ''
echo ' --- CLEAN UP ---'
echo 'Clean up done...'

# LOGOUT OF SESSIONS:
# phonegap remote logout

# FILES TO REMOVE:
# _tmp DIR and arhive.tar
# setup.sh
# capture_url.txt
# pgb_response_ios.ipa
# iTSMT install files (_tmp/itsm/)
# pgb_response_ios.ipa (2 places: my_test_app + _tmp/ios/.itmsp)
# certs
# unzipped > payload > (to get the PLIST file)


echo ''
echo ' --- SUMMARY ---'
ELAPSED_TIME=$(($SECONDS - $START_TIME))
echo 'Script duration:' "$(($ELAPSED_TIME/60)) min $(($ELAPSED_TIME%60)) sec"





