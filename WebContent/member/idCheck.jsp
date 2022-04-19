<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<!DOCTYPE html>
<html>
<script type="text/javascript" src="./jsscript/member.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.title{
 	margin:30px 0px;
}
.container {
    display: table;
    vertical-align: middle;
    width:420px;
}
.inputid{
	width:200px;
}
.divid{
	display:flex;
	justify-content:center;
	align-items:center;
}
.idchktext{
	margin:20px 0px;
	text-align:center;
}
</style>
</head>
<body>
<div class="container">
	<div class="title" align="center"><h3>- 아이디 중복확인 -</h3></div>
		<form method="get" action="/idCheck.do" name="frm">
			<div class="form-group">
				<div class="divid"><div>아이디</div><input type="text" name="userid" class="form-control inputid" value="${userid}">
				<input type="submit" class="btn btn-default" value="중복확인"></div>
				<div class="idchktext">
					<c:if test="${result==1}">
						<script type="text/javascript"> opener.document.frm.userid.value="";</script>
						${userid}는 이미 사용중인 아이디입니다.
					</c:if>
					<c:if test="${result==-1}">
						${userid}는 사용 가능한 아이디입니다.
					<input type="button" class="btn btn-default" value="사용" onclick="idOk()">
					</c:if>
				</div>
			</div>
		</form>
</div>
</body>
</html>