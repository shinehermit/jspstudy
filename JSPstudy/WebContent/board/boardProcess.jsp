<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");
	String empNo = request.getParameter("empNo");
	String ip = request.getRemoteAddr();
	
	Connection conn = null;

	PreparedStatement pstmt = null;
	
	
	try{
		%>
		<%@include file="../config/dbconn.jsp" %>
		<%
		
		conn = DriverManager.getConnection(url,id,pass);
		pstmt = conn.prepareStatement("INSERT INTO tboard ( subject, writer, contents, empNo, regDate ) VALUES ( ?, ?, ?, ? ,NOW())");
		
		pstmt.setString(1, subject);
		pstmt.setString(2, writer);
		pstmt.setString(3, contents);
		pstmt.setString(4, empNo);
				
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