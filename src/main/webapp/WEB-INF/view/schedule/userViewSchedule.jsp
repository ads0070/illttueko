<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%
        String role = new String();
    %>
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
    <script>
        function getCookie(name) {
            var nameOfCookie = name + "=";
            var x = 0;
            while (x <= document.cookie.length){
                var y = (x + nameOfCookie.length);
                if (document.cookie.substring(x, y) === nameOfCookie) {
                    if ((endOfCookie = document.cookie.indexOf(";", y)) === -1)
                        endOfCookie = document.cookie.length;
                    return unescape(document.cookie.substring(y, endOfCookie));
                }
                x = document.cookie.indexOf(" ", x) + 1;
                if (x == 0)
                    break;
            }
            return "";
        }

        var cookie = getCookie('JWT');
        if (cookie !== "") {
            parseJwt = JSON.parse(Base64.decode(cookie.toString().split('.')[1]));

            if(parseJwt.role === "STUDENT"){
                <% role = "STUDENT"; %>
            }else if(parseJwt.role === "PROFESSOR"){
                <% role = "PROFESSOR"; %>
            }else{
                <% role = "ADMIN"; %>
            }
        }
    </script>
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
