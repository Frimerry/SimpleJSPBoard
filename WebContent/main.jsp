<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
html, body, .container {
    height: 100%;
}
.title{
 	margin:70px 0px;
}
.container {
    display: table;
    vertical-align: middle;
    width:540px;
}
.user{
	text-align:center;
}
.userimg{
	margin: 20px 20px;
}
.buttons{
	 margin: 50px 0px;
}
</style>
</head>
<body>
<div class="container">
	<div class="title" align="center"><h3>- W E L C O M E -</h3></div>
	<div class="user">
		<div class="userimg">
			<img src="user.png" width="280px">
		</div>
		안녕하세요,<br>
		${loginUser.name}(${loginUser.userid})님!
	</div>
	<form method="get" action="logout.do">
		<div class="buttons" align="center">
			<input type="submit" class="btn btn-default" value="로그아웃">
			<input type="button" class="btn btn-default" value="회원정보수정" onclick="location.href='memberUpdate.do?userid=${loginUser.userid}'">
			<a href="List.jsp" class="btn btn-default">게시판 목록 보기</a>
		</div>
	</form>
</div>
</body>
</html>