<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON파싱</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" ></script>
<script>
//비동기 함수
$(document).ready(function(){
	//값가져옴
	$("#b1").click(function(){
		//콜백 뒤에 status를 넣으면 상태를 알 수 있음.
		//코드200 이면 성공.
		$.get("test.txt",function(resp,status){
			var str = "데이터:"  +resp + "상태 :"+status
			//text함수
			$("#result").text(str);
			
		})//get

	})//b1 

$("#b2").click(function(){
	$.get("test.txt",function(resp){
		//제이슨 파싱으로 출력  제이슨을 var d에 넣음
		var d = JSON.parse(resp);
		//alert(d.length)
		//배열
		var str ="";
		// d.length만큼 반복
		for(i = 0; i<d.length; i++){
			//콘솔상 출력
			console.log("picture:"+d[i].picture)
			//이름 누적
			str += "이름:" +d[i].irum+"<br/>"
			// 회원 번호 누적
			str += "회원번호:" + d[i].memberNumber+"<br/><br/>"
		  
		}// for 
		//결과 출력
		$("#result").html(str)
	
	})//get
	
	
})//b2

$("#b3").click(function(){
	var str = "";
	//test 읽어오고
	$.getJSON("test.txt", function(resp){
		//쿼리 반복 each //하나하나가 val 에 들어감
		$.each(resp,function(key,val){
			str += "회원번호:" + val.memberNumber+"<br/>"
			str += "이름:" + val.irum+"<br/>"
			str += "사진:" + val.picture+"<br/>"
		})//each
		$("#result").html(str)
	}) //getJSON


})//b3

})//document



</script>
</head>
<body>
<h3>exam03</h3>

<button  id = "b1">결과1</button>
<button  id = "b2">결과2</button>
<button  id = "b3">결과3</button>
 <div id = "result"></div>
</body>
</html>