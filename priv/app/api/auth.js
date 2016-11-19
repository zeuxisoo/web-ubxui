import BaseApi from './base'

class AuthApi extends BaseApi {

    register(data) {
        return this.agent().post('/auth/register', data)
    }

    login(data) {
        return this.agent().post('/auth/login', data)
    }

    logout() {
        return this.agent().get('/auth/logout')
    }

}

export default new AuthApi()
