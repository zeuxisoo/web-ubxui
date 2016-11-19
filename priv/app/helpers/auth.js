import UserApi from '../api/user'
import ErrorHelper from '../helpers/error'

export default {

    requireLogin(to, from, next) {
        let token = localStorage.getItem('_token')

        if (token === null || token === "") {
            ErrorHelper.alert('Please login first')

            next({ name: 'login' })
        }else{
            UserApi.profile().then(response => {
                next()
            }).catch(error => {
                ErrorHelper.alert('Session timeout, Please login first')

                localStorage.removeItem('_token')

                next({ name: 'login' })
            })
        }
    }

}
