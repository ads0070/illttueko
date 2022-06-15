<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%
        request.setCharacterEncoding("UTF-8");
        String flag = request.getParameter("flag");
        String labNo = request.getParameter("labNo");
        if (labNo == null){
            labNo = "911";
        }
    %>

    <% String role;%>
    <meta charset="UTF-8"/>
    <title>일뜨코</title>
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
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
                if (x === 0)
                    break;
            }
            return "";
        }

        var cookie = getCookie('JWT');
        if (cookie !== "") {
            parseJwt = JSON.parse(Base64.decode(cookie.toString().split('.')[1]));
            console.log(parseJwt.role);

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
            %>
            <jsp:include page="../include/professorHeader.jsp"/>
            <%
                }else if(role.equals("ADMIN")){
            %>
            <jsp:include page="../include/adminHeader.jsp"/>
            <%
            }else{
            %>
            <jsp:include page="../include/defaultHeader.jsp"/>
            <%
            }
            %>
        </div>
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article class="article">
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <%
                                String title;
                                if (flag == null || flag.equals("")) {
                                    title = "실습실 현황";
                                }else if (flag.equals("y")){
                                    title = "실습실 예약";
                                }else {
                                    title = "실습실 현황";
                                }
                            %>
                            <h1 class="fw-bolder mb-1"><%=title%></h1>
                            <!-- Post meta content-->

                            <div class="text-muted fst-italic mb-2" style="float: left" id="classNo"><%=labNo%></div>
                            <div class="text-muted fst-italic mb-2" style="float: left; margin-left: 5px">실습실 현황</div>
                        </header>
                        <!-- Preview image figure-->
                        <section class="mb-4">
                            <%
                                if (labNo.equals("911")){
                            %>
                                <jsp:include page="../include/labFormationB.jsp"/>
                            <%
                                }else{
                            %>
                                <jsp:include page="../include/labFormationA.jsp"/>
                            <%
                                }
                            %>
                        </section>
                    </article>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">Class</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="/reservation/situation?labNo=911" location="rsvLab.jsp">911</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="/reservation/situation?labNo=916" location="rsvLab.jsp">916</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="/reservation/situation?labNo=915" location="rsvLab.jsp">915</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="/reservation/situation?labNo=918" location="rsvLab.jsp">918</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Date widget-->
                    <div class="card mb-4">
                        <div class="card-header">Date</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input type="date" class="form-control" id="startDatetime" onchange="getRsvData(event)">
                            </div>
                        </div>
                    </div>
                    <!-- Side widget-->
                    <div class="card mb-4 timeTable">
                        <div class="card-header">Time Stamp</div>
                        <div class="card-body mb-2">
                            <table class="table table-hover" style="text-align: center; vertical-align: middle" id="rsv-time">
                                <tbody id="rsv-tbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div style="text-align: right">
                        <button type="button" class="btn btn-outline-primary" id="book-btn">예약하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer-->
    <jsp:include page="../include/footer.jsp"/>
</div>
<!-- 예약 성공 시 공지 표시 모달 -->
<div class="modal fade" id="notice-info" role="dialog" >
    <div class="modal-dialog">
        <%--modal content--%>
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">실습실 사용 공지 및 규칙</h4>
            </div>
            <div class="modal-body">
                <div class="result"><p>성공 개수: </p><span></span></div>
                <div class="notice"><p>공지 사항: </p><textarea style="width: 80%; height: 200px; overflow:auto; resize: none; border: none" readonly></textarea></div>
                <div class="rule"><p>규칙: </p><textarea style="width: 80%; height: 200px; overflow:auto; resize: none; border: none" readonly></textarea></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary " data-bs-dismiss="modal" id="close-btn">확인</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/rsv.js"></script>

</body>
</html>
