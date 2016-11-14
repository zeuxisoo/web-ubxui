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
                    <a class="navbar-brand" href="javascript:void(0)">Ubxui</a>
                </div>
                <div class="navbar-collapse collapse navbar-responsive-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li>
                            <a class="hand">
                                Home
                            </a>
                        </li>
                        <li>
                            <a class="hand">
                                Login
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
</style>

<script>
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.css'

export default {

}
</script>
