<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
//값 출력
//한글 인코딩
request.setCharacterEncoding("utf-8");
//id를 계속 쓸거면 담아서 쓰는게 나음
//아니면 1회용이면 그냥 request.getParameter로 쓰면 됨.
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
%>
</head>
<body>


id: <%= id  %><br/>
pwd: <%= pwd %><br/>


</body>
</html>