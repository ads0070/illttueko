<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <%--        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />--%>
    <meta name="description" content="세미나 관리" />
    <meta name="author" content="안대현" />
    <title>세미나 관리</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
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
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="#">공지 관리</a></li>
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="#">문의 관리</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link active dropdown-toggle" href="#" id="labManagementDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
                            <h1 class="fw-bolder mb-1">세미나 관리</h1>
                            <!-- Post meta content-->
                            <div class="text-muted text=gray mb-5">세미나 일정 관리</div>
                        </header>
                    </article>
                    <div class="col-lg-12">
                        <div class="table-responsive mb-6" style="width:100%; height:500px; overflow: auto">
                            <table id="seminar-table" class="table table-hover table-overflow-text datatable-tr datatable-td" style="table-layout: fixed; text-align: center; vertical-align: middle;">
                                <thead>
                                <tr>
                                    <th>No</th>
                                    <th>실습실 번호</th>
                                    <th>시작 시간</th>
                                    <th>종료 시간</th>
                                    <th>사유</th>
                                    <th>주최자</th>
                                </tr>
                                </thead>
                                <tbody id="seminar-body">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer-->
    <jsp:include page="../include/footer.jsp"/>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/manageSeminar.js"></script>
</body>
</html>
