<template>
    <div id="dashboard">
        <div class="container">
            <h3>Dashboard</h3>
            <hr>
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="event-id" class="col-sm-2 control-label">Event Id</label>
                    <div class="col-sm-8">
                        <input type="email" class="form-control" id="event-id" placeholder="54321" v-model="eventId">
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-default" v-on:click="search()">Search</button>
                    </div>
                </div>
            </div>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Date</th>
                            <th>State</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<style>

</style>

<script>
import EventApi from '../api/event'

export default {

    data() {
        return {
            eventId: ""
        }
    },

    methods: {
        search() {
            let eventId = this.eventId

            EventApi.search({
                event_id: eventId
            }).then(response => {

            }).catch(error => {

            })
        }
    }

}
</script>
