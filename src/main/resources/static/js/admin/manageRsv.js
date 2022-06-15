var rsvData;
var table;

$(document).ready(function($) {
    $.ajax({
        url: "/reservation",
        type: "get",
        contentType : 'charset=UTF-8',
        success: function (data) {
            rsvData = data.result;
        },
        error: function () {
            //
        },
        async: false
    })

    table = document.getElementById('manageRsv-table');

    setRsv(table);

    $('#manageRsv-table').DataTable({
        "dom": 'frtip',
        "autoWidth": false,
    });

    var table = $('#manageRsv-table').DataTable();
    table.page.len(8).draw();
});


function setRsv(table) {
    table.innerHTML = "";
    var tableTitle =
        `<thead>
                        <tr>
                            <th>No</th>
                            <th>학번</th>
                            <th>이름</th>
                            <th>실습실</th>
                            <th>좌석 번호</th>
                            <th>시작 시간</th>
                            <th>종료 시간</th>
                            <th>예약 시간</th>
                            <th>승인 상태</th>
                            <th>취소</th>
                        </tr>
                        </thead>`
    table.innerHTML += tableTitle;

    var tableContent = `<tbody>`;

    $.each(rsvData, function (i, item) {
        var startTime = item.startTime;
        var startTimestamp = new Date(startTime);
        var start = date_to_str(startTimestamp);

        var endTime = item.endTime;
        var endTimestamp = new Date(endTime);
        var end = date_to_str(endTimestamp);

        var createTime = item.createAt;
        var createTimestamp = new Date(createTime);
        var create = date_to_str(createTimestamp);

        tableContent +=
            `<tr>
                <td>${item.idx}</td>
                <td>${item.student.studentNo}</td>
                <td>${item.name}</td>
                <td>${item.lab.classNo}</td>
                <td>${item.seatNo}</td>
                <td>${start}</td>
                <td>${end}</td>
                <td>${create}</td>
                <td>
                    <button type="button" class="btn btn-outline-dark tbtn" data-bs-toggle="button"
                            autocomplete="off">미승인
                    </button>
                </td>
                <td>
                    <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                            value=${item.idx} data-bs-target="#cancelModal">취소
                    </button>
                </td>
            </tr>`
    })

    tableContent += `</tbody>`
    table.innerHTML += tableContent;
}

function date_to_str(format){
    var year = format.getFullYear();
    var month = format.getMonth() + 1;
    if(month<10)
        month = '0' + month;
    var date = format.getDate();
    if(date<10)
        date = '0' + date;
    var hour = format.getHours();
    if(hour<10)
        hour = '0' + hour;
    var min = format.getMinutes();
    if(min<10)
        min = '0' + min;
    return year + "-" + month + "-" + date + " " + hour + ":" + min;}

$(document).on('click', '.btn-outline-danger', function (){
    var rsvIdx = $(this).attr('value');

    document.getElementById("deleteRsv").addEventListener('click', function (){
        $.ajax({
            url: "/reservation/"+rsvIdx,
            type: "delete",
            contentType : 'charset=UTF-8',
            success: function (data) {
                var result = data.isSuccess;
                if (result){
                    window.location.reload();
                }else{
                    alert("서버와의 통신에 문제가 발생했습니다.")
                }
            },
            error: function () {
                //
            },
            async: false
        })
    })
});