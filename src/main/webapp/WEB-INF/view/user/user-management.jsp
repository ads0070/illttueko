<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <meta charset="UTF-8">
    <title>회원 관리</title>
</head>
<body>
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#!">일뜨코</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="#!">실습실 현황</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/schedule-911management"
                                        location="schedule-911management.jsp">시간표 관리</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">공지 관리</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">문의 관리</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">예약 관리</a></li>
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/user-management"
                                        location="user-management.jsp">회원 관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="#">로그아웃</a></li>
            </ul>
        </div>
    </div>
</nav>
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
                    <table id="user-table" class="table table-hover" style="text-align: center; vertical-align: middle">
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
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>20181234</td>
                                <td>알파캉</td>
                                <td>010-1231-3321</td>
                                <td>alpaka@gmail.com</td>
                                <td>3</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>20181234</td>
                                <td>알파캉</td>
                                <td>010-1231-3321</td>
                                <td>alpaka@gmail.com</td>
                                <td>3</td>
                            </tr>

                            </tbody>
                        </div>
                    </table>
                    <%--modal--%>
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">
                            <%--modal content--%>
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">학생 상세 정보 관리</h4>

                                    </div>
                                    <div class="modal-body">
                                        <div class="no"><p>no: </p><span></span></div>
                                        <div class="studentid"><p>학번: </p><span></span></div>
                                        <div class="name"><p>이름: </p><span></span></div>
                                        <div class="phone"><p>전화번호: </p><span></span></div>
                                        <div class="email"><p>이메일: </p><span></span></div>
                                        <div class="red"><p>경고: </p><span></span></div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary " id="modelModBtn">수정</button>
                                        <button type="button" class="btn btn-secondary " id="modelDelBtn">삭제</button>
                                        <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">취소</button>
                                    </div>
                                </div>
                        </div>
                    </div>
                    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
                    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
                            <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
                    <style>
                            .modal-body div{float:left; width: 100%}
                            .modal-body div p{float:left; width: 20%; font-weight: 600;}
                            .modal-body div span{float:left; width: 80%}
                    </style>
                    <script src="/js/scripts.js"></script>
                </div>
            </article>
        </div>
    </div>
</div>
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">일뜨코 시간표 footer</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>
</body>
</html>
