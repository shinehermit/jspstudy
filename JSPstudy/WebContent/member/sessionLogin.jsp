<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String mid = request.getParameter("mid");
	String passwd = request.getParameter("passwd");

	String ip = request.getRemoteAddr();
	
	int count=0;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String search = "WHERE id ='"+mid+"' AND passwd ='"+passwd+"'";
	

		%>
		<%@include file="../config/dbconn.jsp" %>
		<%
		
		try{
			conn = DriverManager.getConnection(url,id,pass);
			stmt = conn.createStatement(); 
			
			String sqlCount = "Select count(*) FROM tMember "+search;
			
			rs = stmt.executeQuery(sqlCount);
			
			if(rs.next()){
				count = rs.getInt(1);
			}
				
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	if(count == 1){
		session.setAttribute("MEMBERID",mid);
	

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 성공</title>
</head>
<body>
로그인에 성공했습니다.

</body>
</html>
<%
	}else{
%>
<script type="text/javascript">
alert("로그인에 실파하였습니다.");
history.go(-1);
</script>
<%}%>


