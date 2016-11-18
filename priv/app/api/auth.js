import axios from 'axios'
import BaseApi from './base'

class AuthApi extends BaseApi {

    register(data) {
        return axios.post(this.api('/auth/register'), data)
    }

    login(data) {
        return axios.post(this.api('/auth/login'), data)
    }

}

export default new AuthApi()
