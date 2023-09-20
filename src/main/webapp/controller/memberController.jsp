<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
    if(request.getMethod().equals("POST")) {
        request.setCharacterEncoding("UTF-8");
        String command = request.getParameter("command");
        MemberDAO memberDAO = new MemberDAO();

        // login 기능
        if(command != null && command.equals("login")){
            String script = "";
            int result = memberDAO.isLogin(request.getParameter("userId"), request.getParameter("password"));
            switch(result) {
                case 1 : pageContext.forward("/WEB-INF/views/index.jsp");
                    break;
                case 0 : script = "alert('비밀번호가 틀립니다.');";
                    break;
                case-1 : script = "alert('존재하지 않는 아이디입니다.');";
                    break;
                case-2 : script = "alert('데이터베이스 오류입니다.');";
                    break;
            }

        }
        else if(command != null && command.equals("join")) {
            pageContext.forward("/WEB-INF/views/join.jsp");
        }

        // 회원가입 기능
        else if(command != null && command.equals("insertMember")) {
            MemberDO memberDO = new MemberDO();
            memberDO.setUserId(request.getParameter("userId"));
            memberDO.setPassword(request.getParameter("password"));
            memberDO.setEmail(request.getParameter("email"));
            memberDO.setName(request.getParameter("name"));
            memberDO.setGender(request.getParameter("gender"));
            memberDO.setArea(request.getParameter("area"));
            memberDAO.insertMemberInfo(memberDO);
            pageContext.forward("/WEB-INF/views/login.jsp");
        }
    }

    // memberController 기본화면
    pageContext.forward("/WEB-INF/views/login.jsp");

%>
</body>
</html>