<%@ page import="model.BoardDAO" %>
<%@ page import="model.BoardDO" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    BoardDAO boardDAO = (BoardDAO)session.getAttribute("boardDAO");

    if(boardDAO == null) {
        boardDAO = new BoardDAO();
        session.setAttribute("boardId", new BoardDAO());
    }

    if(request.getMethod().equals("POST")) {
        request.setCharacterEncoding("UTF-8");

        BoardDO boardDO = new BoardDO();
        boardDO.setUserId(request.getParameter("userId"));
        boardDO.setTitle(request.getParameter("title"));
        boardDO.setArea(request.getParameter("area"));
        boardDO.setContents(request.getParameter("contents"));

        boardDAO.insertBoard(boardDO);
//        request.setAttribute("boardList", boardDAO.getAllBoard());
//        pageContext.forward("../WEB-INF/views/boardPage.jsp");
    }
    else {
        request.setAttribute("boardList", boardDAO.getAllBoard());
        pageContext.forward("../WEB-INF/views/boardListPage.jsp");
    }
%>