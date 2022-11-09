<%@page import="com.jqueryAddress.AddressVO"%>
<%@page import="com.jqueryAddress.JAddressDAOImpl"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js" ></script>
<%
JAddressDAO  dao =JAddressDAOImpl.getInstance();
ArrayList<AddressVO>arr = dao.list();
int count  = dao.getCount();
%>
</head>

<script>
$(document).ready(function(){
	$("#btnSearch").click(function(){
		$.ajax({
			//값 가져옴
			type: 'get',
			//서버페이지 에서
			url: "searchProcess.jsp",
			//필드와워드
			data:{
				field: $("#field").val(),
				word: $("#word").val()
			},
			//콜백 성공
			success : function(resp){
				//alert(resp)
				//JSON 으로 파싱
				//cntSpan의 전체보기 안의 count가 
				//검색하면 그 갯수에 따라 값이 변함.
				//parse 메소드는 string 객체를 json 객체로 변환
		var  d = JSON.parse(resp);
				var str ="";
				$.each(d.jarrObj,function(key,val){
					
					str += "<tr>"
						str += "<td>" + val.num+"<td/>"
						str += "<td><a href= 'addrdetail.jsp?num="+val.num+"'>" + val.name+"</a><td/>"
						str += "<td>" + val.addr+"<td/>"
						str += "<td>" + val.tel+"<td/>"
						str += "<tr/>"
				
				
				})//each(반복문)
				//밑에 공백은 하위를 가리킴
				$("table tbody").html(str);
				//alert(d.countObj.count)
				$("#cntSpan").text(d.countObj.count)
			
			},
			//에러
			error : function (resp){
				error( e+ "error")
			}
			
		})//ajax
				
	})//btnSearchclick

})//document
</script>
<body>

<div align ="right">
<a href ="insert.jsp">추가하기</a>
</div>
<br/>
<div class="container">
<h3>JQUERY전체보기(<span id = "cntSpan"><%=count %></span>)</h3>


<hr/>

<table class="table table-hover">

<tbody>
<tr>
<th>번호</th>
<th>이름</th>

<th>주소 </th>
<th>전화번호</th>
</tr>
</tbody>



<%
//위치가 특정하지 않을 때 

for(AddressVO ad : arr ){
	
	%>
	<tr>
	<td><%=ad.getNum() %></td>
	
	<td>
	<a href = "addrdetail.jsp?num=<%=ad.getNum() %>"><%=ad.getName()%></a>
	</td>
	
	<td>
	<%=ad.getAddr()%>
	</td>
	<td>
	<%=ad.getTel()%>
	</td>
	</tr>
	
	<% 
}
%>
</table>

<select name = "field" id = "field">
<option value = "name">이름</option>
<option value = "addr">주소</option>

</select>

<input type = "text" name ="word" id = "word">
<input type = "button" value = "검색" id = "btnSearch">
</div>
</body>
</html>