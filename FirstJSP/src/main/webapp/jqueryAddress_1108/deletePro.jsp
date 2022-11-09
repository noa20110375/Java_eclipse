<%@page import="com.jqueryAddress.JAddressDAOImpl"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
JAddressDAO dao= JAddressDAOImpl.getInstance();
int num = Integer.parseInt(request.getParameter("num"));
dao.delete(num);
response.sendRedirect("addrlist.jsp");
%>