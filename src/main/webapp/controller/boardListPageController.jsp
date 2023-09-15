<%@ page import="model.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    BoardDAO boardDAO = (BoardDAO) session.getAttribute("boardDAO");

    if(boardDAO == null){
        boardDAO = new BoardDAO();
        session.setAttribute("boardDAO", new BoardDAO());
    }

    if (request.getParameterNames().equals("search")){
        request.setCharacterEncoding("UTF-8");

        boardDAO.getSearchBoard(request.getParameter("????"));
    }
%>