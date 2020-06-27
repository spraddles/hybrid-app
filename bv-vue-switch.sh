#!/usr/bin/env node

mustache ./_tmp/mustache/bv-mustache.json ./src/main_js.mustache > ./src/main.js

for file in src/views/*.mustache
do
	for ((i = 0; i < 3; i++))
	do
		mustache ./_tmp/mustache/bv-mustache.json ./src/views/app.mustache > ./src/views/app.vue
	    mustache ./_tmp/mustache/bv-mustache.json ./src/views/home.mustache > ./src/views/home.vue
	    mustache ./_tmp/mustache/bv-mustache.json ./src/views/about.mustache > ./src/views/about.vue
	    mustache ./_tmp/mustache/bv-mustache.json ./src/views/profile.mustache > ./src/views/profile.vue
	    mustache ./_tmp/mustache/bv-mustache.json ./src/views/login.mustache > ./src/views/login.vue
	    mustache ./_tmp/mustache/bv-mustache.json ./src/views/404.mustache > ./src/views/404.vue
	done
done