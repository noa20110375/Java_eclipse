<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<c:choose>
	<c:when test="${param.color=='yellow' }">
	<c:set var ="c" value ="노랑색"/>
	
	</c:when>
<c:when test="${param.color=='blue' }">
	<c:set var ="c" value ="파란색"/>
	
	</c:when>

<c:when test="${param.color=='orange' }">
	<c:set var ="c" value ="오렌지색"/>
	
	</c:when>

<c:when test="${param.color=='pink' }">
	<c:set var ="c" value ="핑크색"/>
	
	</c:when>

<c:when test="${param.color=='black' }">
	<c:set var ="c" value ="검정색"/>
	
	</c:when>





</c:choose>

<c:set var = "name" value = "${param.id }"/>
<c:if test ="${param.id==null || param.id==''}">
<c:set var ="name" value ="GUEST"/>
</c:if>
${param.id}가 좋아하는 색깔은 ${parm.color }
<hr/>
 ${name } 좋아하는 색깔은 ${c }
</body>
</html>