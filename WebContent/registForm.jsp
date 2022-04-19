<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>- 글 등록하기 -</title>
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
</style>
</head>
<body>
<%
	String name = null;
	if(session.getAttribute("name")!=null){
		name = (String)session.getAttribute("name");
	}
%>
<div class="container container-md">
	<div class="title" align="center"><h3>- 글 등록하기 -</h3></div>

	<form action="regist.jsp" method="post">
		<div class="form-group">
			<input type="text" name="title" class="form-control" placeholder="제목" required>
		</div>
		<div class="form-group">
		<%
			if(name != null){
				%><input type="text" name="writer" class="form-control" readonly="readonly" value='${name}'><br><%
			}else{
				%><input type="text" name="writer" class="form-control" placeholder="작성자" required><br>
			<%}%>
		</div>
		<textarea rows="6" cols="25" name="content" class="form-control" placeholder="내용"></textarea><br>
		<div class="buttons" align="center">
			<input type="submit" class="btn btn-default" value="등록">
			<input type="reset" class="btn btn-default" value="입력취소">
			<a href="List.jsp"><input type="button" class="btn btn-default" value="글 목록"></a>
		</div>
	</form>
</div>
</body>
</html>