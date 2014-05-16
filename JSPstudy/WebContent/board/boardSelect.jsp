<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	
	Connection conn = null;
	
	PreparedStatement pstmt = null;
	
	ResultSet rs = null;
	try{
		%>
		<%@include file="../config/dbconn.jsp" %>
		<%
		conn = DriverManager.getConnection(url,id,pass);
		pstmt = conn.prepareStatement("Select * FROM tBoard order by idx desc");
		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
		}
		} catch (Exception e) {
			e.printStackTrace();
		
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
    }
	

%>
