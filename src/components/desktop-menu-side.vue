<template id="dektop-menu-side">

    <!-- Sidebar  -->
    <nav id="sidebar" class="">
        <b-list-group>

            <b-list-group-item class="list-group-item-logo active"><h3>[ logo here ]</h3></b-list-group-item>

            <b-list-group-item class="list-group-item-empty"></b-list-group-item>

            <b-list-group-item to="/home"><b-icon-house></b-icon-house>Home</b-list-group-item>

            <b-list-group-item to="/about"><b-icon-question-circle></b-icon-question-circle>About</b-list-group-item>

            <b-list-group-item to="/posts"><b-icon-puzzle></b-icon-puzzle>Posts</b-list-group-item>

            <b-list-group-item to="/profile"><b-icon-person></b-icon-person>Profile</b-list-group-item>

            <b-list-group-item to="/#" @click="logout" class="list-group-item list-group-item-action"><b-icon-box-arrow-in-right ></b-icon-box-arrow-in-right>Logout</b-list-group-item>

        </b-list-group>
    </nav>

</template>










<script>

    import store from '../store.js';

    export default {
        
        name: 'DesktopMenuSide',
        
        computed: {},
        
        methods: {
            logout: function() {
                this.$store.dispatch('logout')
                    .then(() => {
                        this.$router.push('/login')
                    })
            }
        },
        
        created: function() {
            this.$http.interceptors.response.use(undefined, function(err) {
                return new Promise(function(resolve, reject) {
                    if (err.status === 401 && err.config && !err.config.__isRetryRequest) {
                        this.$store.dispatch(logout)
                    }
                    throw err;
                });
            });
        }
    }

</script>