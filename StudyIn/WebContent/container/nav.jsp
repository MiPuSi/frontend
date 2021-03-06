<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.restapi.HttpUtil, java.net.URLEncoder, org.json.JSONObject" %>
<%
	request.setCharacterEncoding("utf-8");

	String auth = (String) session.getAttribute("Authorization");
	String str1 = "";
	String str2 = "";
	String str3 = "";
	String str4 = "";
	String str5 = "";
	if (auth != null) {
		// API 연결
		HttpUtil ht = new HttpUtil();
		String ret = ht.memberInfo(auth);
		if (ret != null) {
			JSONObject obj = new JSONObject(ret);
			str1 = obj.getString("organization");
			str2 = obj.getString("num");
			str3 = obj.getString("nickName");
			str4 = obj.getString("advice");
			str5 = obj.getString("adviser");
		}
	}
%>

<nav>
	<div class="container">
		<div class="row  border border-dark border-start-0 border-end-0">
			<div class="col align-self-center my-2">
				<p class="m-0 fs-4">학과 : <%= str1 %></p>
			</div>
			<div class="col align-self-center my-2">
				<p class="m-0 fs-4">학번 : <%= str2 %></p>
			</div>
			<div class="col align-self-center my-2">
				<p class="m-0 fs-4">이름 : <%= str3 %></p>
			</div>
		</div>
		<div class="row  border border-dark border-start-0 border-end-0 border-top-0 fw-bold">
			<div class="col align-self-center my-2 border-secondary border-end text-center">
				<a href="./makeTestPaper.jsp" type="button" class="btn fs-4 px-0 m-1 fw-bold">시험지 제작</a>
			</div>
			<div class="col align-self-center my-2 border-secondary border-end text-center">
				<a href="./search.jsp" type="button" class="btn fs-4 px-0 m-1 fw-bold">시험지 검색</a>
			</div>
			<div class="col align-self-center my-2 border-secondary border-end text-center">
				<a href="./myTestPaper.jsp" type="button" class="btn fs-4 px-0 m-1 fw-bold">My 시험지</a>
			</div>
			<div class="col align-self-center my-2 text-center">
				<a href="./ranking.jsp" type="button" class="btn fs-4 px-0 m-1 fw-bold">랭킹</a>
			</div>
		</div>
	</div>
</nav>