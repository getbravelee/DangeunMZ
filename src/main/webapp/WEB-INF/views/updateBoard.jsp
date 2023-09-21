<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>당근맛집 게시글 작성</title>
</head>

<body>
<section class="wrapper">
    <header id="header">
        <div class="container">
            <div class="header-left">
                <h1 class="brand">C</h1>
            </div>
            <form class="keyword-search keyword-search-main" name="search"
                  method="post">
                <input type="text" name='search' id="search" class="searchText" placeholder="지역, 음식, 레스토랑명 검색" required
                       value>
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
            <form method="post" class="ctgr">
                <input name="page" type="submit" class="btn-category" value="홈">
                <input name="page" type="submit" class="btn-category" value="게시판">
                <input name="page" type="submit" class="btn-category" value="게시글 작성">
            </form>
        </div>
    </section>

    <main>
        <div class="section-title">
            <h1>게시판</h1>
        </div>

        <form method="post" enctype="multipart/form-data" class="board-form" id="uploadForm">

            <div class="form-group">
                <h3>작성자</h3>
                <input type="text" name="userId" id="userId" maxlength="20" class='form-input' value="<%= session.getAttribute("userId") %>" readonly>
            </div>

            <div class="form-group">
                <h3>제목</h3>
                <input type="text" name="title" id="title" maxlength="2000" class='form-input' placeholder="제목을 입력하세요" value="${board.title}">
            </div>

            <%--            <div class="form-group">--%>
            <%--                <h3>방문일</h3>--%>
            <%--                <input type="date" name="writeDate"  id="writeDate" maxlength="200" class='form-input' placeholder="방문일을 입력하세요">--%>
            <%--            </div>--%>

            <div class="form-group">
                <h3>지역</h3>
                <input type="text" name="area" class="form-input" value="${board.area}">
            </div>

            <div class="form-group">
                <legend><h3>이미지 선택</h3></legend>
                <br/>

                <label for="imgType">파일 종류</label>
                <select name="imgType" id="imgType">
                    <option selected>PNG</option>
                    <option>JPG</option>
                    <option>GIF</option>
                </select><br/>

                <input type="file" name="picture" id="picture" maxlength="2000" class='form-input'
                       style="margin-bottom: 15px;" required>
            </div>


            <div class="form-group">
                <h3>내용</h3>
                <!-- <textarea id="content" class="form-input" rows="10" style="font-size: 18px;">[동네] : &#10;&#10;[주차] : &#10;&#10;[맵기] : &#10;&#10;[가게 후기] : &#10;&#10;[기타 사항] : </textarea> -->
                <textarea name="contents" id="contents" class="form-input" rows="10" style="font-size: 18px;"
                          >${board.userId}</textarea>
            </div>

            <div class="form-group">
                <input type="hidden" name="updateBoard" value="${board.boardNo}">
                <input type="submit" class="btn btn-red" value="수정">
            </div>

        </form>
    </main>
</section>

<script>
    let now_utc = Date.now()
    let timeOff = new Date().getTimezoneOffset() * 60000;
    let today = new Date(now_utc - timeOff).toISOString().split("T")[0];
    document.getElementById("writeDate").setAttribute("max", today);

    function uploadHandler(event) {
        let extCheck = false;
        let picture = document.querySelector('#picture');
        let imgType = document.querySelector('#imgType');
        let fileExt = picture.value.split('.')[1];

        if (fileExt === 'png' || fileExt === 'jpg' || fileExt === 'jpeg' || fileExt === 'gif') {
            if (imgType.value.toLowerCase() === fileExt) {
                extCheck = true;
            }
        }

        if (!extCheck) {
            event.preventDefault();
            alert('선택한 이미지 종류에 맞는 올바른 이미지를 선택하세요!');
        }
    }

    function init() {
        document.querySelector('#uploadForm').addEventListener('submit', uploadHandler);

    }

    window.addEventListener('load', init);
</script>
</body>

</html>