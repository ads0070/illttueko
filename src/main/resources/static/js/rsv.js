var rsvData;
var scheduleData;
var seminarData;
var clickNum = 0;
var selectTimeMap = new Map();
var dayMap = new Map();
dayMap.set("월", 1);
dayMap.set("화", 2);
dayMap.set("수", 3);
dayMap.set("목", 4);
dayMap.set("금", 5);
dayMap.set("토", 6);
dayMap.set("일", 7);

/*
1. 고장 색상 : #D3D3D3
2. 세미나 색상 : #F3FCC0
3. 수업 색상 : #CCE9EB
4. 예약 색상 : #A1D2F7
*/

$(document).ready(function($) {
    var today = new Date();
    selectTimeMap.clear();
    var todayFormat = today.getFullYear() + "-" + (("00"+(today.getMonth()+1).toString()).slice(-2)) + "-" + (("00"+today.getDate().toString()).slice(-2));
    document.getElementById('startDatetime').value = todayFormat;
    var classNum = document.getElementById("classNo").innerText;

    ajaxScheduleData(classNum);
    ajaxRsvData(todayFormat, classNum);

    setTimeTable();
    setScheduleTime();
    getSerminarData();
    setSeminarTime($('#startDatetime').val());

    $("#rsv-time tr").click(function (){
        var tr = $(this);

        if(tr.css("background-color") === "rgb(211, 211, 211)") {
            alert("고장 좌석입니다.");
        }
        else if(tr.css("background-color") === "rgb(243, 252, 192)") {
            alert("세미나 시간입니다.");
        }
        else if(tr.css("background-color") === "rgb(204, 233, 235)") {
            alert("수업 시간입니다.");
        }
        else if(tr.css("background-color") === "rgb(161, 210, 247)") {
            alert("이미 예약된 좌석입니다.");
        }
        else if(tr.css("background-color") === "rgb(144, 238, 144)"){
            tr.css("background-color", "#ffffff");
            selectTimeMap.delete($(this).attr("id"));
        }else{
            tr.css("background-color", "#90ee90");
            selectTimeMap.set($(this).attr("id"), 1);
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

    $("#close-btn").click(function (){
        location.reload();
    });

    $("#book-btn").click(function (){
        var count = 0;

        if(clickNum == 0) {
            alert("좌석을 선택하세요.");
        } else if(selectTimeMap.size == 0) {
            alert("시간을 선택하세요.");
        } else {
            selectTimeMap.forEach((value, key) => {
                $.ajax({
                    url: "/reservation",
                    type: "post",
                    contentType : 'application/json; charset=UTF-8',
                    data: JSON.stringify({
                        classNo: document.getElementById("classNo").innerText,
                        seatNo: clickNum,
                        date: document.getElementById("startDatetime").value,
                        time: key
                    }),
                    datatype: "json",
                    success: function (data) {
                        count += 1;
                    },
                    error: function () {
                    },
                    async: false
                });
            });

            if (count > 0) {
                $.ajax({
                    url: "/reservation/notice",
                    type: "get",
                    contentType : 'charset=UTF-8',
                    success: function (data) {
                        $(".modal-body div span").text("");
                        $(".result span").text(count+"/"+selectTimeMap.size);
                        $(".notice textarea").text(data.result.notice);
                        $(".rule textarea").text(data.result.rule);
                        $("#notice-info").modal({backdrop: 'static', keyboard: false});
                        $("#notice-info").modal("show");
                    },
                    error: function () {
                        alert("오류가 발생했습니다.");
                        location.reload();
                    },
                    async: false
                });
            } else {
                alert("예약에 실패하었습니다.");
                location.reload();
            }
        }
    });
});

function setTimeTable() {
    var rsvTableBody = document.getElementById("rsv-tbody");
    var rsvCountMap = new Map();

    for(var j=0; j<rsvData.result.length; j++) {
        let rsvHour = new Date(rsvData.result[j].startTime).getHours();

        if(rsvData.result[j].approvalFlag != 2) {
            if(rsvCountMap.has(rsvHour)) {
                rsvCountMap.set(rsvHour, rsvCountMap.get(rsvHour)-1);
            } else{
                rsvCountMap.set(rsvHour, 39);
            }
        }
    }

    for(var i=0; i < 24; i++) {
        if(!rsvCountMap.has(i)) {
            rsvCountMap.set(i, 40);
        }

        let rsvTr = document.createElement("tr");
        let rsvTdTime = document.createElement("td");
        let rsvTdRemain = document.createElement("td");
        let rsvTdRemainNum = document.createElement("td");

        rsvTr.setAttribute("class","rsvTimeTable");
        rsvTr.setAttribute("id", i);
        rsvTdRemainNum.setAttribute("id", "remain"+i);
        rsvTdTime.innerText = ("00"+i).slice(-2) + ":00 ~ " + ("00"+i).slice(-2) + ":50";
        rsvTdRemain.innerText = "잔여좌석 : ";
        rsvTdRemainNum.innerText = rsvCountMap.get(i);

        rsvTdRemain.setAttribute("id", "remainSeat"+i);
        rsvTdRemain.setAttribute("style", "text-align: right");
        rsvTdRemainNum.setAttribute("style", "text-align: left");

        rsvTr.appendChild(rsvTdTime);
        rsvTr.appendChild(rsvTdRemain);
        rsvTr.appendChild(rsvTdRemainNum);

        rsvTableBody.appendChild(rsvTr);
    }
}

function setTime(num) {
    for(var i = 0; i < rsvData.result.length; i++) {
        if(rsvData.result[i].seatNo == num) {
            if(rsvData.result[i].approvalFlag != 2) {var rsvStartHour = new Date(rsvData.result[i].startTime).getHours()
                document.getElementsByClassName("rsvTimeTable")[rsvStartHour].setAttribute("style","background-color: #A1D2F7");
            }
        }
    }
}

function setScheduleTime() {
    var getDate = new Date(document.getElementById('startDatetime').value).getDay();

    for(var i = 0; i < scheduleData.result.length; i++) {
        var rsvStartHour = new Date(scheduleData.result[i].startTime).getHours();
        var rsvStartDay = dayMap.get(scheduleData.result[i].day);

        if(getDate == rsvStartDay) {
            document.getElementsByClassName("rsvTimeTable")[rsvStartHour].setAttribute("style","background-color: #CCE9EB");
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
    selectTimeMap.clear();
    setScheduleTime();
    setSeminarTime($('#startDatetime').val());
}

function getRsvData(e) {
    var dateParam = e.target.value;
    var classNoParam = document.getElementById("classNo").innerText;

    initTimeTable();
    initSeatTable();

    setSeminarTime(dateParam);

    ajaxRsvData(dateParam, classNoParam);
    updateTimeTable();
}

function setSeminarTime(dateParam) {
    var isSeminar = false;

    if(seminarData) {
        for (var i=0; i < seminarData.result.length; i++) {
            if(seminarData.result[i].lab.classNo == document.getElementById("classNo").innerText) {
                var seminarDateTime = new Date(seminarData.result[i].startTime);
                var seminarDay = seminarDateTime.getFullYear() + "-" + ("00"+(seminarDateTime.getMonth()+1)).slice(-2) + "-" + ("00"+seminarDateTime.getDate()).slice(-2);

                if(seminarDay == dateParam) {
                    document.getElementsByClassName("rsvTimeTable")[seminarDateTime.getHours()].setAttribute("style","background-color: #F3FCC0");
                    isSeminar = true;
                }
            }
        }
    }
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

function ajaxScheduleData(classNo) {
    $.ajax({
        url: "/schedule/class?"+"&classNo="+classNo,
        type: "get",
        contentType : 'charset=UTF-8',
        datatype: "json",
        success: function (data) {
            scheduleData = data;
        },
        error: function () {
            //
        },
        async: false
    });
}

function updateTimeTable() {
    var countMap = new Map();

    for(var j=0; j<rsvData.result.length; j++) {
        let rsvHour = new Date(rsvData.result[j].startTime).getHours();

        if(countMap.has(rsvHour)) {
            countMap.set(rsvHour, countMap.get(rsvHour)-1);
        } else{
            countMap.set(rsvHour, 39);
        }
    }

    for(var i=0; i < 24; i++) {
        if(!countMap.has(i)) {
            countMap.set(i, 40);
        }

        var rsvTdRemainNum = document.getElementById("remain"+i);

        rsvTdRemainNum.innerText = countMap.get(i);
    }
}

function getSerminarData() {
    $.ajax({
        url: "/seminar",
        type: "get",
        contentType : 'charset=UTF-8',
        success: function (data) {
            seminarData = data;
        },
        error: function () {
        },
        async: false
    });
}