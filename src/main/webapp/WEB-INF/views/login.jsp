<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
            <form class="keyword-search keyword-search-main" name="search" method="post">
                <input type="text" name='search' id="search" class="searchText" placeholder="지역, 음식, 레스토랑명 검색" required value>
                    <button type="submit" class="searchButton">
                            <i class="fa-solid fa-magnifying-glass" style="color: #e2520f;"></i>
                    </button>
            </form>
            <form method="post" action="../../dangeun_mz_war/controller/memberController.jsp">
                <button class="menu" name="command" value="myLog">
                    <i class="fa-solid fa-bars" style="color: #e2520f;"></i>
                </button>
            </form>
        </div>
    </header>

    <section class="category">
        <div id="container-category">
            <form method="post" class="ctgr" action="../../dangeun_mz_war/controller/boardPageController.jsp">
                <input name="page" type="submit" class="btn-category" value="홈">
                <input name="page" type="submit" class="btn-category" value="게시판">
                <input name="page" type="submit" class="btn-category" value="게시글 작성">
            </form>
        </div>
    </section>

    <main>
        <div class="section-title">
            <h1>로그인</h1>
        </div>

        <form class="board-form" method="post">
            <fieldset>
                <div class="form-group">
                    <h3>아이디</h3>
                    <input type="text" name="userId" id="userId" class='form-input' placeholder="아이디를 입력하세요" />
                </div>

                <div class="form-group">
                    <h3>비밀번호</h3>
                    <input type="password" name="password" id="password" class='form-input' placeholder="비밀번호를 입력하세요" />
                </div>

                <div class="form-group">
                    <input type="hidden" name="command" value="login" />
                    <input type="submit" value="로그인" class="login btn btn-red"/>
                </div>
            </fieldset>
        </form>
        <form class="board-form" method="post">
            <fieldset>
                <div class="form-group">
                    <input type="hidden" name="command" value="join" />
                    <input type="submit" value="회원가입" class="signup btn btn-red"/>
                </div>
            </fieldset>
        </form>
    </main>
</section>

</body>

</html>