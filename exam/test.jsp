<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "testResult.jsp" method = "get">
<!--  name 에 입력한 값을 가지고 서버로 감.
post 주소경로 가려줌.
-->
     이름:<input type = "text" name = "name">  <br/>
     주소:<input type = "text" name = "addr">  <br/>
     <input type = "submit" value = "전송"/>
     
   
     </form>
</body>
</html>