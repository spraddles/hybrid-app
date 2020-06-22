<template id="mobile-menu-bottom">

    <!-- Bottom Menu
    Example: https://jsfiddle.net/2f87p02q/
    -->

    <f7-toolbar tabbar labels bottom class="mobile-menu-bottom">

        <f7-link href="/" icon-f7="house_alt" text="Home"></f7-link>
        <f7-link href="/about" icon-f7="photo" text="About"></f7-link>
        <f7-link href="/login" icon-f7="arrow_right_circle" text="Login"></f7-link>
        <f7-link href="/profile" icon-f7="person" text="Profile"></f7-link>

    </f7-toolbar>

</template>

<script>

    import {
        f7Link,
        f7Toolbar,
        f7Block,
        f7Icon,
    } from 'framework7-vue';

    export default {

        name: 'MobileMenuBottom',

        components: {
            f7Link,
            f7Toolbar,
            f7Block,
            f7Icon,
        }
    };

</script>

<style scoped type="text/css">
    .toolbar-bottom {
        position: fixed;
    }
    .mobile-menu-bottom a.link {
        font-size: 11px;
    }
</style>
