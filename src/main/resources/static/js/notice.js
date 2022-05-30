$(document).ready(function($) {
    $("#notice-patch").click(function () {
        var getNotice = $("#notice").val();
        $.ajax({
            url: "/reservation/notice",
            type: "patch",
            contentType : 'application/json; charset=UTF-8',
            data: JSON.stringify({
                notice: getNotice
            }),
            datatype: "json",
            success: function (data) {
                console.log(data);
                setAlert(data);
            },
            error: function () {
                //
            }
        })
    })

    $("#rule-patch").click(function () {
        var getRule = $("#rule").val();
        $.ajax({
            url: "/reservation/notice",
            type: "patch",
            contentType : 'application/json; charset=UTF-8',
            data: JSON.stringify({
                rule: getRule
            }),
            datatype: "json",
            success: function (data) {
                console.log(data);
                setAlert(data);
            },
            error: function () {
                //
            }
        })
    })

    function setAlert(data) {
        if(data.code === 1000) {
            alert(data.result);
        } else{
            alert(data.message);
        }
    }
});