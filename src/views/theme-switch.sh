#!/usr/bin/env bash
platform=$1
LINE_NO=$(awk '/ios/{print NR}' main.vue)

if [[ -n "$platform" ]] && $LINE_NO=3
then
	sed -i '' -e "3s/md/ios/" main.vue
fi