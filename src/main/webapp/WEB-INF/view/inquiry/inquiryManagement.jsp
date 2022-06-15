<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- 추가한 css : ms-6, me-6, mb-6, (html, body), body-wrapper, body-content, textarea-fixed,
footer, -webkit-inner-spin-button(input number타입의 오른쪽 화살표 제거) -->

<head>
    <%
        String role = new String();
    %>
    <meta charset="utf-8" />
    <%--        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />--%>
    <meta name="description" content="예약, 경고, 신고 정보 확인" />
    <meta name="author" content="안대현" />
    <title>문의 관리</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
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
                <div class="col-lg-12">
                    <!-- Post header-->
                    <header class="mb-4">
                        <!-- Post title-->
                        <h1 class="fw-bolder mb-1">문의 관리</h1>
                    </header>
                </div>
                <div class="col-lg-12">
                    <!-- Post content-->
                    <article>
                        <nav class="nav nav-tabs mb-3">
                            <a class="nav-link active" href="#">고장</a>
                            <a class="nav-link" href="#">문의</a>
                        </nav>
                    </article>
                    <div class="col-lg-12">
                        <div class="table-responsive mb-6" style="width:100%; height:500px; overflow: auto">
                            <table id="inquiry-table" class="table table-hover table-overflow-text datatable-tr datatable-td" style="table-layout: fixed; text-align: center; vertical-align: middle;">
                                <thead>
                                <tr>
                                    <th>No</th>
                                    <th>문의 날짜</th>
                                    <th>문의 시간</th>
                                    <th>학번</th>
                                    <th>이름</th>
                                    <th>실습실</th>
                                    <th>좌석 번호</th>
                                    <th>내용</th>
                                    <th>처리 상태</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>2022-05-25</td>
                                    <td>19:00</td>
                                    <td>20173217</td>
                                    <td>안대현</td>
                                    <td>911</td>
                                    <td>10</td>
                                    <td>마우스 고장났어요! </td>
                                    <td>처리 전</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>2022-05-25</td>
                                    <td>19:00</td>
                                    <td>20173224</td>
                                    <td>김기태</td>
                                    <td>915</td>
                                    <td>18</td>
                                    <td>Enter 키가 없어요</td>
                                    <td>처리 중</td>
                                </tr>
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
<!-- 문의 정보 모달 -->
<div class="modal fade" id="inquiry-info" role="dialog">
    <div class="modal-dialog">
        <%--modal content--%>
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">문의 정보</h4>
            </div>
            <div class="modal-body">
                <div class="no"><p>문의 번호: </p><span></span></div>
                <div class="date"><p>문의 날짜: </p><span></span></div>
                <div class="time"><p>문의 시간: </p><span></span></div>
                <div class="stuNum"><p>학번: </p><span></span></div>
                <div class="name"><p>이름: </p><span></span></div>
                <div class="lab"><p>실습실: </p><span></span></div>
                <div class="seat"><p>좌석 번호: </p><span></span></div>
                <div class="contents"><p>내용: </p><span style="overflow-y:scroll;height:100px;"></span></div>
                <div class="mt-1">
                    <label for="processState" class="control-label mb-1"><strong>처리 상태:</strong></label>
                    <div class="">
                        <select id="processState" class="form-select">
                            <option value="처리 전">처리 전</option>
                            <option value="처리 중">처리 중</option>
                            <option value="처리 완료">처리 완료</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary">변경</button>
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
<script src="/js/scripts.js"></script>
</body>
</html>