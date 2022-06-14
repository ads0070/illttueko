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
                            <table class="table table-hover" style="text-align: center; vertical-align: middle"
                                   id="rsv-time">
                                <tr class="rsvTimeTable">
                                    <td>00:00 ~ 00:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td >01:00 ~ 01:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>02:00 ~ 02:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>03:00 ~ 03:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>04:00 ~ 04:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>05:00 ~ 05:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>06:00 ~ 06:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>07:00 ~ 07:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>08:00 ~ 08:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>09:00 ~ 09:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>10:00 ~ 10:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>11:00 ~ 11:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>12:00 ~ 12:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>13:00 ~ 13:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>14:00 ~ 14:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>15:00 ~ 15:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>16:00 ~ 16:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>17:00 ~ 17:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>18:00 ~ 18:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>19:00 ~ 19:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>20:00 ~ 20:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>21:00 ~ 21:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>22:00 ~ 22:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr class="rsvTimeTable">
                                    <td>23:00 ~ 23:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div style="text-align: right">
                        <button type="button" class="btn btn-outline-primary">예약하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer-->
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
<script src="/js/rsv.js"></script>

</body>
</html>
