<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%!
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String sql = "select*from item";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>- item entire list -</title>
</head>
<body>
<table border="1">
	<tr>
		<th>상품</th>
		<th>가격</th>
		<th>설명</th>
	</tr>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection(url, "hr", "1234");
	stmt = con.createStatement();
	rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>" + rs.getString("name") + "</td>");
		out.println("<td>" + rs.getInt("price") + "</td>");
		out.println("<td>" + rs.getString("description") + "</td>");
		out.println("</tr>");
	}
	
	if(rs != null)
		rs.close();
	if(stmt !=null)
		stmt.close();
	if(con !=null)
		con.close();
%>
</body>
</html>