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
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String tmp  = "";
String [] hobby = request.getParameterValues("hobby");
//배열로 가져옴. 
//hobby가 null이 아닐 때 출력 null 이면 출력 x
if (hobby != null){
for(int i = 0 ; i<hobby.length; i++){
	tmp += hobby[i]  + "";
}
}
String job = request.getParameter("job");
%>
이름:<%= name %><br/>
나이:<%= age %><br/>
성별:<%=gender %><br/>
취미:<%=tmp %><br/>
직업:<%=job %><br/>
<hr>
직업: <%=  request.getParameter("job") %>
</body>
</html>