<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" ></script>
<script>
//다른 거 다 읽고 실행
$(document).ready(function(){
	$("#btn").click(function(){
			if($("#name").val() == ""){
				alert("이름입력")
				return
			}	
			//문자가 아니면 숫자 입력하고 경고
			if($("#korea").val() == ""|| isNaN($("#korea").val())){
				alert("국어 점수 입력")
				//입력된 값 제거
				$("#korea").val("")
				return
			}
			if($("#english").val() == ""|| isNaN($("#english").val())){
				alert("영어 점수 입력")
				//입력된 값 제거
				$("#english").val("")
				return
			}
			//document.getElementById("name").value ==""
			//$("#english").val() == ""같은 의미
			//|| !$.isNumeric($("#eng").val())){
			if($("#english").val() == ""|| !$.isNumeric($("#english").val())){
				alert("영어 점수 입력")
				//입력된 값 제거
				$("#english").val("")
				return
			}
			
			if($("#math").val() == ""|| isNaN($("#math").val())){
				alert("수학 점수 입력")
				//입력된 값 제거
			
				$("#math").val("")
				return
			}
$("#frm").submit()
	})

})
	 


</script>
</head>
<body>
<form action = "scoreResult4.jsp"   id = "frm"  method ="post">
     이름:<input type = "text" name = "name" id = "name">  <br/>
     국어:<input type = "text" name = "korea" id = "korea">  <br/>
     영어:<input type = "text" name = "english" id = "english">  <br/>
     수학:<input type = "text" name = "math"id = "math">  <br/>
     <!-- input type  = button은 버튼 역할만 submit은 제출해서 페이지 넘어감. action에-->
     <input type = "button" value = "jquery전송" id = "btn"/>
     </form>
</body>
</html>