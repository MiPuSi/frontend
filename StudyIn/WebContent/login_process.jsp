<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.restapi.HttpUtil, java.net.URLEncoder" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = request.getParameter("email");
	String passwd = request.getParameter("password");

	// API 연결
	HttpUtil ht = new HttpUtil();
	String ret = ht.loginWeb(email, passwd);
	
	// 결과
	if (ret != "fail") {
		String param = URLEncoder.encode(ret, "utf-8");	
		session.setAttribute("Authorization", param);
		response.sendRedirect("./main.jsp");
	} else {
		response.sendRedirect("./login.jsp?error=1");
	}
%>