<%@page import="java.util.ArrayList"%>
<%@page import="com.board.dao.BoardDAO"%>
<%@page import="com.board.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
request.setCharacterEncoding("utf-8");
BoardDAO  dao =BoardDAO.getInstance();
ArrayList<BoardDTO>arr = dao.boardList();
int count = dao.getCount();
%>

</head>
<body>
<h2>게시글 목록<%= count%></h2>
<table>
<thead>

<tr>
<th>번호</th>
<th>제목</th>
<th>작성자</th>
<th>작성일</th>
<th>조회수</th>
</tr>
</thead>

<%
//위치가 특정하지 않을 때 
for(BoardDTO board : arr ){
	
	%>
	
	<tr>
	<td><%=board.getNum() %></td>
	

	<td>
	<a href ="boardView.jsp?num=<%=board.getSubject()%>"></a>
	</td>
	<td>
	<%=board.getWriter()%>
	</td>

	<td>
	<%=board.getReg_date()%>
	</td>
	
	<td>
	<%=board.getReadcount()%>
	</td>
	
	</tr>

	<% 
}
%>
</table>
</body>
</html>