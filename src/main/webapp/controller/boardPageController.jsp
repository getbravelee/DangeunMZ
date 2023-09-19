<%@ page contentType="text/html; charset=UTF-8"
         import="java.util.*"
%>
<%@ page import="model.BoardDAO" %>
<%@ page import="model.BoardDO" %>

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
            pageContext.forward("/WEB-INF/views/updateBoardPage_back.jsp");
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
            pageContext.forward("/WEB-INF/views/boardListPage_back.jsp");

        }
        // 삭제 버튼 누르면 작동
        else if (request.getParameter("delete") != null && !"null".equals(request.getParameter("delete"))) {
            int num = Integer.parseInt(request.getParameter("delete"));
            boardDAO.deleteBoard(num);

            request.setAttribute("boardList", boardDAO.getAllBoard());
            pageContext.forward("/WEB-INF/views/boardListPage_back.jsp");
        }
        //post 기본 화면
        else {
            BoardDO boardDO = new BoardDO();
            boardDO.setUserId(request.getParameter("userId"));
            boardDO.setTitle(request.getParameter("title"));
            boardDO.setArea(request.getParameter("area"));
            boardDO.setContents(request.getParameter("contents"));

            boardDAO.insertBoard(boardDO);
            request.setAttribute("boardList", boardDAO.getAllBoard());
            pageContext.forward("/WEB-INF/views/boardListPage_back.jsp");
        }
    }
    // get 방식 기본화면
    else {
        request.setAttribute("boardList", boardDAO.getAllBoard());
        pageContext.forward("/WEB-INF/views/boardPage_back.jsp");
    }

%>