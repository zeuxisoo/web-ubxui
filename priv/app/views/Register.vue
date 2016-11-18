<template>
    <div id="register">
        <div class="container">
            <h3>Register</h3>
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
                            <label for="email" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="email" name="email" placeholder="Email" v-model="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" v-model="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password-confirmation" class="col-sm-2 control-label">Confirm Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password-confirmation" name="confirm_password" placeholder="Confirm Password" v-model="passwordConfirmation">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="button" class="btn btn-default" v-on:click="submit()">Submit</button>
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
import AuthApi from '../api/auth'
import ErrorHelper from '../helpers/error'

export default {

    data() {
        return {
            username            : "",
            email               : "",
            password            : "",
            passwordConfirmation: ""
        }
    },

    methods: {
        submit() {
            let username             = this.username
            let email                = this.email
            let password             = this.password
            let passwordConfirmation = this.passwordConfirmation

            if (username == "") {
                ErrorHelper.alert("Please enter username")
            }else if (email == "") {
                ErrorHelper.alert("Please enter email")
            }else if (password == "") {
                ErrorHelper.alert("Please enter password")
            }else if (password != passwordConfirmation) {
                ErrorHelper.alert("Password does not match confirm password")
            }else{
                var self = this

                AuthApi.register({
                    username             : username,
                    email                : email,
                    password             : password,
                    password_confirmation: passwordConfirmation
                }).then(response => {
                    const data   = response.data

                    if (data.ok === false) {
                        const errors = data.errors
                        const error  = ErrorHelper.firstError(errors)

                        ErrorHelper.alert(error)
                    }else{
                        self.$router.push({
                            name: 'login'
                        })

                        ErrorHelper.success("Account created")
                    }
                })
            }
        }
    }

}
</script>
