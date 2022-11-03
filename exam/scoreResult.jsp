<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String name = request.getParameter("name");
	int korea = Integer.parseInt(request.getParameter("korea"));
	int english = Integer.parseInt(request.getParameter("english"));
	int math = Integer.parseInt(request.getParameter("math"));
	int total = korea + english + math;
	// 자바는 기본으로 double을 기본으로 잡음
	//float 쓰고 f 붙여줘야함.
	//Long 은 l 붙이고.
	//자바에서는 정수형 보다 실수형이 크다고 여김
	float average = total / 3.0f;
	//평균이 90점 이상 A, 80점 이상 B, 70 이상이면 C, 나머지는 F
	//grade 변수 선언
	String grade = "";
	switch ((int) average / 10) {
	//90~99 A
	//80~89 B
	//70~79 C
	//작은 거에 큰 거를 담을 때는 명시적 캐스팅을 해야함
	//a= (int)b; a:int b:long
	case 9:
		grade = "A";
		break;
	case 8:
		grade = "B";
		break;
	case 7:
		grade = "C";
		break;
	default:
		grade = "F";
		break;

	}
	%>

	이름:<%=name%><br /> 국어:<%=korea%><br /> 영어:<%=english%><br /> 수학:<%=math%><br />
	<!-- total 을 안에 넣어도 됨. -->
	총점:<%=korea + english + math%><br /> 평균:<%=average%><br /> 학점:<%=grade%>
</body>
</html>