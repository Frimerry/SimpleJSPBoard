<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./jsscript/member.js"></script>
<style>
html, body, .container {
    height: 100%;
}
.title{
 	margin:60px 0px;
}

.container {
    display: table;
    vertical-align: middle;
    width:540px;
}
.idsize{
	width:430px;
}
.iddiv{
	display:flex;
}
.buttons{
	 margin: 50px 0px;
}
.buttonmargin{
	margin: 2px 10px;
}
</style>
</head>
<body>
<div class="container container-md">
	<div class="title" align="center">
	<h3>- J O I N -</h3></div>
	
	<form method="POST" action="join.do" name="joinform">
	
			<div class="form-group">
				이름*<input type="text" class="form-control" name="name">
			</div>
			<div class="form-group">
				아이디*
				<div class="iddiv">
					<input type="text" class="form-control idsize" name="userid"><input type="hidden" name="reid">
					<input class="btn btn-default" type="button" value="중복확인" onclick="idCheck()">
				</div>
			</div>
			<div class="form-group">
			암호*<input type="password" class="form-control" name="pwd">
			</div>
			<div class="form-group">
				암호확인*<input type="password" class="form-control" name="pwdcheck">
			</div>
			<div class="form-group">
				이메일<input type="email" class="form-control" name="email">
			</div>
			<div class="form-group">
				전화번호<input type="text" class="form-control" name="phone" placeholder="01X-XXXX-XXXX 형식으로 입력하세요.">
			</div>
			<div class="form-group">
				회원등급<br><input type="radio" name="admin" value="0" checked="checked">일반회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="admin" value="1">관리자
			</div>
			*표시 항목은 필수 입력 항목입니다.
			<div class="buttons" align="center">
				<input type="submit" class="btn btn-default buttonmargin" value="회원가입" onclick="return joinCheck()">
				<input type="reset" class="btn btn-default buttonmargin" value="입력취소">
				<a href="index.jsp"><input type="button" class="btn btn-default buttonmargin" value="메인으로 돌아가기"></a>
			</div>
			
				${message }
	</form>
</div>
</body>
</html>