<%@page import="com.jqueryAddress.AddressVO"%>
<%@page import="com.jqueryAddress.JAddressDAOImpl"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@page import="com.address.Address"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>



<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
JAddressDAO dao =JAddressDAOImpl.getInstance();
//수업에서는ad 말고avo에 넣음
AddressVO ad = dao.findByNum(num);
%>

<script>
//상세보기 우편번호 검색 버튼 클릭시 이벤트
function zipRead(){
	window.open("zipCheck.jsp","","widht = 700 height = 400")
}

function del(){
	
	if(confirm("정말 삭제할까요?"));
	location.href = "deletePro.jsp?num=<%=num%>";
}
</script>

</head>
<body>
<h3>상세보기</h3>
<form action="updatePro.jsp" method = "post">
<input type = "text" name = "num" value = <%= ad.getNum() %>> 
<table>
<tr>
<th>번호</th>
<td><input type = "text" name = "num" value ="<%=ad.getNum() %>" readonly = "readonly">
</td>
</tr>
<tr>
<th>이름</th>
<td><input type = "text" name = "name" value ="<%=ad.getName() %>"></td>

</tr>
<tr>
<th>우편번호</th>
<td><input type = "text" name = "zipcode"  id = "zipcode" value ="<%=ad.getZipcode() %>" size =7 >
	<input type = "button" value ="검색" onclick ="zipRead()"/>

</td>

</tr>
<!-- name  id  값은 일치하는게 좋음...  당연한게 처음에 정한 값을 가져가서 사용하니까...
내 실수 name에 name 값이 들어가야하는데  num이 들어가서 다른 값이 나온 거임...
id는 자바 스크립트에서 다룰려고 지정하는 것이고
name은 파라미터 전송을 하기 위해서 지정하는 것이다.
-->
<tr>
<th>주소</th>
<td><input type = "text" name = "addr"  id = "addr"value ="<%=ad.getAddr() %>" size =50 ></td>

</tr>

<tr>
<th>전화번호</th>
<td><input type = "text" name = "tel" value ="<%=ad.getTel() %>"></td>

</tr>
<tr>
<td colspan ="2">

<input type = "submit" value = "수정">
<input type = "button" value = "삭제" onclick = "del()">
<input type = "reset" value ="취소" >
<input type = "button" value = "전체 보기typebutton" onclick ="location.href = 'addrlist.jsp'">
<!-- -submit 기능을 갖고 있기 때문에 form태그의 updatepro 로 넘어감.
button 으로 사용할려면 무조건 type을 button으로 해줘야함.
 -->
  
<button type = "button">전체보기</button>



</td>
</tr>
</table>
</form>
</body>
</html>