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
    $("#email").val(profileData.result.email);
    $(".name span").text(profileData.result.name);
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
                            <th>?????????</th>
                            <th>?????? ??????</th>
                            <th>?????? ??????</th>
                            <th>?????? ??????</th>
                            <th>?????? ??????</th>
                            <th>??????</th>
                            <th>??????</th>
                            <th>??????</th>
                        </tr>
                        </thead>`
    table.innerHTML += tableTitle;

    var tableContent = `<tbody>`;

    $.each(rsvData, function (i, item) {

        var approval = "?????? ??????";
        if(item.approvalFlag == 1) {
            approval = "?????? ??????";
        } else if(item.approvalFlag == 2) {
            approval = "?????? ??????";
        } else if(item.approvalFlag == 3) {
            approval = "?????? ??????";
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
                        <button type="button" class="btn btn-link">??????</button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-outline-dark" data-bs-toggle="modal"
                                data-bs-target="#inquiryModal">??????
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                                value=${item.idx} data-bs-target="#cancelModal">??????
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
                            <th>?????? ??????</th>
                            <th>?????? ??????</th>
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
                            <th>?????? ??????</th>
                            <th>?????? ??????</th>
                            <th>?????? ??????</th>
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
                    alert("???????????? ????????? ????????? ??????????????????.")
                }
            },
            error: function () {
                //
            },
            async: false
        })
    })
});

$(document).on('click', '#modifyInfo', function (){
    var pw = $('#password').val();
    var email = $('#email').val();
    var phone = $('#phone').val();

    if (pw === null || pw === ""){
        $.ajax({
            url: "/auth/userinfo",
            type: "patch",
            contentType: 'application/json',
            data: JSON.stringify({
                phone: phone,
                email: email
            }),
            success: function (data) {
                var result = data.isSuccess;
                if (result){
                    alert("?????????????????????.");
                }else{
                    alert("???????????? ????????? ????????? ??????????????????.")
                }
            },
            error: function () {
                //
            }
        })
    }else{
        $.ajax({
            url: "/auth/first",
            type: "patch",
            contentType: 'application/json',
            data: JSON.stringify({
                userPwd: pw,
                phone: phone,
                email: email
            }),
            success: function (data) {
                var result = data.isSuccess;
                if (result){
                    alert("?????????????????????.");
                }else{
                    alert("???????????? ????????? ????????? ??????????????????.")
                }
            },
            error: function () {
                //
            }
        })
    }


});