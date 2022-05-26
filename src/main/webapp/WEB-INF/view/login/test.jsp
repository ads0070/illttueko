<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>일뜨코 로그인</title>
</head>
<body>
<%
    String name = "아무무";
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");

    if (id.equals("20173193") && pwd.equals("1234")) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href='first-login.jsp'");
        script.println("</script>");
    } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('재입력 바랍니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
%>
</body>
</html>