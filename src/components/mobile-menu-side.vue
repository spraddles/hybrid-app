<template id="mobile-menu-side">

    <!-- Left Panel 
    Example: https://jsfiddle.net/nolimits4web/jcwzqovz/ 
    -->

    <f7-panel left reveal theme-dark>
        <f7-view id="menu-side">
            <f7-page>
                <f7-navbar title="Menu"></f7-navbar>
                <f7-list>
                    <f7-list-item link="/" title="Home" view=".view-main" data-panel="left" panel-toggle></f7-list-item>
                    <f7-list-item link="/about" title="About" view=".view-main" data-panel="left" panel-toggle></f7-list-item>
                    <f7-list-item link="/login" title="Login" view=".view-main" data-panel="left" panel-toggle></f7-list-item>
                    <f7-list-item link="/profile" title="Profile" view=".view-main" data-panel="left" panel-toggle></f7-list-item>
                </f7-list>
            </f7-page>
        </f7-view>
    </f7-panel>

</template>

<script>

    import {
        f7Panel,
        f7View,
        f7Page,
        f7Navbar,
        f7Block,
        f7BlockTitle,
        f7List,
        f7ListItem,
        f7Link
    } from 'framework7-vue';

    export default {

        name: 'MobileMenuSide',

        components: {
            f7Panel,
            f7View,
            f7Page,
            f7Navbar,
            f7Block,
            f7BlockTitle,
            f7List,
            f7ListItem,
            f7Link
        }
    }

</script>
