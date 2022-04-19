<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>- Welcome! -</title>
<style>
.title{
 	margin:100px 0px;
}

.container {
    display: table;
    vertical-align: middle;
    width:720px;
}
.buttons{
	 margin: 50px 0px;
}
</style>
</head>
<body>
<div class="title" align="center"><h3>Welcome to JSP Index Page!</h3><br>Park Se-Hyeon</div>
<div style="text-align : center;">
	<img src="index.jpg" width="720px">
</div>
<div class="buttons" align="center">
<%
	// 로그인 세션 확인
	if(session.getAttribute("name")!=null){
		// 로그인 상태
		%><a href="main.jsp" class="btn btn-default">마이페이지로 이동</a><% 
	}else{%>
		<!-- 로그인 상태가 아님 --> 
		<a href="login.jsp" class="btn btn-default">로그인 페이지로 이동</a><%
	}
%>
	<a href="List.jsp" class="btn btn-default">게시판 목록으로 이동</a>
</div>
</body>
</html>