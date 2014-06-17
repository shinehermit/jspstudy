<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 입력폼</title>
<script type="text/javascript">
	function memberLoginCheck(){
		
		var form = document.memberLoginForm;
		
		if(form.mid.value == ""){
			alert("아이디를 입력하십시오!");
			form.mid.focus();
			return;
		}
		if(form.passwd.value == ""){
			alert("암호를 입력하십시오!");
			form.passwd.focus();
			return;
		}
	
		form.action="/member/sessionLogin.jsp";
		form.submit();
	}

</script>
</head>
<body>
	<form name="memberLoginForm" method="post">
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
			<th align="center">암호</th>
			<td><input name="passwd" type="password" maxlength="20" ></td>
		</tr>
	</tbody>
	</table>
	<p>
		<a href="javascript:memberLoginCheck();">[로그인]</a>
	</p>
	</form>
</body>
</html>