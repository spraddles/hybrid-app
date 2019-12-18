#!/usr/bin/env bash

# remove Cordova temp dir:
DIR="./my_test_app/www"
if [ -d "$DIR" ]; then
  # Take action if $DIR exists. #
  rm -r ./my_test_app/www
  echo "Removed Cordova compiled files"
fi

# replace with Vue compiled files:
cp -r ./dist/. ./my_test_app/www

echo Copied over build Vue compiled files... ready for Cordova build!!