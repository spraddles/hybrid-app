#!/usr/bin/env bash

# remove Cordova temp dir:
DIR="./MY_TEST_APP/www"
if [ -d "$DIR" ]; then
  # Take action if $DIR exists
  rm -r $DIR
  echo "Removed Cordova compiled files"
fi

# replace with Vue compiled files:
cp -r ./dist/. $DIR

echo Copied over build Vue compiled files... ready for Cordova build!!