<%@ page language="java" contentType="text/html; charset=euc_kr" pageEncoding="euc_kr"%>


<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>

<title>ClientEditSelect</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	
	<%
	 	Connection con = null;
    	PreparedStatement stmt = null;
    	ResultSet rs = null;
    	
    	String id = (String)session.getAttribute("username");    	
    	String passwd = request.getParameter("password");
    	
		
		try{
			
		String sql = "select * FROM CLIENTINFO where Clientid = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, id);
		rs = stmt.executeQuery();
			
		
		while(rs.next()){
			if(rs.getString("ClientPw").equals(passwd)){
				sql = "Delete FROM CLIENTINFO where Clientid = ?";
				
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
				stmt.executeUpdate();
				
				session.invalidate();
				out.println("<script>alert('���� �Ǿ� ����....'); location.href='main.jsp';</script>");
			}
			else{
				out.println("<script>alert('��й�ȣ�� �𸣴� ���� ��....'); location.href='ClientDelete.jsp';</script>");
				}
		}
		
				
		
		}catch(SQLException ex){
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