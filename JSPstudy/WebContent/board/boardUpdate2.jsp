<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String boardNo = request.getParameter("boardNo");
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");
	String empNo = request.getParameter("empNo");
	String ip = request.getRemoteAddr();
	
	Connection conn = null;

	PreparedStatement pstmt = null;
	
	Statement stmt = null;
	
	
	try{
		%>
		<%@include file="../config/dbconn.jsp" %>
		<%
		
		conn = DriverManager.getConnection(url,id,pass);
		stmt = conn.createStatement(); 
		
		String sql = "UPDATE tBoard SET subject='"+subject +"', writer='"+writer+"', contents='"+contents +"', empNo='"+empNo +"', regDate=NOW() where boardNo="+boardNo;
		
		stmt.executeQuery(sql);
		
	
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