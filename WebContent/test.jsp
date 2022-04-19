<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="member.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body>
	<%
	MemberDAO Dao = MemberDAO.getInstance();
	Connection con = Dao.getConnection();
	out.print("DBCP 연동 성공");
	%>
</body>
</html>