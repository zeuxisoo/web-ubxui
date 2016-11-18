<template>
    <div id="login">
        <div class="container">
            <h3>Login</h3>
            <hr>
            <div class="panel panel-default">
                <div class="panel-heading">Account</div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">Username</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="username" name="username" placeholder="Username" v-model="username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" v-model="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="button" class="btn btn-default" v-on:click="signIn()">Sign in</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style>

</style>

<script>
import ErrorHelper from '../helpers/error'
import AuthApi from '../api/auth'

export default {

    data() {
        return {
            username: "",
            password: "",
        }
    },

    methods: {
        signIn() {
            let username = this.username
            let password = this.password

            if (username == "") {
                ErrorHelper.alert("Please enter username")
            }else if (password == "") {
                ErrorHelper.alert("Please enter password")
            }else{
                var self = this

                AuthApi.login({
                    username: username,
                    password: password
                }).then(response => {
                    const data   = response.data

                    if (data.ok === false) {
                        const errors = data.errors
                        const error  = ErrorHelper.firstError(errors)

                        ErrorHelper.alert(error)
                    }else{
                        self.$router.push({
                            name: 'dashboard'
                        })
                    }
                })
            }
        }
    }

}
</script>
