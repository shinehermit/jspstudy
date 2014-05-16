<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 입력폼</title>
<script type="text/javascript">
	function boardWriteCheck(){
		
		var form = document.boardWriteForm;
		
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
		form.action="/board/boardProcess.jsp";
		form.submit();
	}

</script>
</head>
<body>
	<form name="boardWriteForm" method="post">
	<table border ="1" summary="입력폼">
	<caption>
	입력폼
	</caption>
	
	<colgroup>
		<col width="100" />
		<col width="500" />
	</colgroup>
	<tbody>
		<tr>
			<th align="center">제목</th>
			<td><input name="subject" type="text" maxlength="20" ></td>
		</tr>
		<tr>
			<th align="center">작성자</th>
			<td><input name="writer" type="text" maxlength="6"  /></td>
		</tr>
		<tr>
			<th align="center">사원번호</th>
			<td colspan="2"><input name="empNo" type="text" maxlength="20"  /></td>
		</tr>
		<tr>
			<th align="center">내용</th>
			<td colspan="2"><textarea name="contents" rows="" cols=""></textarea></td>
		</tr>
		
	</tbody>
	</table>
	<p>
		<a href="javascript:boardWriteCheck();">[쓰기]</a>
	</p>
	</form>
</body>
</html>