<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link href="../../img/logo1.ico" rel="shortcut icon" type="image/x-icon">
    <script src="<c:url value="https://unpkg.com/swiper/swiper-bundle.min.js"/>"></script>
    <script src="<c:url value="https://kit.fontawesome.com/f399b95bac.js"/>" crossorigin="anonymous"></script>
    <script src="<c:url value="https://unpkg.com/axios/dist/axios.min.js"/>"></script>

    <title>당근맛집에 오신 것을 환영합니다</title>
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
            <form method="post">
                <button class="menu" name="login" value="login">
                    <i class="fa-solid fa-bars" style="color: #e2520f;"></i>
                </button>
            </form>
        </div>
    </header>

    <section class="category">
        <div id="container-category">
            <form method="post" class="ctgr">
                <input name="page" type="submit" class="btn-category" value="홈">
                <input name="page" type="submit" class="btn-category" value="게시판">
                <input name="page" type="submit" class="btn-category" value="게시글 작성">
            </form>
        </div>
    </section>


    <main>

        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="../backgroundimg/back4.jpg" alt="1">
                </div>
                <div class="swiper-slide">
                    <img src="../backgroundimg/opinion.jpg" alt="2">
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
                        <c:forEach items="${boardList}" var="boardDO">
                            <div class="restaurant-list-item">
                                <div class="img">
<%--                                    <a href="${url}?search=${boardDO.userId}"><img src="${--%>
<%--                              imgs[board.img]--%>
<%--                            } "style="width: 300px; height: 300px; border-radius: 15px;"></a>--%>
                                </div>
                                <div class="detail">
                                    <div class="boardListPage-header">
                                        <h3 class="name">${boardDO.title}</h3>
                                        <div>지역 : ${boardDO.area}</div>
<%--                                        <div>방문일 : ${boardDO.date}</div>--%>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
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
</body>

</html>