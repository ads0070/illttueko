var rsvData;
let map = new Map();
var clickNum = 0;

$(document).ready(function($) {
    var today = new Date();
    var todayFormat = today.getFullYear() + "-" + (("00"+(today.getMonth()+1).toString()).slice(-2)) + "-" + (("00"+today.getDate().toString()).slice(-2));
    document.getElementById('startDatetime').value = todayFormat;

    var token = document.cookie;

    ajaxRsvData(todayFormat, document.getElementById("classNo").innerText);

    $("#rsv-time tr").click(function (){
        var tr = $(this);

        if(tr.css("background-color") === "rgb(211, 211, 211)") {
            alert(" 이미 예약된 좌석입니다.");
        }
        else if(tr.css("background-color") === "rgb(144, 238, 144)"){
            tr.css("background-color", "#ffffff");
        }else{
            tr.css("background-color", "#90ee90");
        }
    });

    var isClicked = false;

    $(".classTableLine").click(function (){
        var tr = $(this);
        initTimeTable();

        if( tr.css("background-color") === "rgb(144, 238, 144)") {
            tr.css("background-color", "#ffffff");
            isClicked = false;
            clickNum = 0;
        }
        else{
            if(clickNum!=0){
                document.getElementsByClassName("classTableLine")[clickNum-1].setAttribute("style","background-color: #ffffff");
            }
            tr.css("background-color", "#90ee90");
            isClicked = true;
            clickNum = tr[0].innerHTML;

            if(rsvData!=null) {
                setTime(clickNum);
            }
        }
    });
});

function setTime(num) {
    for(var i = 0; i < rsvData.result.length; i++) {
        if(rsvData.result[i].seatNo == num) {
            var rsvStartHour = ("00"+new Date(rsvData.result[i].startTime).getHours().toString()).slice(-2);
            document.getElementsByClassName("rsvTimeTable")[rsvStartHour].setAttribute("style","background-color: #D3D3D3");
        }
    }
}

function initSeatTable() {
    $.each(document.getElementsByClassName("classTableLine"), function (i, item) {
        item.setAttribute("style","background-color: #FFFFFF");
    });
    clickNum = 0;
}

function initTimeTable() {
    $.each(document.getElementsByClassName("rsvTimeTable"), function (i, item) {
        item.setAttribute("style","background-color: #FFFFFF");
    });
}

function getRsvData(e) {
    var dateParam = e.target.value;
    var classNoParam = document.getElementById("classNo").innerText;

    initTimeTable();
    initSeatTable();
    ajaxRsvData(dateParam, classNoParam);
}

function ajaxRsvData(dateParam, classNoParam) {
    $.ajax({
        url: "/reservation?date="+dateParam+"&classNo="+classNoParam,
        type: "get",
        contentType : 'charset=UTF-8',
        datatype: "json",
        success: function (data) {
            rsvData = data;
        },
        error: function () {
            //
        },
        async: false
    });
}