<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>boardListPage_back.jsp</title>
</head>
<body>

<h3>전체 게시물 목록</h3>
<ol>
    <c:forEach items="${boardList}" var="boardDO">
        <li>작성자: ${boardDO.userId} | 제목: ${boardDO.title} | 지역: ${boardDO.area} | 내용: ${boardDO.contents}</li>
    </c:forEach>
</ol>

</body>
</html>