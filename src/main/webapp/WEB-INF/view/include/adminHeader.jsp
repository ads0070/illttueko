<%--
  Created by IntelliJ IDEA.
  User: kimgitae
  Date: 2022/06/15
  Time: 5:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="https://illttueko.shop/reservation/situation">일뜨코</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" aria-current="page" href="https://illttueko.shop/reservation/situation">실습실 현황</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="https://illttueko.shop/schedule/class-management">시간표 관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="https://illttueko.shop/reservation/notice-management">공지 관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="https://illttueko.shop/test/inquiry">문의 관리</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle active" href="#" id="labManagementDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        실습실 관리
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="labManagementDropdown">
                        <li><a class="dropdown-item" href="https://illttueko.shop/account/reservation">예약 관리</a></li>
                        <li><a class="dropdown-item" href="https://illttueko.shop/seminar/view-manage">세미나 관리</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="https://illttueko.shop/account/user-management">회원 관리</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="#">로그아웃</a></li>
            </ul>
        </div>
    </div>
</nav>
</html>
