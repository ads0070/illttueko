<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>일뜨코</title>
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <script src="/js/timetable.js" defer></script>
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
                            <h1 class="fw-bolder mb-1">실습실 예약</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">911 실습실 현황</div>
                        </header>
                        <!-- Preview image figure-->
                        <section class="mb-4">
                            <table class="classTable">
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th class="classTableLines" colspan="5">스크린</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td class="classTableLine">1</td>
                                    <td class="classTableLine">2</td>
                                    <td class="classTableLine">3</td>
                                    <td class="classTableLine">4</td>
                                    <td rowspan="5" align="center"></td>
                                    <td class="classTableLine">5</td>
                                    <td class="classTableLine">6</td>
                                    <td class="classTableLine">7</td>
                                    <td class="classTableLine">8</td>
                                </tr>
                                <tr>
                                    <td class="classTableLine">9</td>
                                    <td class="classTableLine">10</td>
                                    <td class="classTableLine">11</td>
                                    <td class="classTableLine">12</td>
                                    <td class="classTableLine">13</td>
                                    <td class="classTableLine">14</td>
                                    <td class="classTableLine">15</td>
                                    <td class="classTableLine">16</td>
                                </tr>
                                <tr>
                                    <td class="classTableLine">17</td>
                                    <td class="classTableLine">18</td>
                                    <td class="classTableLine">19</td>
                                    <td class="classTableLine">20</td>
                                    <td class="classTableLine">21</td>
                                    <td class="classTableLine">22</td>
                                    <td class="classTableLine">23</td>
                                    <td class="classTableLine">24</td>
                                </tr>
                                <tr>
                                    <td class="classTableLine">25</td>
                                    <td class="classTableLine">26</td>
                                    <td class="classTableLine">27</td>
                                    <td class="classTableLine">28</td>
                                    <td class="classTableLine">29</td>
                                    <td class="classTableLine">30</td>
                                    <td class="classTableLine">31</td>
                                    <td class="classTableLine">32</td>
                                </tr>
                                <tr>
                                    <td class="classTableLine">33</td>
                                    <td class="classTableLine">34</td>
                                    <td class="classTableLine">35</td>
                                    <td class="classTableLine">36</td>
                                    <td class="classTableLine">37</td>
                                    <td class="classTableLine">38</td>
                                    <td class="classTableLine">39</td>
                                    <td class="classTableLine">40</td>
                                </tr>
                            </table>
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
                                        <li><a href="/schedule-911" location="schedule911.jsp">911</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="schedule-916" location="schedule916.jsp">916</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="schedule-915" location="schedule915.jsp">915</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="schedule-918" location="schedule918.jsp">918</a></li>
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
                                <input type="date" class="form-control" id="startDatetime">
                            </div>
                        </div>
                    </div>
                    <!-- Side widget-->
                    <div class="card mb-4 timeTable">
                        <div class="card-header">Time Stamp</div>
                        <div class="card-body mb-2">
                            <table class="table table-hover" style="text-align: center; vertical-align: middle"
                                   id="test">
                                <tr>
                                    <td>00:00 ~ 00:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>01:00 ~ 01:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>02:00 ~ 02:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>03:00 ~ 03:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>04:00 ~ 04:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>05:00 ~ 05:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>06:00 ~ 06:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>07:00 ~ 07:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>08:00 ~ 08:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>09:00 ~ 09:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>10:00 ~ 10:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>11:00 ~ 11:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>12:00 ~ 12:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>13:00 ~ 13:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>14:00 ~ 14:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>15:00 ~ 15:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>16:00 ~ 16:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>17:00 ~ 17:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>18:00 ~ 18:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>19:00 ~ 19:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>20:00 ~ 20:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>21:00 ~ 21:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>22:00 ~ 22:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                                <tr>
                                    <td>23:00 ~ 23:50</td>
                                    <td style="text-align: right">잔여좌석 : 10</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div>
                        <button>예약하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer-->
    <jsp:include page="../include/footer.jsp"/>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>
