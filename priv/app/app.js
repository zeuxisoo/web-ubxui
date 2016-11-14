import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './views/App.vue'
import Home from './views/Home.vue'

Vue.use(VueRouter)

const router = new VueRouter({
    mode  : 'history',
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home
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
