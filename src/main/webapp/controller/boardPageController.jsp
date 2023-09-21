<%@ page contentType="text/html; charset=UTF-8"
         import="java.util.*"
%>
<%@ page import="model.BoardDAO" %>
<%@ page import="model.BoardDO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%

    BoardDAO boardDAO = (BoardDAO)session.getAttribute("boardDAO");

    if(boardDAO == null) {
        boardDAO = new BoardDAO();
        session.setAttribute("boardId", new BoardDAO());
    }

    if(request.getMethod().equals("POST")) {
        request.setCharacterEncoding("UTF-8");

        //수정 버튼 누르면 작동
        if(request.getParameter("update") != null && !"null".equals(request.getParameter("update"))){
            int num = Integer.parseInt(request.getParameter("update"));

            request.setAttribute("board",boardDAO.getBoard(num));
            pageContext.forward("/WEB-INF/views/updateBoard.jsp");
        }
        // 수정 버튼 -> 수정하기
        else if (request.getParameter("updateBoard") != null && !"null".equals(request.getParameter("updateBoard"))) {
            int num = Integer.parseInt(request.getParameter("updateBoard"));
            BoardDO boardDO = new BoardDO();
            boardDO.setBoardNo(num);
            boardDO.setUserId(request.getParameter("userId"));
            boardDO.setTitle(request.getParameter("title"));
            boardDO.setArea(request.getParameter("area"));
            boardDO.setContents(request.getParameter("contents"));

            boardDAO.updateBoard(boardDO);
            request.setAttribute("boardList", boardDAO.getAllBoard());
            pageContext.forward("/WEB-INF/views/boardListPage.jsp");
        }
        // 삭제 버튼 누르면 작동
        else if (request.getParameter("delete") != null && !"null".equals(request.getParameter("delete"))) {
            int num = Integer.parseInt(request.getParameter("delete"));
            boardDAO.deleteBoard(num);

            request.setAttribute("boardList", boardDAO.getAllBoard());
            pageContext.forward("/WEB-INF/views/boardListPage.jsp");
        }
        //view jsp 로 넘기기
        else if (request.getParameter("page") != null && !"null".equals(request.getParameter("page"))) {
            String select_item = request.getParameter("page");
            String pageURL = null;

            if(select_item.equals("홈"))
            {
                request.setAttribute("boardList", boardDAO.getAllBoard());
                pageURL = "/WEB-INF/views/index.jsp";
            }
            else if(select_item.equals("게시판"))
            {
                request.setAttribute("boardList", boardDAO.getAllBoard());
                pageURL = "/WEB-INF/views/boardListPage.jsp";
            }
            else if(select_item.equals("게시글 작성"))
            {
                pageURL = "/WEB-INF/views/boardPage.jsp";
            }
             pageContext.forward(pageURL);
        }

        //검색
        else if (request.getParameter("search") != null && !"null".equals(request.getParameter("search"))) {
            String keyword = request.getParameter("search");
            request.setAttribute("boardList", boardDAO.getSearchBoard(keyword));
            pageContext.forward("/WEB-INF/views/boardListPage.jsp");
        }

        //로그인 컨트롤러로 이동
//        else if (request.getParameter("login") != null && !"null".equals(request.getParameter("login"))) {
//            response.sendRedirect("memberController.jsp");
//
//        }
        //post 기본 화면
//        else if(request.getParameter("boardWrite") != null && !"null".equals(request.getParameter("boardWrite"))){
        else{
            BoardDO boardDO = new BoardDO();
            boardDO.setUserId(request.getParameter("userId"));
            boardDO.setTitle(request.getParameter("title"));
            boardDO.setArea(request.getParameter("area"));
            boardDO.setContents(request.getParameter("contents"));

            boardDAO.insertBoard(boardDO);
            request.setAttribute("boardList", boardDAO.getAllBoard());
            pageContext.forward("/WEB-INF/views/boardListPage.jsp");
        }
    }
    // get 방식 기본화면
    else if (request.getParameter("page") != null && !"null".equals(request.getParameter("page")) && request.getParameter("page").equals("home")) {
        response.sendRedirect("/dangeun_mz_war/WEB-INF/views/index.jsp");
//        pageContext.forward("/WEB-INF/views/index.jsp");
    }
    else if (request.getParameter("page") != null && !"null".equals(request.getParameter("page")) && request.getParameter("page").equals("board")) {
        pageContext.forward("/WEB-INF/views/boardPage.jsp");
    }
    else if (request.getParameter("page") != null && !"null".equals(request.getParameter("page")) && request.getParameter("page").equals("boardPage")) {
        pageContext.forward("/WEB-INF/views/boardListPage.jsp");
    }
    else {
        request.setAttribute("boardList", boardDAO.getAllBoard());
        pageContext.forward("/WEB-INF/views/index.jsp");
    }

%>

