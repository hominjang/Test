<%@ page language="java" contentType="text/html; charset=euc_kr" pageEncoding="euc_kr"%>


<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>

<title>Database SQL</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
	    /*request.setCharacterEncoding("euc-kr"); �̰� �ȵȵ���....*/ 
		
		String id = request.getParameter("user_id");
		String passwd = request.getParameter("user_pw");
		String name = request.getParameter("user_name");
		String location = request.getParameter("user_address");
		String job = request.getParameter("user_job");
		
		String Year = request.getParameter("user_birth_year");
		String Month = request.getParameter("user_birth_month");
		String Day = request.getParameter("user_birth_day");
		
		String date = Year+Month+Day;
		
		
		PreparedStatement stmt = null;
		
		try {
			String sql = "insert into CLIENTINFO VALUES (?,?,?,?,?,?)";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id); 
			stmt.setString(2, passwd);
			stmt.setString(3, location); 
			stmt.setString(4, name); 
			stmt.setString(5, job);
			stmt.setString(6, date);
			
			stmt.executeUpdate();
			out.println("<script>alert('�Ƶ� ���������� �Ϸ� �Ǿ�������'); location.href='main.jsp';</script>");
			}
		catch(SQLException ex){
				out.println("CLientINfo ���̺� ���� �����߽��ϴ�.<br>");
				out.println("SQLException: " + ex.getMessage());
			}
		finally{
				if (stmt != null)
					stmt.close();
				
				if (conn != null)
					conn.close();
			}
	%>
</body>
</html>