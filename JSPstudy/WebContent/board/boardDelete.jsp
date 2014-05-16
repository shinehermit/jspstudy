<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String boardNo = request.getParameter("boardNo");
	
	Connection conn = null;

	PreparedStatement pstmt = null;
	
	
	try{
		%>
		<%@include file="../config/dbconn.jsp" %>
		<%
		
		conn = DriverManager.getConnection(url,id,pass);
		pstmt = conn.prepareStatement("DELETE FROM tBoard WHERE boardNo ="+boardNo);
		
		pstmt.executeUpdate();
		
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}


%>
<script>
 
    alert("게시글이 삭제되었습니다");  // 게시글이 삭제되었다는 경고창을 띄워주고
 
    location.href="/board/boardList.jsp";          // 리스트페이지로 이동합니다.
 
</script>