<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id,pwd 비동기 함수</title>

<script src="https://code.jquery.com/jquery-3.6.1.js" ></script>
<script>

$(document).ready(function(){
	//비동기 함수 
	//~나가라 같은 건가?
	//get이라는 방법. getBtn을 클릭하면
	//버튼 id
	$("#getBtn").click(function(){
		//1.가야할 서버페이지 주소,2. 가져가야할 값 3.콜백 함수 2번을 처리한 값을 가져감
		$.get("process.jsp",{
			//2. 가져가야할 값 
			"id":$("#id").val(),
			"pwd":$("#pwd").val(),
			"method": "get"
		},
		//콜백함수
		
		function(resp){
			//alert(resp)
		//태그가 있는 함수는 html함수를 써줘야 그대로 표현됨.
		//밑에 div result 에 나옴 새로 고침이 아니라 특정영역의 값을 바꿈.
			$("#result").html(resp);
		
		}
		)//get

	})//getBtn Click
	
	$("#postBtn").click(function(){
			//post 
		$.post(
				"process.jsp",	
				{
					"id":$("#id").val(),
					"pwd":$("#pwd").val(),
					"method":"post"
				},
				//콜백함수
				function(resp){
					$("#result").html(resp);
				}
			)//post 끝
		})//postBtn 

		//ajax 
		//새로고침 없이 GET, POST 요청하는 기능
		$("#ajaxBtn").click(function(){
			$.ajax({
			
			type: "get",
			url: "process.jsp",
			data: {
				id: $("#id").val(),
				pwd: $("#pwd").val(),
				method: "ajax"
			},
			//콜백함수
			success:function (resp){
				$("#result").html(resp);
			},
			error : function (resp){
				alert(e + "error")
			}
				
				
			})//ajax
		})//ajaxBtn
		
		//on 함수 어떠한 이벤트와 연결
		//클릭이벤트 연결
		$("#ajaxBtn_on").on("click",function(){
			$.ajax({
				
				type: "get",
				url: "process.jsp",
				data:{
					id: $("#id").val(),
					pwd: $("#pwd").val(),
					method: "ajax_on"
				},
				success:function(resp){
					$("#result").html(resp);
				} ,
				error : function (resp){
					alert(e + "error")
				}
			})//ajax_on
				
				
			})//ajax_onBtn
			
		
})//document

</script>
</head>
<body>

id: <input type = "text" id = "id" name = "id"><br/>
pwd:<input type = "password"  id  = "pwd" name = "pwd"><br/>
<button type = "button" id = "getBtn">get전송</button>
<button type = "button" id = "postBtn">post전송</button>
<button type = "button" id = "ajaxBtn">ajax전송</button>
<button type = "button" id = "ajaxBtn_on">ajax_on전송</button>

<hr/>
 
 <div id = "result">
 </div>
</body>
</html>