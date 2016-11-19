import BaseApi from './base'

class AuthApi extends BaseApi {

    register(data) {
        return this.agent().post('/auth/register', data)
    }

    login(data) {
        return this.agent().post('/auth/login', data)
    }

}

export default new AuthApi()
