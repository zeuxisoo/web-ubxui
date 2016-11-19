<template>
    <div id="app">
        <div class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <router-link class="navbar-brand" v-bind:to="{ name: 'home' }">Ubxui</router-link>
                </div>
                <div class="navbar-collapse collapse navbar-responsive-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li>
                            <router-link v-bind:to="{ name: 'home' }">
                                Home
                            </router-link>
                        </li>
                        <li v-if="user === null">
                            <router-link v-bind:to="{ name: 'register' }">
                                Register
                            </router-link>
                        </li>
                        <li v-if="user !== null">
                            <router-link v-bind:to="{ name: 'dashboard' }">
                                Dashboard
                            </router-link>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li v-if="user === null">
                            <router-link v-bind:to="{ name: 'login' }">
                                Login
                            </router-link>
                        </li>

                        <li v-if="user !== null">
                            <a href="javascript:void(0)" class="username">{{ user.username }}</a>
                        </li>
                        <li v-if="user !== null">
                            <a v-on:click="logout()" class="hand">
                                Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <transition name="fade" mode="out-in">
            <router-view class="view"></router-view>
        </transition>
    </div>
</template>

<style>
body {
    overflow: hidden;
    margin-top: 60px;
}

.username {
    color: #008800 !important;
}

.hand {
    cursor: pointer;
}
</style>

<script>
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.css'
import 'sweetalert'
import 'sweetalert/dist/sweetalert.css'

import UserApi from '../api/user'
import AuthApi from '../api/auth'
import ErrorHelper from '../helpers/error'

export default {

    data() {
        return {
            user: null
        }
    },

    created() {
        // Callback when login success
        this.$on('login-success', this.loginSuccessHandler)

        // Callback when logout success
        this.$on('logout-success', this.logoutSuccessHandler)

        // Auto login when token is not empty
        if (localStorage.getItem('_token') !== null) {
            this.loginSuccessHandler(localStorage.getItem('_token'))
        }
    },

    methods: {
        loginSuccessHandler(token) {
            localStorage.setItem("_token", token)

            UserApi.profile().then(response => {
                const data = response.data

                if (data.ok === true) {
                    this.user = data.user
                }
            }).catch(error => {
                if (error.response) {
                    const data    = error.response.data
                    const message = data.message

                    ErrorHelper.alert(message)

                    localStorage.removeItem('_token')

                    this.$router.push({
                        name: 'home'
                    })
                }
            })
        },

        logoutSuccessHandler() {
            AuthApi.logout()

            localStorage.removeItem('_token')

            this.user = null
        },

        logout() {
            AuthApi.logout().then(response => {
                localStorage.removeItem('_token')

                this.user = null

                this.$router.push({
                    name: 'home'
                })
            }).catch(error => {
                if (error.response) {
                    const data    = error.response.data
                    const message = data.message

                    ErrorHelper.alert(message)
                }
            })
        }
    }

}
</script>
