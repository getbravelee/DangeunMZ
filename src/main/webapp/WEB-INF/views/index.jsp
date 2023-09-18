<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link href="../../img/logo1.ico" rel="shortcut icon" type="image/x-icon">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/f399b95bac.js" crossorigin="anonymous"></script>

    <title>당근맛집에 오신 것을 환영합니다</title>
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

        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="./backgroundimg/back4.jpg" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="./backgroundimg/opinion.jpg" alt="">
                </div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
        </div>

        <section class="section sTimeLine">
            <div class="container timeline">
                <div class="section-header">
                    <div class="contents-header">
                        <h2 class="section-title">타임라인</h2>
                        <p style="color: rgb(98, 98, 98);">맛집 공유, 이제 당근맛집에서!</p>
                    </div>
                    <a href="./boardListPage.html" class="btn-more">전체보기</a>
                </div>
                <div class="section-body">
                    <div id="displayMain">
                    </div>
                </div>
            </div>
        </section>

    </main>

</section>


<script>
    var swiper = new Swiper(".mySwiper", {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });

</script>
<script src="./index.js"></script>
</body>

</html>