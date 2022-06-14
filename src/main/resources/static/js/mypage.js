var clickedNav = 1;
var rsvData;
var table;

jQuery(document).ready(function($) {
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

    table = document.getElementById('book-table')

    if(clickedNav == 1) {
        setRsv(table);
        $('#book-table tbody').on('click', 'tr td:not(:nth-child(n+6))', function () {
        $(".modal-body div span").text("");
        $(".no span").text(table.row(this).data()[0]);
        $(".lab span").text(table.row(this).data()[1]);
        $(".seat span").text(table.row(this).data()[2]);
        $(".startTime span").text(table.row(this).data()[3]);
        $(".endTime span").text(table.row(this).data()[4]);
        $(".confirmState span").text(table.row(this).data()[5]);
        $("#book-info").modal("show");
        });
    } else if(clickedNav == 2) {
        setWarn(table);
    } else {
        setInquiry(table);
    }

    $('#book-table').DataTable({
        "dom": 'frtip',
        "autoWidth": false,
    });

    table = $('#book-table').DataTable();
    table.page.len(7).draw();
});

$("#my-profile").click(function () {
    $.ajax({
        url: "/account/student",
        type: "get",
        contentType : 'charset=UTF-8',
        success: function (data) {
            setProfile(data);
        },
        error: function () {
            //
        },
        async: false
    })
})

function setProfile(profileData) {
    $(".modal-body div span").text("");
    $(".no span").text(profileData.result.idx);
    $("#email").val(profileData.result.email);
    $("#name").val(profileData.result.name);
    $("#phone").val(profileData.result.phone);
    $(".studentNo span").text(profileData.result.studentNo);
    $("#password").val("");
    $(".warn span").text(profileData.result.warn);
    $("#myProfile-info").modal("show");
}

$("#my-rsv").click(function () {
    var rsvNav = document.getElementById("my-rsv");
    var warnNav = document.getElementById("my-warn");
    var inquiryNav = document.getElementById("my-inquiry");
    rsvNav.setAttribute("class", "nav-link active");
    warnNav.setAttribute("class", "nav-link");
    inquiryNav.setAttribute("class", "nav-link");
    clickedNav = 1;
    location.reload();
});

$("#my-warn").click(function () {
    var rsvNav = document.getElementById("my-rsv");
    var warnNav = document.getElementById("my-warn");
    var inquiryNav = document.getElementById("my-inquiry");
    rsvNav.setAttribute("class", "nav-link");
    warnNav.setAttribute("class", "nav-link active");
    inquiryNav.setAttribute("class", "nav-link");
    clickedNav = 2;
    setWarn(document.getElementById("book-table"));
});

$("#my-inquiry").click(function () {
    var rsvNav = document.getElementById("my-rsv");
    var warnNav = document.getElementById("my-warn");
    var inquiryNav = document.getElementById("my-inquiry");
    rsvNav.setAttribute("class", "nav-link");
    warnNav.setAttribute("class", "nav-link");
    inquiryNav.setAttribute("class", "nav-link active");
    clickedNav = 3;
    setInquiry(document.getElementById("book-table"));
});

function setRsv(table) {
    table.innerHTML = "";
    var tableTitle =
        `<thead>
                        <tr>
                            <th>No</th>
                            <th>실습실</th>
                            <th>좌석 번호</th>
                            <th>시작 시간</th>
                            <th>종료 시간</th>
                            <th>승인 상태</th>
                            <th>연장</th>
                            <th>문의</th>
                            <th>취소</th>
                        </tr>
                        </thead>`
    table.innerHTML += tableTitle;

    var tableContent = `<tbody>`;

    $.each(rsvData, function (i, item) {

        var approval = "자동 승인";
        if(item.approvalFlag == 1) {
            approval = "승인 대기";
        } else if(item.approvalFlag == 2) {
            approval = "승인 완료";
        }
        console.log(approval);

        tableContent +=
            `<tr>
                    <td>${item.idx}</td>
                    <td>${item.lab.classNo}</td>
                    <td>${item.seatNo}</td>
                    <td>${item.startTime}</td>
                    <td>${item.endTime}</td>
                    <td>${approval}</td>
                    <td>
                        <button type="button" class="btn btn-link">연장</button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-outline-dark" data-bs-toggle="modal"
                                data-bs-target="#inquiryModal">문의
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                                data-bs-target="#cancelModal">취소
                        </button>
                    </td>
                </tr>`
    })

    tableContent += `</tbody>`
    table.innerHTML += tableContent;
}

function setWarn(table) {
    table.innerHTML = "";
    var tableTitle =
        `<thead>
                        <tr>
                            <th>No</th>
                            <th>부여 날짜</th>
                            <th>경고 내용</th>
                        </tr>
                        </thead>`
    table.innerHTML += tableTitle;

    var tableContent = `<tbody>`;

    $.each(rsvData, function (i, item) {
        tableContent +=
            `<tr>
                    <td>${item.idx}</td>
                    <td>${item.lab.classNo}</td>
                    <td>${item.seatNo}</td>
                </tr>`
    })
}

function setInquiry(table) {
    table.innerHTML = "";
    var tableTitle =
        `<thead>
                        <tr>
                            <th>No</th>
                            <th>문의 내용</th>
                            <th>생성 시간</th>
                            <th>예약 번호</th>
                        </tr>
                        </thead>`
    table.innerHTML += tableTitle;

    var tableContent = `<tbody>`;

    $.each(rsvData, function (i, item) {
        tableContent +=
            `<tr>
                    <td>${item.idx}</td>
                    <td>${item.lab.classNo}</td>
                    <td>${item.seatNo}</td>
                </tr>`
    })
}