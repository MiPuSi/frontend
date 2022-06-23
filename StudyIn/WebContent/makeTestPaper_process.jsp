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
	path = path + "resources/upload/";
	MultipartRequest multi = new MultipartRequest(request, path,
		5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	
	// parameter 담기용
	HashMap<String, String> hm = new HashMap<String, String>();
	
	Enumeration params = multi.getParameterNames();
	
	while (params.hasMoreElements()) {
		String name = (String)params.nextElement();
		String value = multi.getParameter(name);
		hm.put(name, value);
	}
	
	Enumeration files = multi.getFileNames();
	// parameter 담기용
	HashMap<String, MultipartRequest> hi = new HashMap<String, MultipartRequest>();
	while (files.hasMoreElements()) {
		String name = (String) files.nextElement();
		String filename = multi.getFilesystemName(name); // 이게 중요
		hm.put(name, filename);
	}
	
	// API 연결
	HttpUtil ht = new HttpUtil();
	String ret = ht.addTestPaper(auth, hm);
	
	response.sendRedirect("./solveTestPaper.jsp");
%>