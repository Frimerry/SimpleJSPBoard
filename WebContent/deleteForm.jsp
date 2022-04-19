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
 	margin:100px 0px;
}
.container {
    display: table;
    vertical-align: middle;
    width:540px;
}
.delcheck{
	text-align:center;
}
.buttons{
	 margin: 50px 0px;
}
</style>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
%>
<div class="container container-md">
	<form action="delete.jsp">
	<div class="title" align="center"><h3>- 글 삭제 확인 -</h3></div>
	<input type="hidden" value="<%=num%>" name="num">
	<div class="delcheck">
		글을 삭제하시겠습니까?<br>취소하면 게시판 목록으로 돌아갑니다.
	</div>
		
		<div class="buttons" align="center">
			<input type="submit" class="btn btn-default" value="삭제">
			<a href="List.jsp"><input type="button" class="btn btn-default" value="취소"></a>
		</div>
	</form>
</div>
</body>
</html>