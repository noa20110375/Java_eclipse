<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
 request.setCharacterEncoding("utf-8");
 MemberDAO dao  =  MemberDAOImpl.getInstance();
 String userid = request.getParameter("userid");
 String pwd = request.getParameter("pwd");
 //로그인체크
int flag = dao.loginCheck(userid,pwd);
if(flag==0|| flag ==1){
	//session 기본적으로 true
	//session  값 저장
	session.setAttribute("sUserid", userid);


}

out.println(flag);

 %>