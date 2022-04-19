<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>- USER EDIT - </title>
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
    horizontal-align: middle;
}
.buttons{
	 margin: 50px 0px;
}
</style>
</head>
<body>
<div class="container">
	<div class="title" align="center"><h3>- 회원 정보 수정 -</h3></div>
		<form method="POST" action="${pageContext.request.contextPath }/memberUpdate.do" name="joinform">
			<div class="form-group">
				이름<input type="text" name="name" class="form-control" readonly="readonly" value="${mVo.name }">
			</div>
			<div class="form-group">
				아이디<input type="text" name="name" class="form-control" readonly="readonly" value="${mVo.userid }">
			</div>
			<div class="form-group">
				암호<input type="password" name="pwd" class="form-control">
			</div>
			<div class="form-group">
				암호확인<input type="password" name="pwdcheck" class="form-control">
			</div>
			<div class="form-group">
				이메일<input type="email" name="email" class="form-control" value="${mVo.email }">
			</div>
			<div class="form-group">
				전화번호<input type="text" name="phone" class="form-control" value="${mVo.phone }">
			</div>
			<div class="form-group">
				등급<br>
				<c:choose>
					<c:when test="${mVo.admin == 0 }">
						<input type="radio" name="admin" value="0" checked="checked">일반회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="admin"  value="1">관리자
					</c:when>
					<c:otherwise>
						<input type="radio" name="admin" value="0">일반회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="admin" value="1" checked="checked">관리자
					</c:otherwise>
				</c:choose>
			</div>
		<div class="buttons" align="center">
			<input type="submit" class="btn btn-default" value="수정" onclick="return joinCheck()">
			<input type="reset" class="btn btn-default" value="취소">
			<a href="index.jsp"><input type="submit" class="btn btn-default" value="마이페이지"></a>
		</div>
	</form>
</div>
</body>
</html>