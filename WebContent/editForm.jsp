<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="board.BoardDao"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardVo vo = dao.selectOne(num);
	pageContext.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>- 글 수정하기 -</title>
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
<div class="container container-md">
	<div class="title" align="center"><h3>- 글 수정하기 -</h3></div>
	<form action="edit.jsp" method="post">
		<div class="form-group">
			<input type="hidden" name="num" class="form-control" value="${vo.num }">
		</div>
		<div class="form-group">
			<input type="text" name="title" class="form-control" value="${vo.title }" required>
		</div>
		<div class="form-group">
			<input type="text" name="writer" class="form-control" value="${vo.writer }" required disabled>
		</div>
		<div class="form-group">
			<textarea rows="6" cols="25" name="content" class="form-control" placeholder="내용"></textarea>
		</div>
		<div class="buttons" align="center">
			<input type="submit" class="btn btn-default" value="수정">
			<a href="List.jsp"><input type="submit" class="btn btn-default" value="목록으로 돌아가기"></a>
		</div>
	</form>
</div>
</body>
</html>