<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BoardDO" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
    if(request.getMethod().equals("POST")) {
        request.setCharacterEncoding("UTF-8");
    }
%>

<jsp:useBean id="userDAO" class="model.BoardDAO" scope="session" />
<jsp:useBean id="userDO" class="model.BoardDO" scope="page" />
<jsp:setProperty name="userDO" property="*" />

<%
    if(request.getMethod().equals("POST")) {
        userDAO.insertUserInfo(userDO);
    }

    ArrayList<UserInfoDO> userList = userDAO.getAllUserInfo();
    String content = "";

    for(UserInfoDO udo : userList) {
        content += "<li>이름: " + udo.getUsername() + " | 이메일: " + udo.getEmail() + "</li>";
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

</body>
</html>
