<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%
        String role = new String();
    %>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <meta charset="UTF-8">
    <title>회원 관리</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <style>
        .modal-body div {
            float: left;
            width: 100%
        }

        .modal-body div p {
            float: left;
            width: 20%;
            font-weight: 600;
        }

        .modal-body div span {
            float: left;
            width: 80%
        }
    </style>
    <script>
        function getCookie(name) {
            var nameOfCookie = name + "=";
            var x = 0;
            while (x <= document.cookie.length){
                var y = (x + nameOfCookie.length);
                if (document.cookie.substring(x, y) === nameOfCookie) {
                    if ((endOfCookie = document.cookie.indexOf(";", y)) === -1)
                        endOfCookie = document.cookie.length;
                    return unescape(document.cookie.substring(y, endOfCookie));
                }
                x = document.cookie.indexOf(" ", x) + 1;
                if (x == 0)
                    break;
            }
            return "";
        }

        var cookie = getCookie('JWT');
        if (cookie !== "") {
            parseJwt = JSON.parse(Base64.decode(cookie.toString().split('.')[1]));

            if(parseJwt.role === "STUDENT"){
                <% role = "STUDENT"; %>
            }else if(parseJwt.role === "PROFESSOR"){
                <% role = "PROFESSOR"; %>
            }else{
                <% role = "ADMIN"; %>
            }
        }
    </script>
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
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-12">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">학생 관리</h1>
                            <div class="text-muted fst-italic mb-2">모든 학생 조회</div>
                        </header>
                        <div class="table-responsive">
                            <input type="button" class="btn btn-outline-primary" name="submit" value="학생 추가"
                                   style="float: left;"
                                   id="insert_btn">
                            <table id="user-table" class="table table-hover"
                                   style="text-align: center; vertical-align: middle">
                                <div>
                                    <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>학번</th>
                                        <th>이름</th>
                                        <th>전화번호</th>
                                        <th>email</th>
                                        <th>경고</th>
                                    </tr>
                                    </thead>
                                    <tbody id="user__table">
                                    </tbody>
                                </div>
                            </table>
                        </div>
                        <%--학생 상세 조회 modal--%>
                        <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog">
                                <%--modal content--%>
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">학생 상세 정보 관리</h4>

                                    </div>
                                    <div class="modal-body">
                                        <div class="no"><p>no: </p><span></span></div>
                                        <div class="studentid" id="oid"><p>학번: </p><span></span></div>
                                        <div class="name"><p>이름: </p><span></span></div>
                                        <div class="phone"><p>전화번호: </p><span></span></div>
                                        <div class="email"><p>이메일: </p><span></span></div>
                                        <div class="red"><p>경고: </p><span></span></div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary " id="modelModBtn">수정
                                        </button>
                                        <button type="button" class="btn btn-secondary " id="modelDelBtn">삭제
                                        </button>
                                        <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">
                                            취소
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- 수정하기 modal--%>
                        <div class="modal fade" id="myModal2" role="dialog">
                            <div class="modal-dialog">
                                <%--modal content--%>
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">학생 상세 정보 수정</h4>

                                    </div>
                                    <div class="modal-body">
                                        <div class="no"><p id="no">no: </p><span></span></div>
                                        <form>
                                            <div class="studentid"><p>학번: </p><input type="text" id="studentid"/></div>
                                            <div class="name"><p>이름: </p><input type="text" id="name"/></div>
                                            <div class="phone"><p>전화번호: </p><span></span></div>
                                            <div class="email"><p>이메일: </p><span></span></div>
                                            <div class="red"><p>경고: </p><input type="text" id="warn"/></div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary " id="modelOkBtn">확인
                                        </button>
                                        <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">
                                            취소
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- 학생 추가 modal--%>
                        <div class="modal fade" id="myModal3" role="dialog">
                            <div class="modal-dialog">
                                <%--modal content--%>
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">학생 추가</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="studentid"><p>학번: </p><input type="text" id="input_studentid"/></div>
                                            <div class="name"><p>이름: </p><input type="text" id="input_name"/></div>
                                            <div class="password"><p>패스워드: </p><input type="password" id="input_password"/></div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary " id="input_Btn">확인
                                        </button>
                                        <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">
                                            취소
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>

                </article>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/account.js"></script>
</body>
</html>
