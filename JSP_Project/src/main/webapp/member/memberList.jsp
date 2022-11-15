<%@page import="com.member.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   <script src="https://code.jquery.com/jquery-3.6.1.js" ></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js" ></script>
<script src = "../js/member.js"></script>



<%
request.setCharacterEncoding("utf-8");
//String  = Object  (String) 캐스팅
String sid =(String)session.getAttribute("sUserid");

MemberDAO  dao = MemberDAOImpl.getInstance();
ArrayList<MemberDTO>arr = dao.memberList();
MemberDTO member = dao.findById(sid);
int count = dao.getCount();

%>

</head>






<body>
<div align = "right">
<a href="memberView.jsp"><%= sid %>님 반값습니다.</a>
 / <a href ="logout.jsp">로그아웃 </a>
 /<a href = "/JSP_Project/board/list.jsp"> 게시판으로</a>

</div>

<div class="container mt-5">
<h3>회원리스트(<span id   ="cntSpan"><%= count %></span>)</h3>


<hr/>

<table class="table table-hover">

<thead>
<tr>
<th>이름</th>
<th>아이디</th>
<th>전화번호 </th>
<th>이메일</th>
<th>구분</th>
<th>삭제</th>
</tr>
</thead>



<%
//위치가 특정하지 않을 때 
for(MemberDTO mb : arr ){
	String mode = mb.getAdmin() == 0? "일반회원":"관리자";
	%>
	
	<tr>
	<td><%=mb.getName() %></td>
	
	<td>
	<%=mb.getUserid()%>
	</td>
	<td>
	<%=mb.getPhone()%>
	</td>

	<td>
	<%=mb.getEmail()%>
	</td>
	
	<td>
	<%=mode%>
	</td>
	<td>
	<a href ="javascript:del('<%=mb.getUserid()%>','<%=mode%>')">삭제</a>
	</td>
	</tr>

	<% 
}
%>

</table>

</div>
</body>
</html>