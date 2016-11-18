import axios from 'axios'
import BaseApi from './base'

class AuthApi extends BaseApi {

    register(data) {
        return axios.post(this.api('/auth/register'), data)
    }

}

export default new AuthApi()
