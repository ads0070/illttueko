jQuery(document).ready(function($) {
    $('#user-table').DataTable({
        "dom": 'frtip',
        "autoWidth": false,
        "bDestroy": true
    });

    var table = $('#user-table').DataTable();
    table.page.len(8).draw();

    $('#user-table tbody').on('click', 'tr', function () {
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

jQuery(document).ready(function($) {
    $('#inquiry-table').DataTable({
        "dom": 'frtip',
        "autoWidth": false,
    });

    var table = $('#inquiry-table').DataTable();
    table.page.len(8).draw();

    $('#inquiry-table tbody').on('click', 'tr', function () {
        $(".modal-body div span").text("");
        $(".no span").text(table.row(this).data()[0]);
        $(".date span").text(table.row(this).data()[1]);
        $(".time span").text(table.row(this).data()[2]);
        $(".stuNum span").text(table.row(this).data()[3]);
        $(".name span").text(table.row(this).data()[4]);
        $(".lab span").text(table.row(this).data()[5]);
        $(".seat span").text(table.row(this).data()[6]);
        $(".contents span").text(table.row(this).data()[7]);
        $("#inquiry-info").modal("show");
        $('#processState').val(table.row(this).data()[8]).prop("selected",true);
    });
} );

jQuery(document).ready(function($) {
    $('#seminar-table').DataTable({
        "dom": 'frtip',
        "autoWidth": false,
    });

    var table = $('#seminar-table').DataTable();
    table.page.len(8).draw();
} );

