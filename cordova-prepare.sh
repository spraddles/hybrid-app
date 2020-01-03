#!/usr/bin/env bash

# remove Cordova temp dir:
DIR_ROOT="./my_test_app"
DIR="./$DIR_ROOT/www"
if [ -d "$DIR" ]; then
  # Take action if $DIR exists
  rm -r $DIR
  echo "Removed Cordova compiled files"
fi

# replace with Vue compiled files:
cp -r ./dist/. $DIR

# copy build.json to Cordova dir
cp ./src/helpers/build.json $DIR_ROOT

# echo
echo Copied over build Vue compiled files
echo Copied over build.json config for iOS builds
echo Done...ready for Cordova build!!