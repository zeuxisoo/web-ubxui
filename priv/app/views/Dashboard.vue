<template>
    <div id="dashboard">
        <div class="container">
            <h3>Dashboard</h3>
            <hr>
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="event-id" class="col-sm-2 control-label">Event Id</label>
                    <div class="col-sm-7">
                        <input type="email" class="form-control" id="event-id" placeholder="54321" v-model="eventId">
                    </div>
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-default" v-on:click="search()">Search</button>
                        <button type="button" class="btn btn-danger" v-on:click="clear()">Clear</button>
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
                    <tbody v-if="events.length !== 0">
                        <tr v-for="event in events">
                            <td>{{ event.id }}</td>
                            <td>{{ event.name }}</td>
                            <td>{{ event.date }}</td>
                            <td>{{ event.status }}</td>
                        </tr>
                    </tbody>
                    <tbody v-if="events.length === 0">
                        <tr>
                            <td colspan="4">
                                <div class="alert alert-info alert-in-td">
                                    <strong>Tips!</strong>&nbsp;
                                    Please enter the event id to search
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<style>
.alert-in-td {
    margin-bottom: 0px;
}
</style>

<script>
import EventApi from '../api/event'
import ErrorHelper from '../helpers/error'

export default {

    data() {
        return {
            eventId: "",
            events : []
        }
    },

    methods: {
        search() {
            let eventId = this.eventId

            EventApi.search({
                event_id: eventId
            }).then(response => {
                let data = response.data

                if (data.ok === false) {
                    ErrorHelper.alert(data.message)
                }else{
                    this.events = data.events
                }
            }).catch(error => {
            })
        },

        clear() {
            this.events = []
        }
    }

}
</script>
