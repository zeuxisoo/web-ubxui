<template>
    <div id="register">
        <div class="container">
            <h3>Register</h3>
            <hr>
            <div class="panel panel-default">
                <div class="panel-heading">Account</div>
                <div class="panel-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">Username</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="username" name="username" placeholder="Username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirm-password" class="col-sm-2 control-label">Confirm Password</label>
                            <div class="col-sm-10">
                                <input type="confirm-password" class="form-control" id="confirm-password" name="confirm_password" placeholder="Confirm Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
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
