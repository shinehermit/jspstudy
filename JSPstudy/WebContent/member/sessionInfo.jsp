<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%
	Date time = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<html>
<head>
<title>쿠키생성</title>
<body>
세션D: <%=session.getId() %><br/>

<%
time.setTime(session.getCreationTime());
%>
세션 생성 시간: <%=formatter.format(time) %><br/>
<%
	time.setTime(session.getLastAccessedTime());
%>최근 접근 시간 : <%= formatter.format(time) %>
</body>
</head>
</html>
