$('#btn').on('click', (e)=>{
    var pw = $('#pw').val();
    var pw2 = $('#pw2').val();
    var phone = $('#phone').val();
    var email = $('#email').val();

    if (pw === pw2){
        $.ajax({
            type:'PATCH',
            url:'http://localhost:8080/auth/first',
            contentType: 'application/json',
            data: JSON.stringify({
                userPwd: pw,
                phone: phone,
                email: email
            }),
            success:function (data){
                alert(data);
                if(data !=="" || data !== null){
                    alert("성공적으로 수정되었습니다.")
                    window.location.href="http://localhost:8080/test/reservation";
                }else{
                    alert("서버 통신에 오류가 발생했습니다.");
                    window.location.reload();
                }
            },
            error: function (){

            }
        });
    }else{
        alert("패스워드가 일치하지 않습니다.\n다시 확인하세요.");
    }

});