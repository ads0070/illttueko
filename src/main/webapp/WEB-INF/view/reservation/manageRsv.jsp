<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>일뜨코</title>
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
</head>
<body>
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#!">일뜨코</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" aria-current="page" href="#">실습실 현황</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="#">시간표 관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="#">공지 관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="#">문의 관리</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle active" href="#" id="labManagementDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
<bodywrapper>
    <div class="container mt-5">
            <div class="col-lg-12">
                <!-- Post content-->
                <article>
                    <!-- Post header-->
                    <header class="mb-4">
                        <!-- Post title-->
                        <h1 class="fw-bolder mb-1">예약 관리</h1>
                    </header>
                    <!-- Preview image figure-->
                    <section class="mb-4">
                        <div class="table-responsive mb-6" style="width:100%; height:670px;">
                            <table id="manageRsv-table" class="table table-hover datatable-tr datatable-td" style="text-align: center;">
                                <thead>
                                <tr>
                                    <th>No</th>
                                    <th>학번</th>
                                    <th>이름</th>
                                    <th>실습실</th>
                                    <th>좌석</th>
                                    <th>시작 시간</th>
                                    <th>종료 시간</th>
                                    <th>예약 시간</th>
                                    <th>승인 상태</th>
                                    <th>예약 취소</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>20173152</td>
                                    <td>알파카</td>
                                    <td>911</td>
                                    <td>15</td>
                                    <td>2022-05-25T18:00</td>
                                    <td>2022-05-25T19:00</td>
                                    <td>2022-05-25T11:00</td>
                                    <td><button type="button" class="btn btn-outline-dark tbtn" data-bs-toggle="button" autocomplete="off">미승인</button></td>
                                    <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#cancelModal">취소</button></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>20173217</td>
                                    <td>공구리</td>
                                    <td>915</td>
                                    <td>5</td>
                                    <td>2022-05-24T18:00</td>
                                    <td>2022-05-24T22:00</td>
                                    <td>2022-05-23T13:00</td>
                                    <td><button type="button" class="btn btn-outline-dark tbtn" data-bs-toggle="button" autocomplete="off">미승인</button></td>
                                    <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#cancelModal">취소</button></td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                    </section>
                </article>
            </div>
    </div>
</bodywrapper>
<!-- Footer-->
<footer class="py-4 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Made By 일뜨코 <br/> Developer Kang Kyung Bin, Kim Gi Tae, An Dae Hyeon</p></div>
</footer>

<!-- 예약 취소 모달 -->
<div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cancelModalLabel">예약 취소</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                해당 예약을 취소하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 80px;">아니오</button>
                <button type="button" class="btn btn-primary" style="width: 80px;">예</button>
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
    <script src="/js/scripts.js"></script>

</body>
</html>
