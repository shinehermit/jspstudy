<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 입력폼</title>
<script type="text/javascript">
	function memberJoinCheck(){
		
		var form = document.memberJoinForm;
		
		if(form.mid.value == ""){
			alert("아이디를 입력하십시오!");
			form.mid.focus();
			return;
		}
		if(form.name.value  == ""){
			alert("이름을 입력하십시오!");
			form.name.focus();
			return;
		}
		
		if(form.phone.value == ""){
			alert("전화번호를 입력하십시오!");
			form.phone.focus();
			return;
		}
		if(form.phone.value.search(/^[0-9]+$/)){
			alert("숫자만 입력하십시오!");
			form.phone.focus();
			return;
		}
		form.action="/member/join.jsp";
		form.submit();
	}

</script>
</head>
<body>
	<form name="memberJoinForm" method="post">
	<table border ="1" summary="가입폼">
	<caption>
	가입폼
	</caption>
	
	<colgroup>
		<col width="100" />
		<col width="500" />
	</colgroup>
	<tbody>
		<tr>
			<th align="center">아이디</th>
			<td><input name="mid" type="text" maxlength="20" ></td>
		</tr>
		<tr>
			<th align="center">이름</th>
			<td><input name="name" type="text" maxlength="10"  /></td>
		</tr>
		<tr>
			<th align="center">전화번호</th>
			<td><input name="phone" type="text" maxlength="14"/></td>
		</tr>		
	</tbody>
	</table>
	<p>
		<a href="javascript:memberJoinCheck();">[가입]</a>
	</p>
	</form>
</body>
</html>