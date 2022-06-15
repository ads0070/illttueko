$(document).ready(function ($){

    var token = document.cookie;

    $("#test tr").click(function (){

        var tr = $(this);

        if( tr.css("background-color") === "rgb(144, 238, 144)"){
            tr.css("background-color", "#ffffff");
        }else{
            tr.css("background-color", "#90ee90");
        }
    });

    $(".classTableLine").click(function (){

        $(".classTableLine").css("background-color", "#ffffff");

        $(this).css("background-color", "#90ee90");
    })
    $('#class911').click(function (){
        sessionStorage.setItem('hereLoc',911);
        location.reload();
    })
    $('#class916').click(function (){
        sessionStorage.setItem('hereLoc',916);
        location.reload();
    })
    $('#class915').click(function (){
        sessionStorage.setItem('hereLoc',915);
        location.reload();
    })
    $('#class918').click(function (){
        sessionStorage.setItem('hereLoc',918);
        location.reload();
    })
    var classNo = sessionStorage.getItem("hereLoc");
    /** 시간표 조회 **/
    $.ajax({
        type: "GET",
        url: "http://localhost:8080/schedule/class?" + $.param({"classNo": classNo}),
        contentType: 'application/json',
        success: function (data) {
            var st = "";
            var et = "";

            /** timestamp 시간으로 변환 **/
            function timestamp(a) {
                var today = new Date(a);
                today.setHours(today.getHours() + 9);
                return today.toISOString().replace('T', ' ').substring(0, 19);
            }

            /** 필요한 시간으로만 슬라이싱 **/
            function slicetime(a){
                var fulltime = a;
                fulltime = a.substr(11,5);
                return fulltime;
            }

            var classNo = "";
            var subject = "";
            var day = "";
            var table = "";
            var dday =0;
            $.each(data.result, function (i, item) {

                day = item.day;
                st = timestamp(item.startTime);
                et = timestamp(item.endTime);
                st = slicetime(st);
                et = slicetime(et);
                subject = item.subject;
                classNo = item.lab.classNo;     //911만 조회하니 911만 뽑힘.
                if(day == "월"){
                    dday = 1;
                }else if(day =="화"){
                    dday =2;
                }else if(day =="수"){
                    dday =3;
                }else if(day =="목"){
                    dday =4;
                }else if(day =="금"){
                    dday =5;
                }

                if(st >= "09:00" && et <= "09:59"){

                    table = '<td align="center" style="background-color: #ece1be">' + subject + '</td>'
                    document.getElementById("one").getElementsByTagName("td")[dday].innerHTML = table
                }else if(st >= "10:00" && et <= "10:59"){

                    table = '<td align="center" style="background-color: #ece1be">' + subject + '</td>'
                    document.getElementById("two").getElementsByTagName("td")[dday].innerHTML = table

                }else if(st >= "11:00" && et <= "11:59"){

                    table = '<td align="center" style="background-color: #ece1be">' + subject + '</td>'
                    document.getElementById("three").getElementsByTagName("td")[dday].innerHTML = table
                }else if(st >= "12:00" && et <= "12:59"){

                    table = '<td align="center" style="background-color: #ece1be">' + subject + '</td>'
                    document.getElementById("four").getElementsByTagName("td")[dday].innerHTML = table
                }else if(st >= "13:00" && et <= "13:59"){

                    table = '<td align="center" style="background-color: #ece1be">' + subject + '</td>'
                    document.getElementById("five").getElementsByTagName("td")[dday].innerHTML = table
                }else if(st >= "14:00" && et <= "14:59"){

                    table = '<td align="center" style="background-color: #ece1be">' + subject + '</td>'
                    document.getElementById("six").getElementsByTagName("td")[dday].innerHTML = table
                }else if(st >= "15:00" && et <= "15:59"){

                    table = '<td align="center" style="background-color: #ece1be">' + subject + '</td>'
                    document.getElementById("seven").getElementsByTagName("td")[dday].innerHTML = table
                }else if(st >= "16:00" && et <= "16:59"){

                    table = '<td align="center" style="background-color: #ece1be">' + subject + '</td>'
                    document.getElementById("eight").getElementsByTagName("td")[dday].innerHTML = table
                }
            });
        },
        error: function () {
            //
        }
    });

    /** 시간표 추가 **/
    $(document).on("click", "#ok_btn", function () {

        var selectDay = $("#selectDay").val();
        var startTime = $("#stTime").val();
        var endTime = $("#edTime").val();
        var subject = $("#subject").val();
        if (selectDay == null || selectDay == undefined || selectDay == "") {
            alert('요일을 선택해주세요.');
            $('#selectDay').focus();
            return;
        }
        if (startTime == null || startTime == undefined || startTime == "") {
            alert('시작시간을 입력해주세요.');
            $('#stTime').focus();
            return;
        }
        if (endTime == null || endTime == undefined || endTime == "") {
            alert('종료시간을 입력해주세요.');
            $('#edTime').focus();
            return;
        }
        if (subject == null || subject == undefined || subject == "") {
            alert('과목을 입력해주세요.');
            $('#subject').focus();
            return;
        }


        var here1 = sessionStorage.getItem('hereLoc');
        here = parseInt(here1);

        $.ajax({
            type: 'post',
            url: 'http://localhost:8080/schedule/class',
            contentType: 'application/json',
            cache: false,
            data: JSON.stringify({
                day : selectDay,
                startTime : startTime,
                endTime : endTime,
                subject : subject,
                classNo : here

            }),
            error: function (error) {
                alert('수업 시간표 추가실패');
            },
            success: function (data) {
                if(data.result == "fail"){
                    alert("이미 해당 시간에 등록된 수업이 있습니다.");
                    location.reload();
                }else if(data.result == "success"){
                    alert('수업 시간표 추가 완료');
                    location.reload();
                }
            }
        });
    })

    $('#stTime').click(function (){
        var endTime = ($("#stTime").val()).slice(0, 2) + ":50";
        document.getElementById("edTime").value = endTime;
    });
});