
<%@page import="com.jqueryAddress.JAddressDAOImpl"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
request.setCharacterEncoding("utf-8");
%>


<jsp:useBean id ="avo"  class= "com.jqueryAddress.AddressVO"></jsp:useBean>
<jsp:setProperty  property = "*" name =  "avo"/>


<%
JAddressDAO dao = JAddressDAOImpl.getInstance();
dao.insert(avo);// 추가 
//입력한 값을 화면에 출력해줌.
response.sendRedirect("addrlist.jsp");
%>