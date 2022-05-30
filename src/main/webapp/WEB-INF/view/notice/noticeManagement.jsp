<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="utf-8" />
<%--        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />--%>
        <meta name="description" content="공지사항 및 규칙 설정" />
        <meta name="author" content="안대현" />
        <title>공지 관리</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
</head>
<body>
<div id="body-wrapper">
    <div id="body-content">
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#!">일뜨코</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="#">실습실 현황</a></li>
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="/schedule-911" location="schedule911.jsp">시간표 관리</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/reservation/notice-management">공지 관리</a></li>
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="#">문의 관리</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="labManagementDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                실습실 관리
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="labManagementDropdown">
                                <li><a class="dropdown-item" href="#">예약 관리</a></li>
                                <li><a class="dropdown-item" href="#">세미나 관리</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="#">회원 관리</a></li>
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
                            <h1 class="fw-bolder mb-1">공지 관리</h1>
                            <!-- Post meta content-->
                            <div class="text-muted text=gray mb-5">공지사항 및 규칙 설정</div>
                        </header>
                        <div class="ms-6 me-6 mb-6">
                            <div class="mb-2">
                                <label for="notice" class="form-label"><h4 style=""><strong>공지사항</strong></h4></label>
                                <textarea class="form-control notice-box textarea-fixed" id="notice" placeholder="공지 내용을 입력하세요.">${notice}</textarea>
                            </div>
                            <button type="button" id="notice-patch" class="btn btn-primary" style="float:right">저장</button>
                        </div>
                        <div class="ms-6 me-6 mb-6">
                            <div class="mb-2">
                                <label for="rule" class="form-label"><h4><strong>규칙</strong></h4></label>
                                <textarea class="form-control notice-box textarea-fixed" id="rule" placeholder="규칙 내용을 입력하세요.">${rule}</textarea>
                            </div>
                            <button type="button" id="rule-patch" class="btn btn-primary" style="float:right">저장</button>
                        </div>
                    </article>
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
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/notice.js"></script>
</body>
</html>
