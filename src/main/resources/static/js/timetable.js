$(document).ready(function ($){

    var token = document.cookie;

    $("#test tr").click(function (){

        var tr = $(this);

        if( tr.css("background-color") === "rgb(144, 238, 144)"){
            tr.css("background-color", "#ffffff");
        }else{
            tr.css("background-color", "#90ee90");
        }
    });

    $(".classTableLine").click(function (){

        $(".classTableLine").css("background-color", "#ffffff");

        $(this).css("background-color", "#90ee90");
    })
});
