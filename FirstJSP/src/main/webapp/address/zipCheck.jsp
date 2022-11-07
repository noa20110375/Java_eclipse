
<%@page import="com.address.ZipCode"%>
<%@page import="java.util.ArrayList"%>


<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

a:link {text-decoration: none; color:#000}
a:hover{text-decoration: none; color:#000}
a:a:visited{text-decoration: none; color:#000}

</style>
<%

request.setCharacterEncoding("utf-8");
//화면상에서 입력한 값 받아옴.
String dong = request.getParameter("dong");
AddressDAO dao = AddressDAO.getInstance();
ArrayList<ZipCode>zarr = dao.zipcodeRead(dong);
%>
<script>
function dongCheck(){
	
	if(document.getElementById('dong').value == ""){
		alert("동이름을  입력하세요")
		document.getElementById('dong').focus()
	return 
	}
	
	document.getElementById('frm').submit()
}


function send(code,sido,gugun,dong,bunji){
	//주소에 시도,구군,동,번지 넣음.
	const address = sido+""+gugun+""+dong+""+bunji
	// 클릭시 값이  폼에 입력 됨
	opener.document.getElementById("zipcode").value= code;
	opener.document.getElementById("addr").value = address;
	//창 닫음
	self.close();
	
	
	
}
</script>


</head>
<body>
<b>우편번호 찾기</b>
<form action = "zipCheck.jsp" id = "frm">
<table>
<tr>
<td>동이름입력:<input type = "text" name = "dong" id = "dong" />
<td><input type = "button" value = "검색" onclick="dongCheck()"/>

</tr>
<tr>
<%
//태그는 스크립태그 안에 넣으면 x
if(zarr.isEmpty()){
	%>
	<td>검색 결과 없습니다.</td>
<%
} else{
	 %>
	 
	<td>*검색 후, 아래 우편번호를 클릭하면 자동 입력됩니다.</td>
<%
}
%>
	</tr>
	<%
	//a태그는 주소를 인식  따로 자바스크립트로 호출해야한다면
	//앞에 javascript를 붙인다.
	for(ZipCode z: zarr){
		String zip = z.getZipcode();
	String sido = z.getSido();
	String gugun = z.getGugun();
	String d = z.getDong();
	String bunji = z.getBunji();
		%>
	<tr>
	<td><a href="javascript:send('<%=zip%>','<%=sido%>','<%=gugun %>','<%=d %>','<%=bunji %>')">
	<%=zip%><%=sido%><%=gugun %>
	<%=d %><%=bunji %></a></td>
		</tr>
<%
	}
	%>
</table>
</form>
</body>
</html>