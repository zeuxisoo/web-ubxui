<template>
    <div id="home">
        <div class="container">
            <div class="jumbotron">
                <h1>Ubxui</h1>
                <p>A web interface for registered user to search related events without open target page</p>
                <p>
                    <router-link class="btn btn-success btn-lg" v-bind:to="{ name: 'login' }">
                        Login
                    </router-link>
                    <router-link class="btn btn-primary btn-lg" v-bind:to="{ name: 'register' }">
                        Register
                    </router-link>
                </p>
            </div>
        </div>
    </div>
</template>

<style>
</style>

<script>
export default {

}
</script>
