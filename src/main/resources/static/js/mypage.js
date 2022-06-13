jQuery(document).ready(function($) {
    $('#book-table').DataTable({
        "dom": 'frtip',
        "autoWidth": false,
    });

    var table = $('#book-table').DataTable();
    table.page.len(7).draw();

    $('#book-table tbody').on('click', 'tr td:not(:nth-child(n+6))', function () {
        // console.log(table.row(this).data());
        $(".modal-body div span").text("");
        $(".no span").text(table.row(this).data()[0]);
        $(".lab span").text(table.row(this).data()[1]);
        $(".seat span").text(table.row(this).data()[2]);
        $(".startTime span").text(table.row(this).data()[3]);
        $(".endTime span").text(table.row(this).data()[4]);
        $(".confirmState span").text(table.row(this).data()[5]);
        $("#book-info").modal("show");
    });
} );