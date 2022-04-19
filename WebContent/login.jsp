<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>- LOGIN -</title>
<script type="text/javascript" src="./jsscript/member.js"></script>
<style>
html, body, .container {
    height: 100%;
}
.title{
 	margin:100px 0px;
}
.container {
    display: table;
    vertical-align: middle;
    width:540px;
}
input{
	display: table;
    horizontal-align: middle;
}

.buttons{
	 margin: 50px 0px;
}
.btn{
	margin: 5px 5px;
}

.message{
	text-align:center;
}

</style>
</head>
<body>
	<!-- 로그인 했을때 로그인 버튼대신 마이페이지 버튼으로 대체함 -->
	<%-- // 로그인 다시 시도했을때 로그인 세션 확인
	if(session.getAttribute("name")!=null){
		%>
		<script type="text/javascript">
		// 로그인 상태이면 index로 돌아감
		alert('로그인 상태입니다');
		location.href='index.jsp';
		</script>
		<%
	} --%>

	<div class="container">
		<div class="title" align="center"><h3>- L O G I N -</h3></div>
		
		<form method="POST" action="login.do" name="loginform">
			<div class="form-group">
				아이디<input class="form-control" type="text" name="userid">
			</div>
			<div class="form-group">
				비밀번호<input class="form-control" type="password" name="pwd">
			</div>
			<div class="buttons" align="center">
				<input class="btn btn-default" type="submit" value="로그인" onclick="return loginCheck()">
				<input class="btn btn-default" type="reset" value="취소">
				<input class="btn btn-default" type="button" value="회원가입" onclick="location.href='${pageContext.request.contextPath }/join.do'">
				<br><a href="List.jsp"><input class="btn btn-default" type="button" value="로그인 하지않고 게시판으로 이동"></a>
			</div>
		<div class="message">
			${message}
		</div>
		
		</form>
	</div>
</body>
</html>