<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//내가 필요한 것을 제거 remove // 정리된 섹션 다제거는 밑에
session.invalidate();
response.sendRedirect("loginForm.jsp");
%>