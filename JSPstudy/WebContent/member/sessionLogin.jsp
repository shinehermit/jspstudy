<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="jsp.util.CookieBox" %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	if(id.equals("password")){
			session.setAttribute("MEMBERID","id");
	
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ����</title>
</head>
<body>
�α��ο� �����߽��ϴ�.

</body>
</html>
<%
	}else{
%>
<script type="text/javascript">
alert("�α��ο� �����Ͽ����ϴ�.");
history.go(-1);
</script>
<%}%>