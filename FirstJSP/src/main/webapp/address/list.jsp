<%@page import="com.address.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체보기(검색인 것)</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
function searchCheck(){
	//word의 값이 비어 있다면 알림창 뜸.
	if(document.getElementById("word").value ==""){
		alert("검색어를 입력하세요.");
		document.getElementById("word").focus();
		return;
	}
	document.getElementById("sfrm").submit();
}

</script>



<%
request.setCharacterEncoding("utf-8");

//공백으로 선언하는 이유?
//null과 공백은 다름 null이라는 것은 아예없다는 것.
//String은 밑에와 같이 선언하면 객체가 만들어짐,초기값 공백으로 만들어두고 밑에 if문에서 값을 채움.
String field = "";
String  word = "";
//word가 null이 아니면 값 가져옴
if(request.getParameter("word")!=null){
	field = request.getParameter("field");
	word = request.getParameter("word");
}
AddressDAO  dao = AddressDAO.getInstance();
ArrayList<Address>arr = dao.addressList(field,word);
int count  = dao.getCount(field,word);
//쌍따옴표 안에는 작은따옴표 
%>
</head>
<body>

<div align ="right">
<a href ="insert.jsp">추가하기</a>
/<span onclick = "location.href = 'list.jsp'">전체보기</span>
<br/>
</div>
<br/>
<div class="container">
<h3>전체보기(<%=count %>)</h3>


<hr/>

<table class="table table-hover">

<thead>
<tr>
<th>번호</th>
<th>이름</th>

<th>주소 </th>
<th>전화번호</th>
</tr>
</thead>



<%
//위치가 특정하지 않을 때 
for(Address ad : arr ){
	
	%>
	<tr>
	<td><%=ad.getNum() %></td>
	
	<td>
	<a href = "detail.jsp?num=<%=ad.getNum() %>"><%=ad.getName()%></a>
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
<form action = "list.jsp"  id = "sfrm">
<select  name = "field">
<!-- sql의 컬럴명으로 값을 주는게 나음 -->
<option value = "name">이름</option>
<option value = "addr">주소</option>

</select>

<input type = "text" name ="word" id ="word">
<input type = "button" value = "검색" onclick = "searchCheck()">
</form>
</div>
</body>
</html>