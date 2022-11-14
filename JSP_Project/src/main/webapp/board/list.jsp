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
String pageNum = request.getParameter("pageNum");
//처음페이지
if(pageNum == null){
	pageNum = "1";
}
int currentPage = Integer.parseInt(pageNum);//현재페이지
int pageSize = 5; //한 화면에 보여지는 게시물의 수

int startRow =  (currentPage-1) *pageSize +1 ;//1 6 11
int endRow = currentPage*pageSize; //5 10 15



String field = "";
String word = "";

if(request.getParameter("word")!=null){
	field = request.getParameter("field");
	word = request.getParameter("word");
}


	
	
	BoardDAO  dao =BoardDAO.getInstance();
	ArrayList<BoardDTO>arr = dao.boardList(field,word,startRow,endRow);
int count = dao.getCount(field,word);
%>

</head>
<body>

<div  align = "right">
<a href = "writeForm.jsp">글쓰기 
</a></div>
<h2>게시글 목록<%= count%></h2>
<table border =1>
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
	<tbody>
	<tr>
	<td><%=board.getNum() %></td>
	

	<td>
	<a href ="boardView.jsp?num=<%=board.getNum() %>"><%=board.getSubject()%></a>
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




</tbody>

</table>
<br/><br/>
<form action = "list.jsp" name = "search" method = "get">


<select name = "field">

<option value = "stubject">제목
<option value = "stubject">작성자
</select>

<input type = "text" size =16 name = "word">
<input type = "submit" value = "찾기">
</form>

<div align = "center">
<%// 나머지가 있으면 1을 더해서 총 8개의 페이지가 있게....
//0이면 0 더하고 아니면 1
if(count >0){//게시글 38, 한 화면에 표시5개 ==> 38/5+38%5==0?0:1  = 7개+1개 ==>8개
	int pageCount = count/pageSize + (count%pageSize ==0 ? 0:1);
	int pageBlock = 3;
	int startPage = (int)((currentPage-1)/pageBlock)*pageBlock+1;//(6-1)/3==>1*3+1==>4)
	int endPage = startPage + pageBlock-1;//4+3-1 = >6
	if (endPage > pageCount){//9(계산) >8(실제)
		endPage = pageCount;// endPage= 8
	
	
	
	}
	
	
	
	//이전
		if(startPage > pageBlock){
		%>
	<a href = "list.jsp?pageNum=<%=startPage-pageBlock%>&<%=field%>&<%=word%>">	[이전]</a>	
		<%	
		}
	//페이지 번호
	for(int i = startPage; i<=endPage ; i++){
		if(i == currentPage){//링크 없음.
		%>
		[<%=i %>]
		<%
		}else{//링크
		%>
			<a href = "list.jsp?pageNum=<%=i%>&<%=field%>&<%=word%>"> <%=i %></a>
		<%
		}
		
		
	%>
	
	
	<%
}
	//다음
	if(endPage  <pageCount){
		 %>

		<a href = "list.jsp?pageNum=<%=startPage+pageBlock%>&<%=field%>&<%=word%>">[다음]</a>
	<%
	}

	
}

%>


</div>
</body>
</html>