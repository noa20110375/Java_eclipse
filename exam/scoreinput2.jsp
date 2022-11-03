<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script> 
function check(){
//아무 반응이 없으면 오타가 있음.
	if(document.getElementById("name").value ==""){
		alert("이름을 입력하세요");
		//값 업이 return을 쓰면 종료할 수 있음.
	return false
	}
	//isNaN 문자입력하면 숫자를 입력하라고 뜸
	if(document.getElementById("korea").value ==""|| isNaN(document.getElementById("korea").value)){
		alert("숫자로 국어점수를 입력하세요");
		//알림 후 입력한 값이 지워짐. value = "" 를 공백으로 하면
		document.getElementById("korea").value = "" 
		return false
	}
	if(document.getElementById("english").value ==""|| isNaN(document.getElementById("english").value)){
		alert("영어점수를 입력하세요");
		document.getElementById("english").value = "" 
		return false
	}
	if(document.getElementById("math").value ==""|| isNaN(document.getElementById("math").value)){
		alert("수학점수를 입력하세요");
		document.getElementById("math").value = "" 
		return false
	}
	return true
}

</script>
</head>
<body>
<form action = "scoreResult.jsp"   id = "frm" onsubmit = "return checked()">
     이름:<input type = "text" name = "name" id = "name">  <br/>
     국어:<input type = "text" name = "korea" id = "korea">  <br/>
     영어:<input type = "text" name = "english" id = "english">  <br/>
     수학:<input type = "text" name = "math"id = "math">  <br/>
     <!-- input type  = button은 버튼 역할만 submit은 제출해서 페이지 넘어감. action에-->
     <input type = "submit" value = "button전송" onclick = "check()"/>
     </form>
</body>
</html>