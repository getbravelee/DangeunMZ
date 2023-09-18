<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/style.css">
    <link href="../../img/logo1.ico" rel="shortcut icon" type="image/x-icon">
    <script src="https://kit.fontawesome.com/f399b95bac.js" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <title>당근맛집 게시글 작성</title>
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
        </div>
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
            <h1>게시판</h1>
        </div>

        <form class="board-form" method="get" onsubmit="return saveHandler()" action="boardListPage.html">

            <div class="form-group">
                <h3>작성자</h3>
                <input type="text" id="author" maxlength="20" class='form-input' placeholder="닉네임을 입력하세요">
            </div>

            <div class="form-group">
                <h3>제목</h3>
                <input type="text" id="title" maxlength="2000" class='form-input' placeholder="제목을 입력하세요">
            </div>

            <div class="form-group">
                <h3>방문일</h3>
                <input type="date" id="date" maxlength="200" class='form-input' placeholder="방문일을 입력하세요">
            </div>

            <div class="form-group">
                <h3>지역</h3>
                <select id="area" class="form-input">
                    <option value="동구">지역을 선택해 주세요</option>
                    <option value="동구">동구</option>
                    <option value="서구">서구</option>
                    <option value="남구">남구</option>
                    <option value="북구">북구</option>
                    <option value="수영구">수영구</option>
                    <option value="해운대구">해운대구</option>
                    <option value="부산진구">부산진구</option>
                    <option value="동래구">동래구</option>
                </select>
            </div>

            <div class="form-group">
                <h3>이미지 선택</h3>
                <input type="number" id="img" maxlength="2000" class='form-input' placeholder="이미지 번호를 입력하세요"
                       style="margin-bottom: 15px;">
                <div class="container-img">
                    <img src="../../img/1.jpg" width="146" height="130" class="select-img">
                    <img src="../../img/연어.jpg" width="146" height="130" class="select-img">
                    <img src="../../img/피자.jpg" width="146" height="130" class="select-img">
                    <img src="../../img/수육.jpg" width="146" height="130" class="select-img">
                    <img src="../../img/꼬치.jpg" width="146" height="130" class="select-img">
                    <img src="../../img/전.jpg" width="146" height="130" class="select-img">
                    <img src="../../img/쭈꾸미.jpg" width="146" height="130" class="select-img">
                </div>
            </div>
            </div>

            <div class="form-group">
                <h3>내용</h3>
                <!-- <textarea id="content" class="form-input" rows="10" style="font-size: 18px;">[동네] : &#10;&#10;[주차] : &#10;&#10;[맵기] : &#10;&#10;[가게 후기] : &#10;&#10;[기타 사항] : </textarea> -->
                <textarea id="content" class="form-input" rows="10" style="font-size: 18px;" placeholder="내용을 입력하세요"></textarea>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-red">등록</button>
            </div>

        </form>
    </main>
</section>
<script src="./boardPage.js"></script>
</body>

</html>