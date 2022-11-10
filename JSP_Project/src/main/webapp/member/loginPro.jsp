<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
 request.setCharacterEncoding("utf-8");
 MemberDAO dao  =  MemberDAOImpl.getInstance();
 int check = dao.loginCheck(userid,pwd);
 out.println(flag);
 %>