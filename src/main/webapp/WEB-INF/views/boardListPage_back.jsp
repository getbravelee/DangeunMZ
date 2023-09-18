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
        <li>작성자: ${boardDO.userId} | 제목: ${boardDO.title} | 지역: ${boardDO.area} | 지역: ${boardDO.contents}</li>
        <form method="POST">
            <input type="hidden" name="update" value="${boardDO.boardNo}"/>
            <input type="submit"  value="수정"/>
        </form>

        <form method="POST">
            <input type="hidden" name="delete" value="${boardDO.boardNo}"/>
            <input type="submit" value="삭제"/>
        </form>
    </c:forEach>
</ol>

</body>
</html>