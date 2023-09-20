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
            <button class="menu">
                <i class="fa-solid fa-bars" style="color: #e2520f;"></i>
            </button>
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

        <form method="post" class="board-form">

            <div class="form-group">
                <h3>작성자</h3>
                <input type="text" name="userId" id="userId" maxlength="20" class='form-input' placeholder="닉네임을 입력하세요">
            </div>

            <div class="form-group">
                <h3>제목</h3>
                <input type="text" name="title" id="title" maxlength="2000" class='form-input' placeholder="제목을 입력하세요">
            </div>

            <%--            <div class="form-group">--%>
            <%--                <h3>방문일</h3>--%>
            <%--                <input type="date" name="writeDate"  id="writeDate" maxlength="200" class='form-input' placeholder="방문일을 입력하세요">--%>
            <%--            </div>--%>

            <div class="form-group">
                <h3>지역</h3>
                <select id="area" name="area" class="form-input">
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

            <%--            <div class="form-group">--%>
            <%--                <legend><h3>이미지 선택</h3></legend>--%>
            <%--                <br/>--%>

            <%--                <label for="imgType">파일 종류</label>--%>
            <%--                <select name="imgType" id="imgType">--%>
            <%--                    <option selected>PNG</option>--%>
            <%--                    <option>JPG</option>--%>
            <%--                    <option>GIF</option>--%>
            <%--                </select><br/>--%>

            <%--                <input type="file" name="picture" id="picture" maxlength="2000" class='form-input'--%>
            <%--                       style="margin-bottom: 15px;" required>--%>

            <%--                <input type="submit" value="업로드"/>--%>
            <%--            </div>--%>


            <div class="form-group">
                <h3>내용</h3>
                <!-- <textarea id="content" class="form-input" rows="10" style="font-size: 18px;">[동네] : &#10;&#10;[주차] : &#10;&#10;[맵기] : &#10;&#10;[가게 후기] : &#10;&#10;[기타 사항] : </textarea> -->
                <textarea name="contents" id="contents" class="form-input" rows="10" style="font-size: 18px;"
                          placeholder="내용을 입력하세요"></textarea>
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-red" value="등록">
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