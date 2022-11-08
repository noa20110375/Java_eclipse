<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" ></script>
<script>

$(document).ready(function(){
	//id 값 가져옴... id랑 일치 ...
	$("#send").click(function(){//검색버튼 클릭
		//가고자하는 서버페이지

	sendIt();
	
			
	})//send
	$("#dong").keydown(function(e){
		//동 이름 입력하고 엔터 인식 
		if(e.keyCode == 13){
			sendIt();
		}
	})
	var sendIt = function(){
	if($("#dong").val() == ""){
		alert("동이름을 입력하세요.")
		return false;
	}
		$.getJSON("zipProcess.jsp", {
			//가지고 가는 값
	"dong" : $("#dong").val()},
			//콜백 해서 출력 
			function(resp){
			//alert(resp);
			var str ="<table>"
			$.each(resp,function(key, val){
				str += "<tr>"
				//enter 치면 값출력
				//obj에 들어가 있는 이름을 가져옴
				
				str+= "<td>"+ val.zipcode+"</td>"
				str+= "<td>"+ val.sido+ "</td>"
				str+= "<td>"+ val.gugun+"</td>"
				str+= "<td>"+ val.dong+"</td>"
				str+= "<td>"+ val.bunji+"</td>"
				str  += "</tr>"
			})
			str += "</table>"
			$("#result").html(str);
	
	}
			
		)	//getJSON
	}
	//result 영역에 클릭 이벤트가 발생하는데 현재 클릭된 tr 마다 발생
	$("#result").on("click","tr",function(){
		//현재(this) 클릭한 1번째 td 를 가져옴.
		var address =  $("td:eq(1)",this).text()+""+
		$("td:eq(1)",this).text()+""+
		$("td:eq(2)",this).text()+""+
		$("td:eq(3)",this).text()+""+
		$("td:eq(4)",this).text();
	
		//val() 값 없으면 get   값이 있으면 set 의 의미
		$(opener.document).find("#zipcode").val($("td:eq(0)",this).text());
		$(opener.document).find("#addr").val(address)
		
		self.close()
	//alert(address)
	})//resulton
	
	
})//document


</script>
</head>
<body>
<table>
<tr>
<td>동이름입력:<input type = "text" name = "dong" id = "dong" />
<td><input type = "button" value = "검색" id = "send"/>

</tr>
<tr>
</table>
<div id ="result"></div>
</body>
</html>