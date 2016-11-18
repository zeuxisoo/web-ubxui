export default {

    alert(message) {
        swal("Oops..", message, "error");
    },

    success(message) {
        swal("Good!", message, "success");
    },

    firstError(errors) {
        for(let name in errors) {
            return `The ${name} ${errors[name].pop()}`
        }
    }

}
