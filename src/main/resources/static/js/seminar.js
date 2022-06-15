$(document).ready(function($) {
    $("#addSeminarBtn").click(function () {
        var date = $("#startDate").val();
        var startTime = $("#startTime").val();
        var endTime = $("#endTime").val();
        var labNo = $("#labNumber").val();
        var organizer = $("#organizer").val();
        var reason = $("#reason").val()

        if(!labNo) {
            alert("세미나를 진행할 실습실을 선택하세요.");
        } else if(!date) {
            alert("세미나 날짜를 선택하세요.")
        } else if(!startTime) {
            alert("세미나 시작 시간을 선택하세요.")
        } else if(!reason) {
            alert("사유를 입력 해주세요.")
        } else if(!organizer) {
            alert("주최자를 입력 해주세요.")
        }

        $.ajax({
            url: "/seminar",
            type: "post",
            contentType : 'application/json; charset=UTF-8',
            data: JSON.stringify({
                endTime: date + "T" + endTime + ":00+09:00",
                owner: organizer,
                seminarInfo: reason,
                startTime: date + "T" + startTime + ":00+09:00",
                classNo: labNo
            }),
            datatype: "json",
            success: function (data) {
                alert("세미나 등록이 완료되었습니다.");
                location.reload();
            },
            error: function () {
                alert("세미나 등록에 실패하였습니다.");
                location.reload();
            }
        })
    })

    $("#startTime").click(function () {
        var startTime = $("#startTime").val();
        if(startTime) {
            $("#endTime").val(startTime.slice(-5,-3) + ":50");
        }
    })
});