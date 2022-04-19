<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean  id="vo" class="board.BoardVo"/>
<jsp:useBean  id="dao" class="board.BoardDao"/>
<jsp:setProperty name="vo" property="*"/>
<%
	dao.update(vo);
	pageContext.setAttribute("vo", vo);
%>
<c:redirect url="/Detail.jsp?num=${vo.num }"></c:redirect>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>