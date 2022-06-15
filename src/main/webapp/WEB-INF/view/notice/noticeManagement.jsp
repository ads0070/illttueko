<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%
        String role = new String();
    %>
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
        <div id="input_header">
            <%
                if (role.equals("STUDENT")){
            %>
            <jsp:include page="../include/userHeader.jsp"/>
            <%
            }else if(role.equals("PROFESSOR")){
            %><jsp:include page="../include/professorHeader.jsp"/>
            <%
            }else if(role.equals("ADMIN")){
            %><jsp:include page="../include/adminHeader.jsp"/>
            <%
            }else{
            %><jsp:include page="../include/defaultHeader.jsp"/>
            <%
                }
            %>
        </div>
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
