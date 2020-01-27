
import Vue from 'vue';
import App from './views/main.vue';

import Framework7 from 'framework7';
import 'framework7/css/framework7.bundle.css';
import 'framework7/js/framework7.bundle.js';

import F7vue from 'framework7-vue';
import 'framework7-vue/framework7-vue.bundle.js';




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
    data: {
        status: false
    },
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

document.addEventListener('deviceready', app.init);



