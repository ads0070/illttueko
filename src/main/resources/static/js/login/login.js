$('#btn').on('click', (e)=>{
    login();
});

$('#login_form').keypress(function (e){
    if (e.keyCode === 13){
        login();
    }
});

function login(){
    var id = $('#id').val();
    var pw = $('#pw').val();

    if (id === null || id === "" || pw === null || pw === "") {
        alert("다시 확인하세요.");
    }else{
        $.ajax({
            type:'POST',
            url:'http://localhost:8080/auth/login',
            contentType: 'application/json',
            data: JSON.stringify({
                userId: id,
                userPwd: pw
            }),
            success:function (data){
                var result = data.result;
                if(result==="true"){
                    window.location.href="http://localhost:8080/reservation/situation";
                }else if(result === "first") {
                    window.location.href="http://localhost:8080/auth/first";
                    alert("최초 로그인시 패스워드를 변경해주세요.");
                }else{
                    alert("로그인에 실패했습니다.\n다시 확인해주세요.");
                }
            },
            error: function (){

            }
        });
    }
}