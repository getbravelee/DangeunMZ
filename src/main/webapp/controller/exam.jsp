<%@ page import="java.util.ArrayList" %>
<%@ page import="chap09.UserInfoDO" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
    if(request.getMethod().equals("POST")) {
        request.setCharacterEncoding("UTF-8");
    }
%>

<jsp:useBean id="userDAO" class="chap09.UserInfoDAO" scope="session" />
<jsp:useBean id="userDO" class="chap09.UserInfoDO" scope="page" />
<jsp:setProperty name="userDO" property="*" />

<%
    // 이번 주말 목표 : jsp 페이지에서 boardList 구현해보기!!
    if(request.getMethod().equals("POST")) {
        userDAO.insertUserInfo(userDO);
    }

    ArrayList<UserInfoDO> userList = userDAO.getAllUserInfo();
    String content = "";

    for(UserInfoDO udo : userList) {
        content += "<li>이름: " + udo.getUsername() + " | 이메일: " + udo.getEmail() + "</li>";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>jdbcTest_v2.jsp</title>
</head>
<body>

<h2>회원 등록 및 조회</h2>
<hr />

<form method="POST">
    <fieldset>
        <legend>회원 등록</legend>

        <label for="username">이름</label>
        <input type="text" name="username" id="username" required />

        <label for="email">이메일</label>
        <input type="email" name="email" id="email" required />

        <input type="submit" value="등록" />
    </fieldset>
</form>

<hr />

<h3>전체 회원 목록</h3>
<ol>
    <%= content %>
</ol>


</body>
</html>