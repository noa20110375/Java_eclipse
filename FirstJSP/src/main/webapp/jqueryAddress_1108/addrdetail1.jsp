<%@page import="com.jqueryAddress.AddressVO"%>
<%@page import="com.jqueryAddress.JAddressDAOImpl"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
request.setCharacterEncoding("utf-8");

JAddressDAO dao = JAddressDAOImpl.getInstance();
int num = Integer.parseInt(request.getParameter("num"));
AddressVO ad = dao.findByNum(num);
%>

<script>
function del(){
	if(confirm("정말 삭제할까요?"));
	location.href = "deletePro.jsp?num = <%= num %>";
}
</script>
</head>
<body>
<h3>상세보기</h3>
<form action = "updatePro.jsp" method = "post">
<input type ="hidden" name = "num" value =<%= ad.getNum() %>>
<table>
<tr>
<th>번호</th>
<td><input type = "text" name = "name" value =  "<%= ad.getNum() %>"  disabled = "disabled">
</td>
</tr>
<tr>
<th>이름</th>
<td><input type = "text" name = "name" value =  "<%= ad.getNum() %>"  disabled = "disabled">
</td>
</tr>
<tr>
<th>이름</th>
<td><input type = "text" name = "name" value =  "<%= ad.getNum() %>"  disabled = "disabled">
</td>
</tr>
<tr>
<th>우편번호</th>
<td><input type = "text" name = "zipcode" value =  "<%= ad.getZipcode() %>"  size>
</td>
</tr>
<tr>
<th>주소</th>
<td><input type = "text" name = "addr" value =  "<%= ad.getAddr() %>"  size = 50>
</td>
</tr>

</table>
</form>
</body>
</html>