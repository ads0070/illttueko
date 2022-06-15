<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%
        String role = new String();
    %>
    <meta charset="UTF-8"/>
    <title>일뜨코</title>
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
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
                        <div style="text-align: right; margin-bottom: 10px" id="representative">
                            담당 학생 : 911 : 김기태<br> 915 : 안대현<br> 916 : 강경빈<br> 918 : 구본영
                        </div>
                        <div class="table-responsive mb-4" style="width:100%; height:670px;">
                            <table id="manageRsv-table" class="table table-hover datatable-tr datatable-td"
                                   style="text-align: center;">

                            </table>

                        </div>
                    </section>
                </article>
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
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 80px;">아니오
                </button>
                <button type="button" class="btn btn-primary" id="deleteRsv" style="width: 80px;">예</button>
            </div>
        </div>
    </div>
</div>

<!-- 승인 모달 -->
<div class="modal fade" id="approveModal" tabindex="-1" aria-labelledby="approveModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="approveModalLabel">예약 승인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                해당 예약을 승인하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="disapproveRsv" data-bs-dismiss="modal" style="width: 80px;">취소
                </button>
                <button type="button" class="btn btn-primary" id="approveRsv" style="width: 80px;">예</button>
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
<script src="/js/admin/manageRsv.js"></script>

</body>
</html>
