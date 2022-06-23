<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.restapi.HttpUtil, java.net.URLEncoder" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = request.getParameter("email");
	String passwd = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	String organization = request.getParameter("organization");

	// API 연결
	HttpUtil ht = new HttpUtil();
	String ret = ht.addMemberAPI(email, passwd, nickname, organization);
	
	// 결과
	System.out.println(ret);
	response.sendRedirect("./main.jsp");
%>