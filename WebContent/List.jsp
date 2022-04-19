<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*, java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	BoardDao dao =new BoardDao();
	List<BoardVo> ls = dao.selectAll();
	pageContext.setAttribute("ls",ls);
%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>- Board List -</title>
<style>
html, body, .container {
    height: 100%;
}

.container {
    display: table;
    vertical-align: middle;
    width:940px;
}

.title{
 	margin:60px 0px;
}

th, td {
  text-align: center;
}

.buttons{
	margin: 50px 0px;
}
a:link {
  color : black;
  text-decoration: none;
}
a:visited {
  color : darkgray;
  text-decoration: none;
}
a:hover {
  color : #5a5a5a;
  text-decoration: none;
}
</style>
</head>
<body>
	<div class="title" align="center"><h2>- B O A R D L I S T -</h2></div>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일자</th>
					<th>조회수</th>
				</tr>
			</thead>
		<tbody>
		<c:forEach var="board" items="${ls}">
			<tr>
				<td>${board.num }</td>
				<td><a href="${pageContext.request.contextPath}/Detail.jsp?num=${board.num}">${board.title}</a></td>
				<td>${board.writer }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
				<td>${board.cnt }</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		<div class="buttons" align="right">
			<a href="registForm.jsp"><input type="submit" class="btn btn-default" value="글등록"></a>
			<a href="index.jsp"><input type="button" class="btn btn-default" value="메인페이지로"></a>
		</div>
		
	</div>
	
	
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>