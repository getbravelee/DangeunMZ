<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    String select_item = request.getParameter("page");
    String pageURL = null;

    System.out.println("----------------");
    System.out.println(select_item);
    if(select_item.equals("홈"))
    {
        pageURL = "/WEB-INF/views/index.jsp";
    }
    else if(select_item.equals("게시판"))
    {
        pageURL = "/WEB-INF/views/boardListPage.jsp";
    }
    else if(select_item.equals("게시글 작성"))
    {
        pageURL = "/WEB-INF/views/boardPage.jsp";
    }
//    pageContext.forward(pageURL);
%>
<jsp:forward page="<%= pageURL %>" />