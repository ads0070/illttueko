<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <meta charset="UTF-8">
    <title>시간표</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="/js/timetable.js"></script>
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
                        <li class="nav-item"><a class="nav-link" href="#!">예약</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/schedule-911"
                                                location="schedule911.jsp">시간표</a></li>
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="/"
                                                location="login.jsp">로그인</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">실습실 시간표 조회</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2" id="class_title"></div>
                        </header>
                        <table cellspacing="5" align="center" border="1" bordercolor="#f6f6f6" width="550" height="600">
                            <tr align="center">
                                <td width="50" style="border-color: #0f5132; border-style: double"></td>
                                <td width="100" bgcolor="#FFFFFF" style="border-color: #0f5132; border-style: double">월</td>
                                <td width="100" bgcolor="#FFFFFF" style="border-color: #0f5132; border-style: double">화</td>
                                <td width="100" bgcolor="#FFFFFF" style="border-color: #0f5132; border-style: double">수</td>
                                <td width="100" bgcolor="#FFFFFF" style="border-color: #0f5132; border-style: double">목</td>
                                <td width="100" bgcolor="#FFFFFF" style="border-color: #0f5132; border-style: double">금</td>
                            </tr>
                            <tbody id="classTable">
                            <tr align="center" id="one">
                                <td bgcolor="#FFFFFF" style="border-color: #0f5132; border-style: double">1</td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                            </tr>
                            <tr align="center" id="two">
                                <td bgcolor="#FFFFFF" style="border-color: #0f5132; border-style: double">2</td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                            </tr>
                            <tr align="center" id="three">
                                <td bgcolor="#FFFFFF" style="border-color: #0f5132; border-style: double">3</td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                            </tr>
                            <tr align="center" id="four">
                                <td bgcolor="#FFFFFF" style="border-color: #0f5132; border-style: double">4</td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                            </tr>
                            <tr align="center" id="five">
                                <td bgcolor="#FFFFFF" style="border-color: #0f5132; border-style: double">5</td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                            </tr>
                            <tr align="center" id="six">
                                <td bgcolor="#FFFFFF" style="border-color: #0f5132; border-style: double">6</td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                            </tr>
                            <tr align="center" id="seven">
                                <td bgcolor="#FFFFFF" style="border-color: #0f5132; border-style: double">7</td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                            </tr>
                            <tr align="center" id="eight">
                                <td bgcolor="#FFFFFF" style="border-color: #0f5132; border-style: double">8</td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td style="border-color: #0f5132; border-style: double"></td>
                            </tr>
                            </tbody>
                            <tr align="center">
                                <td style="border-color: #0f5132; border-style: double"></td>
                                <td colspan="5" bgcolor="#ffffff" style="border-color: #0f5132; border-style: double">동의대학교 실습실별 시간표</td>
                            </tr>
                        </table>

                        <section class="mb-5">
                        </section>
                    </article>
                    <!-- Comments section-->
                    <section class="mb-5">

                    </section>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">


                    <!-- Categories widget-->
                    <div class="cards mb-4">
                        <div class="card-header">Class 시간표</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#" id="class911">911</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#" id="class916">916</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#" id="class915">915</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#" id="class918">918</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../include/footer.jsp"/>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>
</body>
</html>
