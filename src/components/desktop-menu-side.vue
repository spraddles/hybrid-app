<template id="dektop-menu-side">

    <!-- Sidebar  -->
    <nav id="sidebar" class="">
        <b-list-group>
            <b-list-group-item class="list-group-item-logo active"><h3>[ logo here ]</h3></b-list-group-item>
            <b-list-group-item class="list-group-item-empty"></b-list-group-item>
            <b-list-group-item to="/"><b-icon-house></b-icon-house>Home</b-list-group-item>
            <b-list-group-item to="/about"><b-icon-question-circle></b-icon-question-circle>About</b-list-group-item>
            <b-list-group-item to="/profile"><b-icon-person></b-icon-person>Profile</b-list-group-item>
            <b-list-group-item to="/login"><b-icon-box-arrow-in-right></b-icon-box-arrow-in-right>Logout</b-list-group-item>
        </b-list-group>
    </nav>

</template>


<script>

    export default {
        name: 'DesktopMenuSide'
    }

</script>