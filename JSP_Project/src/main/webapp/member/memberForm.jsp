<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.1.js" ></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src = "../js/member.js"></script>
</head>
<body>
<!-- mt-? 여백 넣기 -->
<div class="container mt-3">
  
  <div align = "right">
<a href ="loginForm.jsp">로그인</a>
</div>
<h2>회원가입</h2>
  <form action="memberInsertPro.jsp" method ="post"  id = "frm">
    <div class="form-group">
      <label for="name">Name:</label>
      
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
    </div>
    
    
   
    
      <div class="row">
    <div class="col">
        <label for="userid">UserID:</label>
      <input type="text" class="form-control" id="userid" placeholder="Enter userID" name="userid" readonly = "readonly">
    </div>
    
    <div class="col align-self-end">
      <button type = "button" class = "btn  btn-primary" id = "idCheckBtn">중복확인</button>
    </div>
  </div>
    
   <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter Password" name="pwd">
    </div>
    
    <div class="form-group">
      <label for="pwd_check">Password_Check:</label>
      <input type="password" class="form-control" id="pwd_check" placeholder="Enter Password_Check" name="pwd_check">
    </div>
    
     <div class="form-group">
      <label for="email">Email:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter Email" name="email">
    </div>
    
         <div class="form-group">
      <label for="phone">Phone:</label>
      <input type="text" class="form-control" id="phone" placeholder="Enter Phone" name="phone">
    </div>
    
    
    
    
    
    <div class="form-check-inline">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="admin" value = "0" checked>일반회원
  </label>
</div>

<div class="form-check-inline">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="admin" value = "1">관리자
  </label>
</div><br/><br/>

    <div>
    <button type="button" class="btn btn-primary" id = "sendBtn">Submit</button>
  </div>
  </form>
</div>
</body>
</html>