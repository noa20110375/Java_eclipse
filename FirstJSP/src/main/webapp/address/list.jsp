<%@page import="com.address.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체보기</title>
<%
AddressDAO  dao = AddressDAO.getInstance();
ArrayList<Address>arr = dao.addressList();
%>
</head>
<body>
<a href ="insert.jsp">추가하기</a> <br/><br/>
<%
//위치가 특정할 때
for(int i = 0; i<arr.size(); i++){
	
	%>
	<%=arr.get(i).getNum() %>
	
	<%=arr.get(i).getName()%>
	<%=arr.get(i).getZipcode()%>
	<%=arr.get(i).getAddr()%>
	<%=arr.get(i).getTel()%>
	<br/>
	<% 
}
%>
<hr/>
<%
//위치가 특정하지 않을 때 
for(Address ad : arr ){
	
	%>
	<%=ad.getNum() %>
	<%=ad.getName()%>
	<%=ad.getZipcode()%>
	<%=ad.getAddr()%>
	<%=ad.getTel()%>
	<br/>
	<% 
}
%>
</body>
</html>