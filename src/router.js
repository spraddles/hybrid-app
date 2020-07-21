// example: https://stackoverflow.com/questions/57732203/combining-bootstrap-vue-and-vue-router-inside-navbar-component

import Vue from 'vue';
import VueRouter from 'vue-router';
import store from './store.js'
// import vue pages
import LoginPage from './views/login.vue';
import HomePage from './views/home.vue';
import AboutPage from './views/about.vue';
import PostsPage from './views/posts.vue';
import PostPage from './views/post.vue';
import UserProfile from './views/profile.vue';
import PageNotFound from './views/404.vue';
// init plugins
Vue.use(VueRouter);

// use { name } for named exports
export const router = new VueRouter({
  	mode: 'history',
	routes: [

	    { 
	    	name: "LoginPage",
	    	path: '/login',
	    	component: LoginPage, 
	    	meta: { 
	    		bodyClass: 'login-page' 
	    	}
	    },
	    { 
	    	name: "HomePage",
	    	path: '/home',
	    	component: HomePage, 
	    	meta: { 
	    		bodyClass: 'home-page',
	    		requiresAuth: true 
	    	}
	    },
	    { 
	    	name: "AboutPage",
	    	path: '/about',
	    	component: AboutPage, 
	    	meta: { 
	    		bodyClass: 'about-page',
	    		requiresAuth: true 
	    	}
	    },
	    { 
	    	name: "PostsPage",
	    	path: '/posts',
	    	component: PostsPage, 
	    	meta: { 
	    		bodyClass: 'posts-page',
	    		requiresAuth: true 
	    	}
	    },
	    { 
	    	name: "PostPage",
	    	path: '/posts/:name',
	    	component: PostPage, 
	    	meta: { 
	    		bodyClass: 'post-page',
	    		requiresAuth: true 
	    	}
	    },
	    { 	
	    	name: "UserProfile",
	    	path: '/profile', 
	    	component: UserProfile, 
	    	meta: { 
	    		bodyClass: 'profile-page',
	    		requiresAuth: true 
	    	}
	    },
        { 
        	name: "PageNotFound",
        	path: '*',
        	//redirect: '/',
        	component: PageNotFound,
	    	meta: { 
	    		bodyClass: 'page-not-found',
	    		requiresAuth: true 
	    	}
        }
	]
});

router.beforeEach((to, from, next) => {
  if(to.matched.some(record => record.meta.requiresAuth)) {
    if (store.getters.isLoggedIn) {
      next()
      return
    }
    next('/login') 
  } else {
    next() 
  }
})


