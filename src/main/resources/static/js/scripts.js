$(document).ready(function($) {
    $('#manageRsv-table').DataTable({
        "dom": 'frtip',
        "autoWidth": false,
    });

    var table = $('#manageRsv-table').DataTable();
    table.page.len(8).draw();

    $(".tbtn").click(function (){

        if ($(this).text() === "미승인"){
            $(this).text("승인");
        }else{
            $(this).text("미승인");
        }
    })

});