ITSMT_VERSION='software2.0.0'
APPLE_ID=1493360317
CORDOVA_APP_FILESIZE="$(stat -c%s 'pgb_response_ios.ipa')"
CORDOVA_APP_MD5CHECKSUM="$(md5sum pgb_response_ios.ipa | cut -f1 -d" ")"


echo "<?xml version=1.0 encoding=UTF-8?>"
echo "<package xmlns=http://apple.com/itunes/importer version=$ITSMT_VERSION>"
echo "    <software_assets apple_id=$APPLE_ID app_platform=ios>"
echo "        <asset type=bundle>"
echo "        	<data_file>"
echo "                <size>$CORDOVA_APP_FILESIZE</size>"
echo "                <file_name>pgb_response_ios.ipa</file_name>"
echo "            	  <checksum type=md5>$CORDOVA_APP_MD5CHECKSUM</checksum>"
echo "          </data_file>"
echo "        </asset>"
echo "    </software_assets>"
echo "</package>"