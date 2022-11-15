<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   <%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>

<h3> JSTL 사용</h3>
첫번째수:${param.num1 }<br/>
두번째수:${param.num2 }<br/>

<hr/>

결과: ${param.num1 +param.num2 }<br/>
<c:set var= "hap" value = "${param.num1 +param.num2 }"/>
hap: ${hap }<br/>
hap: <c:out value = "${hap }"/><br/>

<c:if test="${hap%2==0 }">
${hap}:짝수
</c:if>
<c:if test="${hap%2!=0 }">
${hap}:홀수
</c:if>


<hr/>

<c:choose>
<c:when test = "${hap%2==0 }">
짝수
</c:when>
<c:when test = "${hap%3==0 }">
3의 배수
</c:when>
<c:otherwise>
짝수도 3의 배수가아님
</c:otherwise>
</c:choose>
</body>
</html>