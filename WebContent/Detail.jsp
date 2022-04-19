<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean  id="dao" class="board.BoardDao"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardVo vo= dao.selectOne(num);
	pageContext.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>- 글 내용보기 -</title>
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
    width:720px;
}
.c1{
 	width: 120px;
 	text-align:center;
 	background-color:whitesmoke;
}
</style>
</head>
<body>
<div class="container">
	<div class="title" align="center"><h3>- B O A R D -</h3></div>
	<table class="table">
	<tbody>
		<tr><th class ="c1">글번호</th><td> ${vo.num }</td></tr>
		<tr><th class ="c1">제목  </th><td> ${vo.title }</td></tr>
		<tr><th class ="c1">작성자 </th><td> ${vo.writer }</td></tr>
		<tr><th class ="c1">등록일자 </th><td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${vo.regdate }"/></td></tr>
		<tr><th class ="c1">조회수</th><td> ${vo.cnt }</td></tr>
		<tr><th class ="c1">내용 </th><td>${vo.content }</td></tr>
	</tbody>
	</table>
	
	<div class="buttons" align="center">
		<a href="${pageContext.request.contextPath}/editForm.jsp?num=${vo.num}"><input type="submit" class="btn btn-default" value="수정"></a>
		<a href="${pageContext.request.contextPath}/deleteForm.jsp?num=${vo.num}"><input type="submit" class="btn btn-default" value="삭제"></a>
		<a href="List.jsp"><input type="submit" class="btn btn-default" value="목록으로 돌아가기"></a>
	</div>
</div>	
</body>
</html>