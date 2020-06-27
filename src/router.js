// example: https://stackoverflow.com/questions/57732203/combining-bootstrap-vue-and-vue-router-inside-navbar-component

import Vue from 'vue';
import VueRouter from 'vue-router';
// import vue pages
import LoginPage from './views/login.vue';
import HomePage from './views/home.vue';
import AboutPage from './views/about.vue';
import UserProfile from './views/profile.vue';
import PageNotFound from './views/404.vue';
// init plugins
Vue.use(VueRouter);

// use { name } for named exports
export const router = new VueRouter({
//export default new Router({
  	mode: 'history',
	routes: [
	    { name: "LoginPage",
	    path: '/login',
	    component: LoginPage, 
	    meta: { bodyClass: 'login-page' }},

	    { name: "HomePage",
	    path: '/', 
	    component: HomePage, 
	    meta: { bodyClass: 'home-page' }},

	    { name: "AboutPage",
	    path: '/about', 
	    component: AboutPage, 
	    meta: { bodyClass: 'about-page' }},

	    { name: "UserProfile",
	    path: '/profile', 
	    component: UserProfile, 
	    meta: { bodyClass: 'profile-page' }},

	    // add "page not found" component & route:
	    // https://code-maze.com/vuejs-routing-navigation/

        { name: "PageNotFound",
        path: '*', 
        //redirect: '/',
        component: PageNotFound, 
        meta: { bodyClass: '404-not-found' }}
	]
});