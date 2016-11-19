import Vue from 'vue'
import VueRouter from 'vue-router'

import App from './views/App.vue'
import Home from './views/Home.vue'
import Login from './views/Login.vue'
import Register from './views/Register.vue'
import Dashboard from './views/Dashboard.vue'

import UserApi from './api/user'
import ErrorHelper from './helpers/error'

Vue.use(VueRouter)

const router = new VueRouter({
    mode  : 'history',
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home
        },
        {
            path: '/login',
            name: 'login',
            component: Login
        },
        {
            path: '/register',
            name: 'register',
            component: Register
        },
        {
            path: '/dashboard',
            name: 'dashboard',
            component: Dashboard
        }
    ],
    scrollBehavior: () => ({
        y: 0
    }),
})

router.beforeEach((to, from, next) => {
    let token = localStorage.getItem('_token')

    if (token != null) {
        UserApi.profile().then(response => {
            next()
        }).catch(error => {
            ErrorHelper.alert('Session timeout, Please login first')

            localStorage.removeItem('_token')

            next({
                name: 'home'
            })
        })
    }else{
        next()
    }
})

const app = new Vue({
  router,
  ...App
}).$mount('#app')
