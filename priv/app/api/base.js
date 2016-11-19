import axios from 'axios'

export default class BaseApi {

    agent() {
        let token = localStorage.getItem('_token')

        axios.defaults.baseURL = '/api'
        axios.defaults.headers.common['Authorization'] = `bearer ${token}`

        return axios
    }

}
