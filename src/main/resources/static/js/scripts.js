jQuery(document).ready(function($) {
    $('#user-table').DataTable({
        retrieve: true,
        paging: true,
        responsive: true,
        "autoWidth": false,
    });
    var table = $('#user-table').DataTable();
    $('#user-table tbody').on('click', 'tr', function () {
        //console.log(table.row(this).data());
        $(".modal-body div span").text("");
        $(".no span").text(table.row(this).data()[0]);
        $(".studentid span").text(table.row(this).data()[1]);
        $(".name span").text(table.row(this).data()[2]);
        $(".phone span").text(table.row(this).data()[3]);
        $(".email span").text(table.row(this).data()[4]);
        $(".red span").text(table.row(this).data()[5]);
        $("#myModal").modal("show");
    });


} );

