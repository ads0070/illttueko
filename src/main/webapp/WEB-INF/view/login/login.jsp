<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <meta charset="UTF-8">
    <title>일뜨코 로그인</title>
</head>
<body>
<div id="body-wrapper">
    <div id="body-content">
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#!">일뜨코</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#!">예약</a></li>
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="/schedule-911"
                                                location="schedule911.jsp">시간표</a></li>
                        <%--                <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>--%>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href=""
                                                location="login.jsp">로그인</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="accordion-body">
            <section class="login-form">
                <div style="text-align: center">
                    <h2>
                        <image src="images/deuimage.png" alt="deu Image" width="121" height="121"></image>
                    </h2>

                </div>
                <br><br>
                <h1>Login</h1>
                <form method="post" action="test">
                    <div class="int-area">
                        <input type="text" name="id" id="id" autocomplete="off" required>
                        <label for="id">학번</label>
                    </div>
                    <div class="int-area">
                        <input type="password" name="pw" id="pw" autocomplete="off" required>
                        <label for="pw">패스워드</label>
                    </div>
                    <div class="btn-area">
                        <button id="btn" type="submit">LOGIN</button>

                    </div>
                </form>

            </section>
        </div>
    </div>
    <footer class="footer bg-dark">
        일뜨코 시간표 footer
    </footer>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>
</body>
</html>
