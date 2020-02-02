#!/usr/bin/env bash

ITSMT_VERSION='5.4'
APPLE_ID=1493360317
APPLE_BUNDLE_IDENTIFIER='com.testapp.domain'
CORDOVA_APP_FILESIZE="$(stat -c%s './myapp.itmsp/pgb_response_ios.ipa')"
CORDOVA_APP_MD5CHECKSUM="$(md5sum ./myapp.itmsp/pgb_response_ios.ipa | cut -f1 -d" ")"
ITMSP_FILEPATH='./myapp.itmsp/metadata.xml'

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > $ITMSP_FILEPATH
echo "<package xmlns=\"http://apple.com/itunes/importer\" version=\"software$ITSMT_VERSION\">" >> $ITMSP_FILEPATH
echo "  <software_assets apple_id=\"$APPLE_ID\"" app_platform=\"ios\"" bundle_short_version_string=\"1.0\"" bundle_version=\"1.0\"" bundle_identifier=\"$APPLE_BUNDLE_IDENTIFIER\">" >> $ITMSP_FILEPATH
echo "   <asset type=\"bundle\">" >> $ITMSP_FILEPATH
echo "    <data_file>" >> $ITMSP_FILEPATH
echo "     <size>$CORDOVA_APP_FILESIZE</size>" >> $ITMSP_FILEPATH
echo "     <file_name>pgb_response_ios.ipa</file_name>" >> $ITMSP_FILEPATH
echo "     <checksum type=\"md5\">$CORDOVA_APP_MD5CHECKSUM</checksum>" >> $ITMSP_FILEPATH
echo "    </data_file>" >> $ITMSP_FILEPATH
echo "   </asset>" >> $ITMSP_FILEPATH
echo "  </software_assets>" >> $ITMSP_FILEPATH
echo "</package>" >> $ITMSP_FILEPATH