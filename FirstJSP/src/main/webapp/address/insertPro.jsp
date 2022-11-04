<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
request.setCharacterEncoding("utf-8");
%>


<jsp:useBean id ="ad"  class= "com.address.Address"></jsp:useBean>
<jsp:setProperty  property = "*" name =  "ad"/>


<%
AddressDAO dao = AddressDAO.getInstance();
dao.addrInsert(ad);// 추가 
//입력한 값을 화면에 출력해줌.
response.sendRedirect("list.jsp");
%>