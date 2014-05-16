<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 상세조회</title>
<style type="text/css">
	* {font-size: 9pt;}
	p {width: 600px; text-align: right;}
	table thead tr th {background-color: gray;}
</style>
</head>
<body>
<%
 
	request.setCharacterEncoding("UTF-8");
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	String subject ="";
	String writer = "";
	String contents ="";
	String empNo = "";
	String regDate = "";
	
	Connection conn = null;
	
	Statement stmt = null;
	
	ResultSet rs = null;
	try{
%>
		<%@include file="../config/dbconn.jsp" %>
<%
		conn = DriverManager.getConnection(url,id,pass);
		stmt = conn.createStatement(); 
		
		String sql = "Select * from tBoard where boardNo ="+boardNo ;
		
		rs = stmt.executeQuery(sql);
%>
<!-- 게시판 리스트 영역시작-->
		<table border ="1" summary="상세조회">
			<caption>게시판 상세조회</caption>
			<tbody>
			<%
			
			if(rs.next()){
				boardNo		=	rs.getInt("boardNo");
				subject		=	rs.getString("subject");
				writer 		=	rs.getString("writer");
				contents	=	rs.getString("contents");
				empNo		=	rs.getString("empNo");
				regDate		=	rs.getString("regDate");
		
			%>
			<tr>
				<th>번호</th>
				<td><%=boardNo%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=subject%></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=writer%></td>
			</tr>
			<tr>
				<th>사원번호</th>	
				<td><%=empNo%></td>
			</tr>
			<tr>
				<th>날짜</th>
				<td><%=regDate%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=contents%></td>
	       </tr>
<%} %>
	    </table>
	 
	    <a href="/board/boardDelete.jsp?boardNo=<%=boardNo%>">게시글삭제</a>
	 
	    <a href="/board/boardList2.jsp">목록으로</a>

<%
		} catch (Exception e) {
			e.printStackTrace();
		
		} finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
    	}
	

%>
</body>
</html>
