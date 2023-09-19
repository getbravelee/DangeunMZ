<%@ page contentType="text/html; charset=UTF-8" %>

<%
  String msg = "";

  if(session.getAttribute("msg") != null) {
    msg = (String)session.getAttribute("msg");
  }
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="../css/style.css">
  <link href="../../img/logo1.ico" rel="shortcut icon" type="image/x-icon">
  <script src="<c:url value="https://kit.fontawesome.com/f399b95bac.js"/>" crossorigin="anonymous"></script>
  <script src="<c:url value="https://unpkg.com/axios/dist/axios.min.js"/>"></script>
  <title>당근맛집 회원가입</title>
</head>

<body>
<section class="wrapper">
  <header id="header">
    <div class="container">
      <div class="header-left">
        <h1 class="brand">C</h1>
      </div>
      <form class="keyword-search keyword-search-main" name="search" action="searchListPage.html">
        <input type="text" name='search' id="search" class="searchText" placeholder="지역, 음식, 레스토랑명 검색" required value>
        <button type="submit" class="searchButton">
          <i class="fa-solid fa-magnifying-glass" style="color: #e2520f;"></i>
        </button>
      </form>
      <button class="menu">
        <i class="fa-solid fa-bars" style="color: #e2520f;"></i>
      </button>
  </header>

  <section class="category">
    <div id="container-category">
      <button type="button" class="btn-category" onclick="location.href='./index.html'">홈</button>
      <button type="button" class="btn-category" onclick="location.href='./boardListPage.html'">게시판</button>
      <button type="button" class="btn-category" onclick="location.href='./boardPage.html'">게시글 작성</button>
    </div>
  </section>

  <main>
    <div class="section-title">
      <h1>회원가입</h1>
    </div>

    <form class="board-form" method="post" onsubmit="return saveHandler()" action="login.jsp">
      <fieldset>
        <div class="form-group">
          <h3>아이디</h3>
          <input type="text" id="id" class='form-input' placeholder="아이디를 입력하세요">
        </div>

        <div class="form-group">
          <h3>비밀번호</h3>
          <input type="password" name="passwd" id="passwd" class='form-input' placeholder="비밀번호를 입력하세요">
        </div>

        <div class="form-group">
          <h3>이메일</h3>
          <input type="email" name="email" id="email" class='form-input' placeholder="이메일을 입력하세요">
        </div>

        <div class="form-group">
          <h3>이름</h3>
          <input type="text" id="name" class='form-input' placeholder="이름을 입력하세요">
        </div>

        <div class="form-group">
          <h3>생년월일</h3>
          <input type="date" id="date" class='form-input' placeholder="생년월일을 입력하세요">
        </div>

        <div class="form-group">
          <h3>성별</h3>
          <select id="gender" class="form-input">
            <option value="male">남자</option>
            <option value="female">여자</option>
          </select>
        </div>

        <div class="form-group">
          <h3>전화번호</h3>
          <input type="tel" id="phoneNo" class='form-input' placeholder="전화번호를 입력하세요">
        </div>

        <div class="form-group">
          <button type="submit" class="btn btn-red">등록</button>
        </div>


      </fieldset>
    </form>

    <br><h4><%= msg %></h4><br>
  </main>
</section>

</body>

</html>

