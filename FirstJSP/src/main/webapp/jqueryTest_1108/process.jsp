<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//서버가 돌려준 결과를 그대로 받음 
//두가지일을 병렬적으로 함.
// 서버 페이지 
//한글 인코딩
request.setCharacterEncoding("utf-8");
//값 출력 
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String method = request.getParameter("method");
//변수 선언
String str = "[처리결과]<br/>";
//값 누적
str += "id:" + id + "<br/>";
str += "pwd:" + pwd + "<br/>";
str += "method" + method +"<br/>";

//str의 결과가 resp 에 연결.
out.println(str);
%>