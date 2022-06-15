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

    <meta charset="UTF-8"/>
    <title>일뜨코</title>
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">

</head>
<body>
<div id="body-wrapper">
    <div id="body-content">
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#!">일뜨코</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation"><span
                        class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="/schedule-911"
                                                location="schedule911.jsp">시간표</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/"
                                                location="classes.jsp">예약
                            현황</a></li>
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="#">로그인</a></li>
                    </ul>
                </div>
            </div>
        </nav>
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
