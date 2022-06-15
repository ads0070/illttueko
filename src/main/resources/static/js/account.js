$(document).ready(function ($) {
    $('#user-table').DataTable({
        "dom": 'frtip',
        "autoWidth": true,
        "bDestroy": true
    });
    var table = $('#user-table').DataTable();
    table.page.len(8).draw();

    $.ajax({
        type: "GET",
        url: "https://illttueko.shop/account/students",
        contentType: 'application/json',
        async: false,
        success: function (data) {
            $.each(data.result, function (i, item) {
                if (item.phone === null) {
                     item.phone = "미등록";
                }
                if (item.email === null) {
                     item.email = "미등록";
                }
                if (item.phone.length == 0) {
                    item.phone = "미등록";
                }
                if (item.email.length == 0) {
                    item.email = "미등록";
                }
                table.row.add([item.idx, item.studentNo, item.name, item.phone, item.email, item.warn])
                    .draw().node();
            });
        },
        error: function () {
            //
        }
    });

    $('#user-table').on('click', 'tr', function () {
        $(".modal-body div span").text("");
        $(".no span").text(table.row(this).data()[0]);
        $(".studentid span").text(table.row(this).data()[1]);
        $(".name span").text(table.row(this).data()[2]);
        $(".phone span").text(table.row(this).data()[3]);
        $(".email span").text(table.row(this).data()[4]);
        $(".red span").text(table.row(this).data()[5]);
        $("#myModal").modal("show");

        var tr = $(this);
        var td = tr.children();
        var no = td.eq(0).text();
        sessionStorage.setItem("idx", no);
    });


});

$(document).ready(function ($) {

    $('#modelDelBtn').on('click', function () {
        var no = sessionStorage.getItem("idx")
        $.ajax({
            type: 'delete',
            url: 'https://illttueko.shop/account/student/' + no,
            contentType: 'application/json',
            cache: false,
            error: function (error) {
                alert('error 발생')
            },
            success: function () {
                alert('삭제 완료');
                location.reload();
            }
        });
    })

    $('#modelModBtn').on('click', function () {
        $("#myModal2").modal("show");
    })

    $('#modelOkBtn').on('click', function () {
        var no = sessionStorage.getItem("idx")

        $.ajax({
            type: 'patch',
            url: 'https://illttueko.shop/account/student',
            contentType: 'application/json',
            cache: false,
            data: JSON.stringify({
                idx: no,
                studentNo: $('#studentid').val(),
                name: $('#name').val(),
                warn: $('#warn').val()
            }),
            error: function (error) {
                alert('error 발생')

            },
            success: function () {
                alert('변경 완료');
                location.reload();
            }
        });
    })

    $('#insert_btn').on('click', function () {
        $("#myModal3").modal("show");
    })

    $('#input_Btn').on('click', function () {
        var sid = $('#input_studentid').val();
        var spwd = $('#input_password').val();
        var snm = $('#input_name').val();

        if (sid == null || sid == undefined || sid == "") {
            alert('학번은 필수 입력사항입니다.');
            $('#input_studentid').focus();
            return;
        }
        if (spwd == null || spwd == undefined || spwd == "") {
            alert('패스워드 필수 입력사항입니다.');
            $('#input_password').focus();
            return;
        }
        if (snm == null || snm == undefined || snm == "") {
            alert('이름은 필수 입력사항입니다.');
            $('#input_name').focus();
            return;
        }

        $.ajax({
            type: 'post',
            url: 'https://illttueko.shop/account/student',
            contentType: 'application/json',
            cache: false,
            data: JSON.stringify({
                studentNo: $('#input_studentid').val(),
                password: $('#input_password').val(),
                name: $('#input_name').val()
            }),
            error: function (error) {
                alert('error 발생')

            },
            success: function () {
                alert('학생 추가 완료');
                location.reload();
            }
        });
    })
});

