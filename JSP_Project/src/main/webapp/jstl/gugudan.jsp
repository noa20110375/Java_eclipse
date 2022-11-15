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

<h3>구구단</h3>
<c:forEach begin ="1" end = "9" var = "dan">
${dan}단<br/>


<c:forEach begin ="1" end = "9" var = "k">
${dan}*${k} = ${dan*k }<br/>
</c:forEach>
</c:forEach>
<%
for(int i =2; i<=9; i++){
	
	%>
	
	<%=i%>단<br/>
	<%
				for(int j =1; j<=9;j++){
					
					out.println( i+"x"+j +"=" +i*j+"\n");
					
					
					
				}
	%>
<br/>

<%
}

	 %>

</body>
</html>