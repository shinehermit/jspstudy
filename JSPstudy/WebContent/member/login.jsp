<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "jsp.util.CookieBox" %>
<% 
	String mid = request.getParameter("mid");
	String passwd = request.getParameter("passwd");
	
	if(mid.equals(passwd)){
		String mberId=session.setAttribute("MEMBERID",mid);
	

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ����</title>
</head>
<body>
<%=mberId %>�α��ο� �����Ͽ����ϴ�.
</body>
</html>
<%
	}else{//�α��� ���н�	
%>
<script>
alert("�α��ο� �����Ͽ����ϴ�.");
history.go(-1);
</script>
<%
	}
%>