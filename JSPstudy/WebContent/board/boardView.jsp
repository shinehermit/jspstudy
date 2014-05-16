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
<script type="text/javascript">
	function boardUpdateCheck(){
		
		var form = document.boardUpdateForm;
		
		if(form.subject.value == ""){
			alert("제목을 입력하십시오!");
			form.subject.focus();
			return;
		}
		if(form.writer.value  == ""){
			alert("이름을 입력하십시오!");
			form.writer.focus();
			return;
		}
		if(form.contents.value  == ""){
			alert("내용을 입력하십시오!");
			form.contents.focus();
			return;
		}
		
		
		if(form.empNo.value == "" || form.empNo.value.search(/^[0-9]+$/)){
			alert("숫자를 입력하십시오!");
			form.empNo.focus();
			return;
		}
		form.action="/board/boardUpdate.jsp";
		form.submit();
	}

</script>
</head>
<body>
<%
 
	request.setCharacterEncoding("UTF-8");
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	int pageNo = Integer.parseInt(request.getParameter("pageNo"));
	String subject ="";
	String writer = "";
	String contents ="";
	String empNo = "";
	String regDate = "";
	
	Connection conn = null;
	
	Statement stmt = null;
	
	ResultSet rs = null;
%>
	<%@include file="../config/dbconn.jsp" %>
<%
	try{

		conn = DriverManager.getConnection(url,id,pass);
		stmt = conn.createStatement(); 
		
		String sql = "Select * from tBoard where boardNo ="+boardNo ;
		
		rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				boardNo		=	rs.getInt("boardNo");
				subject		=	rs.getString("subject");
				writer 		=	rs.getString("writer");
				contents	=	rs.getString("contents");
				empNo		=	rs.getString("empNo");
				regDate		=	rs.getString("regDate");
			}
%>
		<form name="boardUpdateForm" method="post">
		<input name="boardNo" type="hidden" maxlength="20" value="<%=boardNo%>">
		<table border ="1" summary="상세조회">
			<caption>게시판 상세조회</caption>
			<tbody>
				
			<tr>
				<th align="center">제목</th>
				<td><%=subject%></td>
			</tr>
			<tr>
				<th align="center">작성자</th>
				<td><%=writer%></td>
			</tr>
			<tr>
				<th align="center">사원번호</th>
				<td colspan="2"><%=empNo%></td>
			</tr>
			<tr>
				<th>날짜</th>
				<td><%=regDate%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=contents%></td>
	       </tr>

	    </table>


	    <a href="javascript:boardDeleteCheck();">게시글삭제</a>
	 	<a href="/board/boardUpdateForm.jsp?boardNo=<%=boardNo%>&pageNo=<%=pageNo%>">게시글수정</a>
	    <a href="/board/boardList.jsp?pageNo=<%=pageNo%>">목록으로</a>
</form>
<%
		} catch (Exception e) {
			e.printStackTrace();
		
		} finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
    	}
	

%>
<script type="text/javascript">
function boardDeleteCheck(){
	message ="삭제하시겠습니까?";
	if(confirm(message) == true){
	location.href = "/board/boardDelete.jsp?boardNo=<%=boardNo%>";
	}
	return;
}
</script>
</body>
</html>
