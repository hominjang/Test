<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>

	<%@ include file="dbconn.jsp" %>
	<%
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("password");
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "Select * From CLIENTINFO";
		int result = 0;
		
	try	{
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		while(rs.next()){
			if(rs.getString("ClientId").equals(id) && rs.getString("ClientPw").equals(passwd)){
				result=1;
				session.setAttribute("username",id);
				response.sendRedirect("mainClientVersion.jsp");
			}
			
			else if(rs.getString("ClientId").equals(id)){
				result=2;
				out.println("<script>alert('�Ƶ� ����� Ʋ���ηȳ��� �ٽ� �α��� �غ�����'); location.href='login.jsp';</script>");

			}
			
		}
		
			 if(result == 0){
					out.println("<script>alert('�޸� ���ƽ��ϱ�? ����ü �ƴ°� ���ϱ�?'); location.href='login.jsp';</script>");
		}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
%>
<body>

</body>
</html>