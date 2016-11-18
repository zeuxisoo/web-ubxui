import Vue from 'vue'
import VueRouter from 'vue-router'

import App from './views/App.vue'
import Home from './views/Home.vue'
import Login from './views/Login.vue'
import Register from './views/Register.vue'
import Dashboard from './views/Dashboard.vue'

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

const app = new Vue({
  router,
  ...App
}).$mount('#app')
