/* import Vue from 'vue';
import Router from 'vue-router';

import HomePage from '../views/HomePage'
import MenuPage from '../views/MenuPage'
import SearchResults from '../views/SearchResultsPage'
import LoginPage from '../views/LoginPage'
import HelpPage from '../views/Help'
import KnowledgeBasePage from '../views/KnowledgeBase'
import ItrainerPage from '../views/ItrainerPage'
import ItrainerAdminPage from '../views/admin/ItrainerAdminPage'

import IssueReporterPage from '../views/IssueReporterPage'
import TroubleShooterPage from '../views/TroubleShooterPage'
import ComingSoonPage from '../views/ComingSoonPage'
import GlossaryPage from '../views/GlossaryPage'
import SupportdataResultsPage from '../views/SupportdataResultsPage'

import ZohoPage from '../views/ZohoPage'


Vue.use(Router);

export const router = new Router({
  mode: 'hash',
  routes: [
    { name: 'home', path: '/', component: HomePage, meta: { bodyClass: 'sdesk-home' } },
    { name: 'menu', path: '/menu', component: MenuPage, meta: { bodyClass: 'sdesk-menu' } },
    { name: 'submenu', path: '/menu/:section', component: MenuPage, props: true, meta: { bodyClass: 'sdesk-submenu' } },
    { name: 'searchresults', path: '/searchresults', component: SearchResults, meta: { bodyClass: 'sdesk-searchresults' } },
    { name: 'login', path: '/login', component: LoginPage, meta: { bodyClass: 'sdesk-login' } },
    { name: 'help', path: '/help', component: HelpPage, meta: { bodyClass: 'sdesk-help' } },
    { name: 'kb', path: '/kb', component: KnowledgeBasePage, props: true, meta: { bodyClass: 'sdesk-kb' } },
    { name: 'kbcategory', path: '/kb/:category_id', component: KnowledgeBasePage, props: true, meta: { bodyClass: 'sdesk-kbcategory' } },
    { name: 'kbitem', path: '/kb/display/:item_id', component: KnowledgeBasePage, props: true, meta: { bodyClass: 'sdesk-kbitem' } },
    { name: 'kbsearchmore', path: '/kb/search/:q', component: KnowledgeBasePage, props: true, meta: { bodyClass: 'sdesk-kbsearchmore' } },
    { name: 'supportdata_searchmore', path: '/supportdata/search/:q', component: SupportdataResultsPage, props: true, meta: { bodyClass: 'sdesk-supportdata_searchmore' } },
    { name: 'itrainer', path: '/itrainer', component: ItrainerPage, meta: { bodyClass: 'sdesk-itrainer' } },            
    { name: 'itrainer_action', path: '/itrainer/:action/:item_id', component: ItrainerPage, props: true, meta: { bodyClass: 'sdesk-itrainer_item' } },
    { name: 'itrainer_searchmore', path: '/itrainer/search/:q', component: ItrainerPage, props: true, meta: { bodyClass: 'sdesk-itrainer_searchmore' } },
    { name: 'glossary', path: '/glossary', component: GlossaryPage, props: true, meta: { bodyClass: 'sdesk-glossary' } },
    { name: 'glossarysearchmore', path: '/glossary/search/:q', component: GlossaryPage, props: true, meta: { bodyClass: 'sdesk-glossarysearchmore' } },
    { name: 'admin-itrainer', path: '/admin/itrainer', component: ItrainerAdminPage, meta: { bodyClass: 'sdesk-admin-itrainer' } },
    { name: 'admin-itrainer-steps', path: '/admin/itrainer/:action/:step', component: ItrainerAdminPage, meta: { bodyClass: 'sdesk-admin-itrainer-steps' } },    
    { name: 'issuereporter', path: '/issuereporter', component: IssueReporterPage, meta: { bodyClass: 'sdesk-issuereporter' } },
    { name: 'troubleshooter', path: '/troubleshooter', component: TroubleShooterPage, meta: { bodyClass: 'sdesk-troubleshooter' } },
    { name: 'troubleshooter_action', path: '/troubleshooter/:action/:item_id', component: TroubleShooterPage, props: true, meta: { bodyClass: 'sdesk-troubleshooter_item' } },
    { name: 'comingsoon', path: '/comingsoon', component: ComingSoonPage, meta: { bodyClass: 'sdesk-comingsoon' } },

    { name: 'zoho', path: '/zoho', component: ZohoPage, props: true, meta: { bodyClass: 'sdesk-zoho' } },
    { name: 'zohocategory', path: '/zoho/:category_id', component: ZohoPage, props: true, meta: { bodyClass: 'sdesk-zohocategory' } },
    { name: 'zohoitem', path: '/zoho/display/:item_id', component: ZohoPage, props: true, meta: { bodyClass: 'sdesk-zohoitem' } },
    { name: 'zohosearchmore', path: '/zoho/search/:q', component: ZohoPage, props: true, meta: { bodyClass: 'sdesk-zohosearchmore' } },

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
