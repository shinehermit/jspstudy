<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<style type="text/css">
	* {font-size: 9pt;}
	p {width: 600px; text-align: right;}
	table thead tr th {background-color: gray;}
</style>
</head>
<body>
<%
 
	request.setCharacterEncoding("UTF-8");
	int boardNo = 0;
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
		
		String sql = "Select boardNo, subject, writer, regDate FROM tBoard order by boardNo desc" ;
		
		rs = stmt.executeQuery(sql);

%>
<!-- 게시판 리스트 영역시작-->
	<table border ="1" summary="게시판 목록">
		<caption>게시판 목록</caption>
		<colgroup>
			<col width="30px"/>
			<col width="300px"/>
			<col width="80px"/>
			<col width="80px"/>
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록 일시</th>
			</tr>
		</thead>
		<tbody>
		<%
        while(rs.next()){
        	boardNo=rs.getInt("boardNo");
        	subject=rs.getString("subject");
			writer=rs.getString("writer");
			regDate=rs.getString("regDate");
        	%>
            <tr>
            <td align="center"><%=boardNo%></td>
            <td><a href="/board/boardView2.jsp?boardNo=<%=boardNo%>"><%=subject%></a></td>
            <td align="center"><%=writer%></td>
            <td align="center"><%=regDate%></td>
            </tr>
        <%
        }
		%>
		</tbody>
		<tfoot>
			<tr>
				<td align="center" colspan="4">1</td>
			</tr>
		</tfoot>
	</table>
	
	<%      
 
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
%>
<!-- 게시판 리스트 영역끝 -->
</body>
</html>