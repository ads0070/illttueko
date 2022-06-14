$(document).ready(function ($) {
    $('#user-table').DataTable({
        "dom": 'frtip',
        "autoWidth": true,
        "bDestroy": true
    });
    var table = $('#user-table').DataTable();
    table.page.len(8).draw();
    var trHTML1 = "";
    var a ="";
    var b = "";

    $.ajax({
        type: "GET",
        url: "http://localhost:8080/account/students",
        contentType: 'application/json',
        async : false,
        success: function (data) {

            console.log(data)
            console.log(data.result)
            $.each(data.result, function (i, item) {
                console.log(item.phone)
                console.log(item)
                if(item.phone === null){
                    a = "미등록";
                }
                if(item.email === null){
                    b = "미등록";
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
        //console.log(table.row(this).data());
        $(".modal-body div span").text("");
        $(".no span").text(table.row(this).data()[0]);
        $(".studentid span").text(table.row(this).data()[1]);
        $(".name span").text(table.row(this).data()[2]);
        $(".phone span").text(table.row(this).data()[3]);
        $(".email span").text(table.row(this).data()[4]);
        $(".red span").text(table.row(this).data()[5]);
        $("#myModal").modal("show");

        var tr =$(this);
        var td = tr.children();

        var no = td.eq(0).text();
        sessionStorage.setItem("idx",no);
    });


});

$(document).ready(function ($) {

    $('#modelModBtn').on('click',function (){
        $("#myModal").modal("hide");
        $("#myModal2").modal("show");
    })

    $('#modelOkBtn').on('click',function (){
        var no = sessionStorage.getItem("idx")
        // var idx = $('#no').val();
        // var oId = $('#oid').val();
        // var name = $('#name').val();
        // var warn = $('#warn').val();

        $.ajax({
            type: 'patch',
            url: 'http://localhost:8080/account/student',
            contentType: 'application/json',
            cache: false,
            data:JSON.stringify({
                idx : no,
                studentNo: $('#studentid').val(),
                name: $('#name').val(),
                warn : $('#warn').val()
            }),
            error: function (error) {
                console.log(error)
                alert('error 발생')

            },
            success: function () {
                alert('변경 완료');
                $("#myModal2").modal("hide");
                $("#myModal1").modal("show");
            }
        });
    })
});

