$('#btn').on('click', (e)=>{
    var pw = $('#pw').val();
    var pw2 = $('#pw2').val();
    var phone = $('#phone').val();
    var email = $('#email').val();

    $.ajax({
        type:'POST',
        url:'http://localhost:8080/auth/login',
        contentType: 'application/json',
        data: JSON.stringify({
            userId: id,
            userPwd: pw
        }),
        success:function (data){
            if(data==="true"){
                window.location.href="http://localhost:8080/test/reservation";
            }else if(data === "first") {
                window.location.href="http://localhost:8080/auth/first";
                alert("최초 로그인시 패스워드를 변경해주세요.");
            }else{
                alert("로그인에 실패했습니다.\n다시 확인해주세요.");
            }
        },
        error: function (){

        }
    });
});