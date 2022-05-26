<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <%--        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />--%>
    <meta name="description" content="세미나 등록" />
    <meta name="author" content="안대현" />
    <title>세미나 등록</title>
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
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="/schedule-911" location="schedule911.jsp">시간표</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">세미나 등록</a></li>
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
                            <h1 class="fw-bolder mb-1">세미나 등록</h1>
                            <!-- Post meta content-->
                            <div class="text-muted text=gray mb-5">세미나 일정 설정</div>
                        </header>
                        <div class="ms-6 me-6 mb-3">
                            <label for="labNumber" class="form-label"><h5><strong>실습실 번호</strong></h5></label>
                            <select class="form-select" id="labNumber">
                                <option value="none" selected disabled>==실습실 번호를 선택하세요==</option>
                                <option value="911">911</option>
                                <option value="915">915</option>
                                <option value="916">916</option>
                                <option value="918">918</option>
                            </select>
                        </div>
                        <div class="ms-6 me-6 mb-3">
                            <label for="startDatetime" class="form-label"><h5><strong>시작 시간</strong></h5></label>
                            <input type="datetime-local" class="form-control" id="startDatetime" placeholder="세미나 시작 날짜와 시간을 입력하세요.">
                        </div>
                        <div class="ms-6 me-6 mb-3">
                            <label for="endDatetime" class="form-label"><h5><strong>종료 시간</strong></h5></label>
                            <input type="datetime-local" class="form-control" id="endDatetime" placeholder="세미나 종료 날짜와 시간을 입력하세요.">
                        </div>
                        <div class="ms-6 me-6 mb-3">
                            <label for="reason" class="form-label"><h5><strong>사유</strong></h5></label>
                            <textarea class="form-control textarea-fixed" id="reason" placeholder="세미나 주제를 입력하세요."></textarea>
                        </div>
                        <div class="ms-6 me-6 mb-3">
                            <label for="organizer" class="form-label"><h5><strong>주최자</strong></h5></label>
                            <input type="text" class="form-control" id="organizer" placeholder="주최자 이름을 입력하세요.">
                        </div>
                        <div class="ms-6 me-6 mb-1">
                            <button type="button" class="btn btn-primary" style="float:right">등록</button>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer-->
    <jsp:include page="../include/footer.jsp"/>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>
</body>
</html>
