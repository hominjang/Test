<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Database SQL</title>
</head>
<body>
	<%
		Connection conn = null;
		try{
			String url = "jdbc:mysql://localhost:3306/JSPBookDB?serverTimezone=UTC";
			String user = "root";
			String password = "1234";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			out.println("������ ���̽� ������ �����߽��ϴ�.");
		} catch (SQLException ex){
			out.println("�����ͺ��̽� ������ �����߽��ϴ�. <br>");
			out.println("SQLExcotion: " + ex.getMessage());
		} finally{
			if (conn != null){
					conn.close();
			}
			
		}	
	%>
</body>
</html>