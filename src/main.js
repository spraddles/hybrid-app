
import Vue from 'vue';
import App from './views/main.vue';

import Framework7 from 'framework7/framework7.esm.bundle.js';
import 'framework7/css/framework7.bundle.css';

import F7vue from 'framework7-vue';
//import 'framework7-vue/framework7-vue.bundle.js';


// register component
Vue.component('Framework7', App);

// Init plugin
Framework7.use(F7vue);

// console error logging
console.log(Framework7, F7vue, Vue);

// remove nag
Vue.config.productionTip = false;


// init app
var app = new Vue({
	// vue init
    el: '#app',
    render: h => h(App),
	//router, # for later
	//store, # for later
	
    // cordova init
    methods:{
        init:function() {
            this.status = true;
        }
    },
	// register App Component
	components: {
		app: App,
		Framework7: "f7-app"
	}
})

function onLoad() {
    document.addEventListener("deviceready", onDeviceReady, false);
}

