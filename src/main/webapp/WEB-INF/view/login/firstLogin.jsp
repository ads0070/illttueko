<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%
        request.setCharacterEncoding("UTF-8");
        String role = new String();

    %>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <meta charset="UTF-8">
    <title>일뜨코 로그인</title>
</head>
<body>
<div id="body-wrapper">
    <div id="body-content">
        <!-- Responsive navbar-->
        <div id="input_header">
            <%
                if (role.equals("STUDENT")){
            %>
            <jsp:include page="../include/userHeader.jsp"/>
            <%
            }else if(role.equals("PROFESSOR")){
            %><jsp:include page="../include/professorHeader.jsp"/>
            <%
            }else if(role.equals("ADMIN")){
            %><jsp:include page="../include/adminHeader.jsp"/>
            <%
            }else{
            %><jsp:include page="../include/defaultHeader.jsp"/>
            <%
                }
            %>
        </div>
        <div class="accordion-bodys">
            <section class="login-form">
                <h1>정보 수정</h1>
                <form action="" style="text-align: center">
                    <div class="int-area">
                        <input type="password" id="pw" required>
                        <label for="pw">패스워드</label>
                    </div>
                    <div class="int-area">
                        <input type="password" id="pw2" required>
                        <label for="pw2">패스워드 확인</label>
                    </div>
                    <%
                        if (request.getAttribute("role").equals("STUDENT")){
                    %>
                    <div class="int-area">
                        <input type="text" id="phone" required>
                        <label for="phone">전화번호</label>
                    </div>
                    <div class="int-area">
                        <input type="text" id="email" required>
                        <label for="email">email</label>
                    </div>
                    <%
                        }
                    %>
                </form>
                <div class="btn-area">
                    <button id="btn" type="button">정보 수정</button>
                </div>

            </section>
        </div>
    </div>
    <jsp:include page="../include/footer.jsp"/>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>
<script src="/js/login/firstLogin.js"></script>
</body>
</html>
