<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html>
<head>
  <meta charset="UTF-8">
  <title>boardPage_back.jsp</title>
</head>
<body>

<h2>게시물 등록</h2>
<hr />

<form method="POST">
  <fieldset>
    <legend>게시물 등록</legend>

    <label for="userId">작성자</label>
    <input type="text" name="userId" id="userId" required />

    <label for="title">제목</label>
    <input type="text" name="title" id="title" required />

    <label for="area">지역</label>
    <input type="text" name="area" id="area" required />

    <label for="contents">내용</label>
    <input type="text" name="contents" id="contents" required />

    <input type="submit" value="등록" />

  </fieldset>
</form>

</body>
</html>