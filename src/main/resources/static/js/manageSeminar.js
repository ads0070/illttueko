$(document).ready(function($) {
    $.ajax({
        url: "/seminar",
        type: "get",
        contentType : 'charset=UTF-8',
        success: function (data) {
        },
        error: function () {
            //
        }
    })
});