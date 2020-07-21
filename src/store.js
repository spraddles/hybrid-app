// example from:
// https://scotch.io/tutorials/handling-authentication-in-vue-using-vuex

import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

export default new Vuex.Store({

	// STATE is the library or types of things you want to store, these are all objects

	state: {
  		status: '',
  		token: localStorage.getItem('token') || '',
  		user : {},
		posts: {},
		post: {},
		authors: {}
	},

	// MUTATIONS are how you can change a state, to mutate (or change) a state you need to 'commit'
	// e.g. store.commit('something')
	// 'commit' a mutation

	mutations: {

		// auth
		auth_request(state){
	    	state.status = 'loading'
	  	},
	  	auth_success(state, token, user){
		    state.status = 'success'
		    state.token = token
		    state.user = user
	  	},
	  	auth_error(state){
	    	state.status = 'error'
	  	},
	  	logout(state){
	    	state.status = ''
	    	state.token = '' 	// clear token
	    	state.posts = '' 	// clear posts
	    	state.post = '' 	// clear post
	    	state.authors = '' 	// clear authors

	  	},

		// posts
		store_posts(state, posts) {
			state.posts = posts
		},
		store_post(state, post) {
			state.post = post
		},
		store_post_authors(state, authors) {
			state.authors = authors
		}

	},

	// ACTIONS:
	// 'dispatch' an action
	// are similar to mutations, the differences being that:
	// * actions are triggered with the store.dispatch method
	// * actions trigger the mutations
	// * instead of mutating the state, actions commit mutations
	// * actions can contain arbitrary asynchronous operations

	actions: {

	  	login({commit}, user){
	        return new Promise((resolve, reject) => {
	            commit('auth_request')
	            axios({url: 'http://localhost:8888/wp-json/jwt-auth/v1/token', data: user, method: 'POST' })
	            .then(resp => {
	                const token = resp.data.token
	                const user = resp.data.user
	                localStorage.setItem('token', token)
	                axios.defaults.headers.common['Authorization'] = token
	                commit('auth_success', token, user)
	                resolve(resp)
	            })
	            .catch(err => {
	                commit('auth_error')
	                localStorage.removeItem('token')
	                reject(err)
	                console.log(err);
	            })
	        })
	    },

	    /*register({commit}, user){
	    	return new Promise((resolve, reject) => {
	            commit('auth_request')
	            axios({url: 'http://localhost:3000/register', data: user, method: 'POST' })
	            .then(resp => {
	                const token = resp.data.token
	                const user = resp.data.user
	                localStorage.setItem('token', token)
	                // Add the following line:
	                axios.defaults.headers.common['Authorization'] = token
	                commit('auth_success', token, user)
	                resolve(resp)
	            })
	            .catch(err => {
	                commit('auth_error', err)
	                localStorage.removeItem('token')
	                reject(err)
	                console.log(err)
	            })
	        })
	    },*/

	    get_posts({commit}){
	    	return new Promise((resolve, reject) => {
	    		axios.get('http://localhost:8888/wp-json/wp/v2/posts')	    		
	    		.then(resp => {
	                const posts = resp.data.posts
	                localStorage.setItem('posts', posts)
	                commit('store_posts', resp.data)
	                resolve(resp)
	                //console.log(resp.data);
	    		})
	    		.catch(err => {
	    			console.log(err)
	    		})
		    })
	  	},

		get_one_post({ commit }, qs){
			return new Promise((resolve, reject) => {
				axios.get('http://localhost:8888/wp-json/wp/v2/posts/'+qs.id)
	    		.then(resp => {
	                const post = resp.data.post
	                localStorage.setItem('post', post)
	                commit('store_post', resp.data)
	                resolve(resp)
	                //console.log(resp.data);
	    		})
	    		.catch(err => {
	    			console.log(err)
	    		})
			})
		},

		get_post_authors({ commit }){
			return new Promise((resolve, reject) => {
				axios.get('http://localhost:8888/wp-json/wp/v2/users')
	    		.then(resp => {
	                const post = resp.data.post
	                localStorage.setItem('post', post)
	                commit('store_post_authors', resp.data)
	                resolve(resp)
	                //console.log(resp.data);
	    		})
	    		.catch(err => {
	    			console.log(err)
	    		})
			})
		},

	  	logout({commit}){
		    return new Promise((resolve, reject) => {
		      	commit('logout')
		      	localStorage.removeItem('token')
		      	localStorage.removeItem('posts')
		      	delete axios.defaults.headers.common['Authorization']
		      	resolve()
		    })
	  	}
	},

	// GETTERS allow you to access the store directly

	getters : {
 		isLoggedIn: state => !!state.token
	}


})
