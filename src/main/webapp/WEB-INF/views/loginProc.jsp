<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:useBean id="loginBean" class="chap07.LoginBean" />
<jsp:setProperty name="loginBean" property="*" />

<%
    if(loginBean.isLogin()) {
        session.setAttribute("msg", loginBean.getId() + "님의 방문을 환영합니다.");
%>

<!DOCTYPE html>

<html>
<head>
    <title>loginProc.html</title>
    <meta charset="UTF-8" />
</head>

<body>
<h1>로그인 성공!</h1>
<hr />

<h4><%= session.getAttribute("msg") %></h4>
</body>
</html>

<% }
else {
    session.setAttribute("msg", "로그인에 실패했습니다. 다시 시도해주세요.");
    response.sendRedirect("login.jsp");
}
%>