#!/usr/bin/env bash
if grep ios | head -n 3 main.vue
then
	sed -i '' -e "3s/LICK/LUCKY/" .../src/views/main.vue
	echo 'found IOS'
else
	echo 'not found (IOS)'
fi