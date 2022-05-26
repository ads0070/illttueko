<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <meta charset="UTF-8"> <title>시간표 관리</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#!">일뜨코</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="#!">실습실 현황</a></li>
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/schedule-911management" location="schedule-911management.jsp">시간표 관리</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">공지 관리</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">문의 관리</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">예약 관리</a></li>
                <li class="nav-item"><a class="nav-link" href="/user-management"
                                        location="user-management.jsp">회원 관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="#">로그아웃</a></li>
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
                    <h1 class="fw-bolder mb-1">실습실 시간표 관리</h1>
                    <div class="text-muted fst-italic mb-2">911 실습실 시간표</div>
                </header>
                <table cellspacing="5" align="center" border="1" bordercolor="#f6f6f6" width="550" height="600">
                    <tr align="center"> <td width="50"></td>
                        <td width="100" bgcolor="#FFFFFF" >월</td>
                        <td width="100" bgcolor="#FFFFFF">화</td>
                        <td width="100" bgcolor="#FFFFFF">수</td>
                        <td width="100" bgcolor="#FFFFFF">목</td>
                        <td width="100" bgcolor="#FFFFFF">금</td>
                    </tr>
                    <tr align="center">
                        <td bgcolor="#FFFFFF">1</td>
                        <td></td> <td bgcolor="#CCFFCC">전산실무</td>
                        <td></td> <td></td> <td></td>
                    </tr>
                    <tr align="center">
                        <td bgcolor="#FFFFFF">2</td> <td></td>
                        <td bgcolor="#99CCCC">포토샾</td>
                        <td></td> <td></td> <td></td>
                    </tr>
                    <tr align="center">
                        <td bgcolor="#FFFFFF">3</td>
                        <td bgcolor="#FF9999">플레시</td>
                        <td bgcolor="#99CCCC">포토샾</td>
                        <td bgcolor="#FF9999">플래시</td>
                        <td></td> <td bgcolor="#CCFFFF">컴퓨터그래픽</td>
                    </tr>
                    <tr align="center"> <td bgcolor="#FFFFFF">4</td>
                        <td bgcolor="#FF9999">플래시</td> <td></td> <td></td>
                        <td bgcolor="#9966FF">전산개론</td> <td bgcolor="#CCFFFF">컴퓨터그래픽</td>
                    </tr>
                    <tr align="center"> <td bgcolor="#FFFFFF">5</td> <td></td>
                        <td bgcolor="#9966FF">전산개론</td> <td></td> <td></td> <td></td>
                    </tr>
                    <tr align="center"> <td bgcolor="#FFFFFF">6</td> <td></td>
                        <td bgcolor="#9966FF">전산개론</td> <td bgcolor="#999966">웹디자인</td>
                        <td></td> <td bgcolor="#999966">웹디자인</td>
                    </tr>
                    <tr align="center">
                        <td bgcolor="#FFFFFF">7</td> <td bgcolor="#FFFF99">웹디자인</td> <td></td>
                        <td bgcolor="#FFFFCC">웹디자인</td> <td bgcolor="#9999FF">운영체제</td>
                        <td></td>
                    </tr>
                    <tr align="center">
                        <td bgcolor="#FFFFFF">8</td>
                        <td></td> <td></td> <td></td> <td bgcolor="#CCFFFF">운영체제</td>
                        <td></td>
                    </tr>
                    <tr align="center">
                        <td></td>
                        <td colspan="5" bgcolor="#ffffff">동의대학교 실습실별 시간표</td>
                    </tr>
                </table>


                <!-- Post content-->
                <section class="mb-5">

                </section>
            </article>
            <!-- Comments section-->
            <section class="mb-5">

            </section>
        </div>

        <div class="col-lg-4">
            <div class="card mb-4">
                <div class="card-header">Class 시간표</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <ul class="list-unstyled mb-0">
                                <li><a href="/schedule-911management" location="schedule-911management.jsp">911</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <ul class="list-unstyled mb-0">
                                <li><a href="/schedule-916management" location="schedule-916management.jsp">916</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <ul class="list-unstyled mb-0">
                                <li><a href="/schedule-915management" location="schedule-915management.jsp">915</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <ul class="list-unstyled mb-0">
                                <li><a href="/schedule-918management" location="schedule-918management.jsp">918</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Side widget-->
            <div class="card mb-4">
            <div class="card-header">정보 입력</div>
            <div class="card-body">
                <form>

                        요일 선택 : <select name = "요일선택">
                            <option value="none" selected>요일 선택</option>
                            <option value="월">월</option>
                            <option value="화">화</option>
                            <option value="수">수</option>
                            <option value="목">목</option>
                            <option value="금">금</option>
                            </select><br>

                        시작 시간 : <input type="time" name="starttime"><br>
                        종료 시간 : <input type="time" name="endtime"><br>
                        과목 이름 :  <input type="text" name="subject"><br>


                    <input type="button" name="submit" value="삽입">
                    <input type="button" name="delete" value="삭제">
                </form>                
            </div>
            </div>
        </div>
    </div>
</div>



<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">일뜨코 시간표 관리footer</p></div>
</footer>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>

</body>
</html>