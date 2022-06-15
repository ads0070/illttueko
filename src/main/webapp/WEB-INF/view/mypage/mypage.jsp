<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- 추가한 css : ms-6, me-6, mb-6, (html, body), body-wrapper, body-content, textarea-fixed, notice-box,
footer, -webkit-inner-spin-button(input number타입의 오른쪽 화살표 제거) -->
<head>
    <meta charset="utf-8" />
    <%--        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />--%>
    <meta name="description" content="고장 및 문의 내용 확인 및 처리" />
    <meta name="author" content="안대현" />
    <title>마이페이지</title>
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
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="/schedule-911" location="schedule911.jsp">시간표</a></li>
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="#">예약하기</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">마이페이지</a></li>
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
                            <h1 class="fw-bolder mb-1">마이페이지</h1>
                        </header>
                        <nav class="nav nav-tabs mb-3">
                            <a class="nav-link active" id="my-rsv">나의 예약</a>
                            <a class="nav-link" id="my-warn">경고 정보</a>
                            <a class="nav-link" id="my-inquiry">문의 정보</a>
                            <button type="button" class="btn nav-link" id="my-profile">나의 정보</button>
                        </nav>
                    </article>

                    <div class="table-responsive mb-6" style="width:100%; height:500px; overflow: auto">
                        <table id="book-table" class="table table-hover datatable-tr datatable-td" style="text-align: center;">

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer-->
    <jsp:include page="../include/footer.jsp"/>
</div>
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
                <button type="button" class="btn btn-primary" id="deleteRsv" style="width: 80px;">예</button>
            </div>
        </div>
    </div>
</div>
<!-- 문의 모달 -->
<div class="modal fade" id="inquiryModal" tabindex="-1" aria-labelledby="inquiryModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="inquiryModalLabel">문의하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="btn-group btn-group-toggle mb-1" data-toggle="buttons">
                        <label class="col-form-label">문의 유형</label><br>
                        <label class="btn btn-light">
                            <input type="radio" name="inquiry-type-radio" id="inquiry-type-radio-1"> 고장 문의
                        </label>
                        <label class="btn btn-light">
                            <input type="radio" name="inquiry-type-radio" id="inquiry-type-radio-2"> 일반 문의
                        </label>
                    </div>
                    <div class="mb-3">
                        <label for="inquiry-text" class="col-form-label">문의 내용:</label>
                        <textarea class="form-control textarea-fixed" style="height: 100px" id="inquiry-text"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary">문의하기</button>
            </div>
        </div>
    </div>
</div>
<!-- 예약 정보 모달 -->
<div class="modal fade" id="book-info" role="dialog">
    <div class="modal-dialog">
        <%--modal content--%>
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">예약 정보</h4>
            </div>
            <div class="modal-body">
                <div class="no"><p>예약 번호: </p><span></span></div>
                <div class="lab"><p>실습실: </p><span></span></div>
                <div class="seat"><p>좌석 번호: </p><span></span></div>
                <div class="startTime"><p>시작 시간: </p><span></span></div>
                <div class="endTime"><p>종료 시간: </p><span></span></div>
                <div class="confirmState"><p>승인 상태: </p><span></span></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- 나의 정보 모달 -->
<div class="modal fade" id="myProfile-info" role="dialog">
    <div class="modal-dialog">
        <%--modal content--%>
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">나의 정보</h4>
            </div>
            <div class="modal-body">
                <div class="studentNo"><p>학번: </p><span style="padding-left: 12px"></span></div>
                <div class="name"><p>이름: </p><span style="padding-left: 12px"></span></div>
                <div class="email"><p>email: </p><label>
                    <input type="text" class="email form-control" style="height: 30px; width: 200px;" id="email"/>
                </label><span></span></div>
                <div class="phone"><p>전화번호: </p><label>
                    <input type="text" class="phone form-control" style="height: 30px; width: 200px;" id="phone"/>
                </label><span></span></div>
                <div class="password"><p>비밀번호: </p><label>
                    <input type="password" class="password form-control" style="height: 30px; width: 200px;" id="password"/>
                </label><span></span></div>
                <div class="warn"><p>경고 횟수: </p><span style="padding-left: 12px"></span></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="modifyInfo">변경</button>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/mypage.js"></script>
</body>
</html>