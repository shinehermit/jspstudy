<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String mid = request.getParameter("mid");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String ip = request.getRemoteAddr();
	
	Connection conn = null;

	PreparedStatement pstmt = null;
	
	
	try{
		%>
		<%@include file="../config/dbconn.jsp" %>
		<%
		
		conn = DriverManager.getConnection(url,id,pass);
		pstmt = conn.prepareStatement("INSERT INTO tmember ( id, name, phone, regDate) VALUES ( ?, ?, ?,NOW())");
		
		pstmt.setString(1, mid);
		pstmt.setString(2, name);
		pstmt.setString(3, phone);
				
		pstmt.executeUpdate();
		
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	


%>
<script type="text/javascript">
 location.href= "/board/boardList.jsp";
 </script>