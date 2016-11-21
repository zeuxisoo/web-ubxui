import BaseApi from './base'

class EventApi extends BaseApi {

    search(params) {
        return this.agent().get("/event/search", {
            params: params
        })
    }

}

export default new EventApi
