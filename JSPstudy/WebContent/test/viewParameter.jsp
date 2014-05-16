<%@page import="org.apache.catalina.util.ParameterMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<b>request.getParameter() 메소드사용</b><br/>
name 파라미터 = <%=request.getParameter("name") %><br/>
address 파라미터 = <%=request.getParameter("address") %>
<p>
<b>request.getParameterValues() 메소드사용</b><br/>
<%
	String[] values = request.getParameterValues("pet");
	if(values != null){
		for(int i = 0;i<values.length;i++){
			%>
			<%=values[i] %>
			<%
		}
	}			
%>
<p>
<b>request.getParameterNames() 메소드 사용</b><br/>
<%
	Enumeration enum1 = request.getParameterNames();
	while(enum1.hasMoreElements()){
		String name = (String)enum1.nextElement();
		%>
		<%=name %>
		<%
	}
%>
<p>
<b>request.getParameter()메소드 사용</b><br/>
<% 
	Map parameterMap = request.getParameterMap();
	String[] nameParam = (String[])parameterMap.get("name");
	String[] addressParam = (String[])parameterMap.get("address");
	String[] petParam = (String[])parameterMap.get("pet");
	if(nameParam != null){
		%>
		name = <%=nameParam[0] %><br/>
		address = <%=addressParam[0] %><br/>
		pet1 = <%=petParam[0] %><br/>
		pet2 = <%=petParam[1] %><br/>
		pet3 = <%=petParam[2] %><br/>
		<%
	}
%>

</body>
</html>