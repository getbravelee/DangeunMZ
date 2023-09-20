<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String userId = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link href="../../img/logo1.ico" rel="shortcut icon" type="image/x-icon">
    <script src="<c:url value="https://kit.fontawesome.com/f399b95bac.js"/>" crossorigin="anonymous"></script>
    <script src="<c:url value="https://unpkg.com/axios/dist/axios.min.js"/>"></script>
    <title>당근맛집 게시판</title>
</head>

<body>
<section class="wrapper">
    <header id="header">
        <div class="container">
            <div class="header-left">
                <h1 class="brand">C</h1>
            </div>
            <form class="keyword-search keyword-search-main" name="search" method="post">
                <input type="text" name='search' id="search" class="searchText" placeholder="지역, 음식, 레스토랑명 검색" required
                       value>
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
            <form method="post" class="ctgr">
                <input name="page" type="submit" class="btn-category" value="홈">
                <input name="page" type="submit" class="btn-category" value="게시판">
                <input name="page" type="submit" class="btn-category" value="게시글 작성">
            </form>
        </div>
    </section>

    <main>
        <section class="timeLine-body">
            <c:forEach items="${boardList}" var="boardDO">
                <div id="List">
                    <div class="container">
                            <%--                        <div class="img" style="background-image: url(${--%>
                            <%--                                imgs[board.img]--%>
                            <%--                                }); width: 350px; height: 300px;"></div>--%>
                        <div class="contents">
                            <div class="contents-header">
                                <h2 class="name">[${boardDO.area}] ${boardDO.title}</h2>
                                <div class="writer">작성자 : ${boardDO.userId}</div>
                            </div>
                            <div class="writing">
                                    ${boardDO.contents}
                            </div>
                            <div class="container-option">
                                <c:if test="${boardDO.userId eq userId}">
                                    <form method="POST">
                                        <input type="hidden" name="update" value="${boardDO.boardNo}"/>
                                        <input type="submit" value="수정"/>
                                    </form>
                                    <form method="POST">
                                        <input type="hidden" name="delete" value="${boardDO.boardNo}"/>
                                        <input type="submit" value="삭제"/>
                                    </form>
                                </c:if>
                            </div>
                                <%--                            <div class="content-date">방문일 : ${boardDO.writeDate}</div>--%>
                        </div>
                    </div>
                    <br>
                </div>
            </c:forEach>
        </section>
    </main>
</section>
</body>
</html>