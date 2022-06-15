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

    Representative(rsvData);

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
                `
                if(item.approvalFlag === 0){
                    tableContent +=
                    `<td>
                        자동 승인
                     </td>`
                }else if(item.approvalFlag === 1){
                    tableContent +=
                `<td>
                    <button type="button" class="btn btn-outline-dark" data-bs-toggle="modal"
                            value=${item.idx} data-bs-target="#approveModal">승인 대기
                    </button>
                </td>`
                }else if(item.approvalFlag === 2){
                    tableContent +=
                        `<td>
                        승인 완료
                     </td>`
                }else{
                    tableContent +=
                        `<td>
                        승인 거부
                     </td>`
                }
        tableContent +=
                `<td>
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
    return year + "-" + month + "-" + date + " " + hour + ":" + min;
}

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

$(document).on('click', '.btn-outline-dark', function (){
    var rsvIdx = $(this).attr('value');
    rsvIdx = parseFloat(rsvIdx)

    document.getElementById("approveRsv").addEventListener('click', function (){
        updateRsvFlag(rsvIdx, 2)
    });

    document.getElementById("disapproveRsv").addEventListener('click', function (){
        updateRsvFlag(rsvIdx, 3)
    });
});

function updateRsvFlag(idx, flag){
    $.ajax({
        url: "/reservation",
        type: "patch",
        contentType: 'application/json',
        data: JSON.stringify({
            idx: idx,
            approvalFlag: flag
        }),
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
}

function Representative(data){
    var now = new Date();

    var year = now.getFullYear();
    var month = now.getMonth();
    var day = now.getDate();
    var startHours = 17;
    var endHours = 9;

    var startDate = date_to_str(new Date(year, month, day, startHours));
    var endDate = date_to_str(new Date(year, month, day+1, endHours));

    var class_911 = [];
    var class_915 = [];
    var class_916 = [];
    var class_918 = [];

    $.each(data, function (i, item) {
        var endTime = item.endTime;
        var endTimestamp = new Date(endTime);
        var end = date_to_str(endTimestamp);

        if (startDate < end && end < endDate){
            if (item.lab.classNo === 911){
                class_911.push(item.idx);
            }else if (item.lab.classNo === 915){
                class_915.push(item.idx);
            }else if (item.lab.classNo === 916){
                class_916.push(item.idx);
            }else {
                class_918.push(item.idx);
            }
        }
    });

    var max_911 = Math.max.apply(null, class_911);
    var max_915 = Math.max.apply(null, class_915);
    var max_916 = Math.max.apply(null, class_916);
    var max_918 = Math.max.apply(null, class_918);

    var repre_911 = getName(data, max_911);
    var repre_915 = getName(data, max_915);
    var repre_916 = getName(data, max_916);
    var repre_918 = getName(data, max_918);

    document.getElementById("representative")
        .innerHTML="담당 학생 : 911 : "+repre_911+"<br> 915 : "+repre_915+"<br> 916 : "+repre_916+"<br> 918 : "+repre_918;
}

function getName(data, idx){
    var name;
    $.each(data, function (i, item) {
        if (item.idx === idx){
            name = item.name;
        }
    });
    return name;
}