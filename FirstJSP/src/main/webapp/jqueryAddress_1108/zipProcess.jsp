<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.jqueryAddress.ZipCodeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@page import="com.jqueryAddress.JAddressDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   <%
   request.setCharacterEncoding("utf-8");
   String dong = request.getParameter("dong");
   //String dong = "부전동";
   JAddressDAO dao = JAddressDAOImpl.getInstance();
   //자바ArrayList 를 JSON으로 바꿀거임.
   ArrayList<ZipCodeVO> zarr =dao.getZipcode(dong);
//maven repository 에서 json simple 제일 많이 받은 거 1.1.1 버전 다운하고
//WEB-INF > lib > 안에 넣음 그리고 사용
   //java zarr ==> json 으로 바꾸고 싶음
   //System.out.print(zarr.size());
 //객체 생성  
 JSONArray jsonarr  = new JSONArray();
 for(ZipCodeVO z : zarr){
	 JSONObject obj = new JSONObject();
	 obj.put("zipcode", z.getZipcode());
	 obj.put("sido", z.getSido());
	 obj.put("gugun", z.getGugun());
	 obj.put("dong", z.getDong());
	 obj.put("bunji", z.getBunji());
	 jsonarr.add(obj);
 }
 out.println(jsonarr.toString());
 
   %>