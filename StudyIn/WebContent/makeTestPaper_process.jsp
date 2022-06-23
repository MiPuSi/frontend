<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="com.restapi.HttpUtil, java.net.URLEncoder, org.json.JSONObject" %>
<%
	request.setCharacterEncoding("utf-8");

	String auth = (String) session.getAttribute("Authorization");
	if (auth == null) {
		response.sendRedirect("./main.jsp");
	}
	String path = request.getSession().getServletContext().getRealPath("/");
	path = path + "image/";
	MultipartRequest multi = new MultipartRequest(request, path,
			5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
%>