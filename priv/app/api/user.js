import BaseApi from './base'

class UserApi extends BaseApi {

    profile() {
        return this.agent().get('/user/profile')
    }

}

export default new UserApi()
