jQuery(document).ready(function($) {
    $('#book-table').DataTable({
        retrieve: true,
        paging: true,
        responsive: true,
        "autoWidth": false
    });
    var table = $('#book-table').DataTable();
    $('#book-table tbody').on('click', 'tr td:not(:nth-child(n+6))', function () {
        //console.log(table.row(this).data());
        $(".modal-body div span").text("");
        $(".no span").text(table.row(this).data()[0]);
        $(".lab span").text(table.row(this).data()[1]);
        $(".stateTime span").text(table.row(this).data()[2]);
        $(".endTime span").text(table.row(this).data()[3]);
        $(".confirmState span").text(table.row(this).data()[4]);
        $("#book-info").modal("show");
    });
} );

jQuery(document).ready(function($) {
    $('#inquiry-table').DataTable({
        retrieve: true,
        paging: true,
        responsive: true,
        "autoWidth": false
    });
    var table = $('#inquiry-table').DataTable();
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
        retrieve: true,
        paging: true,
        responsive: true,
        "autoWidth": false
    });
} );