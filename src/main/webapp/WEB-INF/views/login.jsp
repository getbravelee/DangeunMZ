<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String msg = "";

    if(session.getAttribute("msg") != null) {
        msg = (String)session.getAttribute("msg");
    }
%>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link href="../../img/logo1.ico" rel="shortcut icon" type="image/x-icon">
    <script src="<c:url value="https://kit.fontawesome.com/f399b95bac.js"/>" crossorigin="anonymous"></script>
    <script src="<c:url value="https://unpkg.com/axios/dist/axios.min.js"/>"></script>
    <title>당근맛집 로그인</title>
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
            <h1>로그인</h1>
        </div>

        <form class="board-form" method="post" onsubmit="return saveHandler()" action="loginProc.jsp">
            <fieldset>
                <div class="form-group">
                    <h3>아이디</h3>
                    <input type="text" id="id" class='form-input' placeholder="아이디를 입력하세요" />
                </div>

                <div class="form-group">
                    <h3>비밀번호</h3>
                    <input type="password" name="passwd" id="passwd" class='form-input' placeholder="비밀번호를 입력하세요" />
                </div>

                <div class="form-group">
                    <button type="submit" id="submit" value="login" class="login btn btn-red">로그인</button>
                </div>


            </fieldset>
        </form>

        <br><h4><%= msg %></h4><br>
    </main>
</section>

</body>

</html>

