import Vue from 'vue';
import Router from 'vue-router';

import LoginPage from '../views/login.vue'

Vue.use(Router);

export const router = new Router({
  mode: 'hash',
  routes: [
    { name: 'login', path: '/login', component: LoginPage, meta: { bodyClass: 'login-page' } },

    // otherwise redirect to home
    { name: 'catchall', path: '*', redirect: '/' }
  ]
});*/

/*
router.beforeResolve((to, from, next) => {
    console.log('beforeResolve: ', to, from);
    return next();
});
*/

/*
router.beforeEach((to, from, next) => {
  // redirect to login page if not logged in and trying to access a restricted page
  const publicPages = ['/login'];
  const authRequired = !publicPages.includes(to.path);
  const loggedIn = localStorage.getItem('user');

  if (authRequired && !loggedIn) {
    return next('/login');
  }

  return next();
})
*/