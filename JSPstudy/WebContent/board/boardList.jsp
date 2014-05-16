<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
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
<script type="text/javascript">
function boardSearch(){
	
	var form = document.searchform;
	form.action="/board/boardList.jsp";
	form.submit();
}

</script>

</head>
<body>
<%
	/*한페이지에 보여줄 글의 개수를 지정한다.*/
 	int PAGE_SIZE =10; 
	request.setCharacterEncoding("UTF-8");
	
	
	/*페이징 변수*/
	int count=0;
	int startRow=0, endRow=0; //시작과 끝페이지
	int totalPageCount=0; //전체페이지 개수
	int currentPage=0;
	int pageNo=0;
	
	
	/*게시판 변수*/
	int boardNo = 0;
	String subject ="";
	String writer = "";
	String contents ="";
	String empNo = "";
	String regDate = "";
	
	/*검색변수*/
	String searchCond = "";
	String searchKey ="";
	String search="";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	searchCond = request.getParameter("searchCond");
	searchKey = request.getParameter("searchKey");
	if(request.getParameter("pageNo")!=null) { //받아온 pg값이 있을때, 다른페이지일때
		currentPage = Integer.parseInt(request.getParameter("pageNo")); // pg값을 저장
	}
	
	
	if(searchCond != null && searchKey != null){
		search ="where "+ searchCond + " like \'%"+searchKey+"%\' ";
	}
%>
	<%@include file="../config/dbconn.jsp" %>
<%	
	try{
		conn = DriverManager.getConnection(url,id,pass);
		stmt = conn.createStatement(); 
		
		String sqlCount = "Select count(*) FROM tBoard "+search;
		
		rs = stmt.executeQuery(sqlCount);
		
		
		if(rs.next()){
			count = rs.getInt(1);
		}
		
		if(count>0){
		totalPageCount = (int)Math.ceil(((double)count)/PAGE_SIZE);
		if (currentPage<=0){
			currentPage = 1;
			}
		startRow = ((currentPage -1)*PAGE_SIZE);
		endRow = currentPage*PAGE_SIZE;
		if(endRow>count) endRow =count;
		}
		
		String sql = "Select boardNo, subject, writer, regDate FROM tBoard "+search+" order by boardNo desc limit "+startRow+","+PAGE_SIZE;
		rs = stmt.executeQuery(sql);

%>
<!-- 게시판 리스트 영역시작-->
	

<div id="board_search_div">
       <form name="searchform" method="get" action="">
              <table id="board_search_table">
                    <tr>
                         <td class="board_search_td">
                               <select name="searchCond">
                                       <option value="subject">제목</option>
                                       <option value="writer">작성자</option>
                                       <!-- <option value="content">내용</option> -->
                               </select>
                         </td>
                         <td class="board_search_td">
                               <input type="text" name="searchKey">
                         </td>
                         <td class="board_search_td">
                               <a href="javascript:boardSearch();">검색</a>
                         </td>
                    </tr>
             </table>
        </form>
 </div>
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
            <td><a href="/board/boardView.jsp?boardNo=<%=boardNo%>&pageNo=<%=currentPage%>"><%=subject%></a></td>
            <td align="center"><%=writer%></td>
            <td align="center"><%=regDate%></td>
            </tr>
        <%
        }
		%>
		</tbody>
		<tfoot>
			<tr>
				<td align="center" colspan="4">
<%
	if(count > 0)
	{
		int pageCount=totalPageCount;
		int value = count /PAGE_SIZE + (count % PAGE_SIZE ==0 ? 0:1);
		
		int startPage = currentPage - (currentPage %10)+1;
		//out.print("startPage="+startPage);
		int endPage = startPage + 10;
		//out.print("endPage="+endPage);
		if(endPage > pageCount) endPage = pageCount;
		//out.print("endPage2="+endPage);
		
		if(startPage >10){
%>
		<a href="/board/boardList.jsp?pageNo=<%=startPage-10%>">[이전]</a>
<% 		}
		for(int i = startPage;i<=endPage;i++){	
			//out.print("startPage="+startPage);
			//out.print("endPage="+endPage);
%>
		<a href="/board/boardList.jsp?pageNo=<%=i %>">[<%=i %>]</a>
<% 
		}
		if(endPage < pageCount){ %>
		<a href="/board/boardList.jsp?pageNo=<%=startPage+10%>">[다음]</a>
<%		//out.print(endPage);
		//out.print(pageCount);
	}
}
%>			
			</tr>
			<tr><td align="right" colspan="4"><a href="/board/boardWriteForm.jsp" title="쓰기">[쓰기]</a></td></tr>
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