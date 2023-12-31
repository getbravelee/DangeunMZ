<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link href="../../img/logo1.ico" rel="shortcut icon" type="image/x-icon">
    <script src="<c:url value="https://kit.fontawesome.com/f399b95bac.js"/>" crossorigin="anonymous"></script>
    <script src="<c:url value="https://unpkg.com/axios/dist/axios.min.js"/>"></script>
    <title>당근맛집 내 계정</title>
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
                    <i class="fa-solid fa-user" style="color: #e2520f;"></i>
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
            <h1>나의 계정</h1>
        </div>

        <form class="board-form" method="post">
            <div class="form-group">
                <h3>아이디</h3>
                <input type="text" name="userId" id="userId" class='form-input' value="${member.userId}" readonly>
            </div>

            <div class="form-group">
                <h3>비밀번호</h3>
                <input type="password" name="password" id="password" class='form-input' value="${member.password}">
            </div>

            <div class="form-group">
                <h3>이메일</h3>
                <input type="email" name="email" id="email" class='form-input' value="${member.email}">
            </div>

            <div class="form-group">
                <h3>이름</h3>
                <input type="text" name="name" id="name" class='form-input' value="${member.name}">
            </div>

            <div class="form-group">
                <h3>성별</h3>
                <select name="gender" id="gender" class="form-input">
                    <option value="male">남자</option>
                    <option value="female">여자</option>
                </select>
            </div>

            <div class="form-group">
                <h3>거주 지역</h3>
                <input type="text" name="area" id="area" class='form-input'value="${member.area}">
            </div>

                <div class="form-group">
                    <input type="hidden" name="command" value="updateMember" />
                    <input type="submit" class="btn btn-red" value="수정"/>
                </div>

                <div class="form-group">
                    <input type="hidden" name="command" value="deleteMember" />
                    <input type="submit" class="btn btn-red" value="회원탈퇴"/>
                </div>


            </fieldset>
        </form>

    </main>
</section>

</body>

</html>