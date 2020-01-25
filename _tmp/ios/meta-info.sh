fileSize=` stat -f %z <Your .ipa file>`
md5Checksum=`md5 <Your .ipa file>  | cut -d "=" -f 2 | awk '{print $1}'`

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > <path to your .itmsp folder>/metadata.xml
echo "<package xmlns=\"http://apple.com/itunes/importer\" version=\"software2.0.0\">" >> <path to your .itmsp folder>/metadata.xml
echo "    <software_assets apple_id=\"<Your Apple ID>\" app_platform=\"ios\">" >> <path to your .itmsp folder>/metadata.xml
echo "        <asset type=\"bundle\">" >> <path to your .itmsp folder>/metadata.xml 
echo "        	<data_file>" >> metadata.xml
echo "                <size>$fileSize</size>" >> <path to your .itmsp folder>/metadata.xml 
echo "                <file_name>nap.ipa</file_name>" >> <path to your .itmsp folder>/metadata.xml 
echo "            	  <checksum type=\"md5\">$md5Checksum</checksum>" >> <path to your .itmsp folder>/metadata.xml
echo "          </data_file>" >> <path to your .itmsp folder>/metadata.xml 
echo "        </asset>" >> <path to your .itmsp folder>/metadata.xml
echo "    </software_assets>" >> <path to your .itmsp folder>/metadata.xml 
echo "</package>" >> <path to your .itmsp folder>/metadata.xml