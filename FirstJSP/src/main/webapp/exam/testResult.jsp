<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//스크립트릿 
//request객체 내장 돼 있음
//1. 객체 == 속성+ 행위 (기능)
//2.맴버변수 +메소드(함수)
String name =request.getParameter("name");
String addr = request.getParameter("addr");
%>

이름: <% out.println(name);%><br/>
주소: <% out.println(addr); %>

<hr/>
<!--  <hr/> 수평선 긋기
위에 내용을 간단하게 ..?-->
이름:<%= name %><br/>
주소:<%= addr %>

</body>
</html>