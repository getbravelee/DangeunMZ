<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>updateBoardPage_back.jsp</title>
</head>
<body>

<h2>수정 게시물 등록</h2>
<hr />

<form method="POST">
    <fieldset>
        <legend>수정 게시물 등록</legend>

        <label for="userId">작성자</label>
        <input type="text" name="userId" id="userId" value="${board.userId}" required />

        <label for="title">제목</label>
        <input type="text" name="title" id="title" value="${board.title}" required />

        <label for="area">지역</label>
        <input type="text" name="area" id="area" value="${board.area}" required />

        <label for="contents">내용</label>
        <input type="text" name="contents" id="contents" value="${board.contents}" required />

        <input type="hidden" name="updateBoard" value="${board.boardNo}">
        <input type="submit" value="수정하기" />

    </fieldset>
</form>

</body>
</html>
