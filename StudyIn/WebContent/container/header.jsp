<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String auth = (String) session.getAttribute("Authorization");
	if (auth == null) {%>
		<header>
			<div id="justify-content" class="container my-2">
				<div class="row justify-content-end">
					<a href="./join.jsp" type="button" class="btn btn-outline-secondary col-1 px-0 m-1">수강신청</a>
					<a href="./login.jsp" type="button" class="btn btn-outline-secondary col-1 px-0 m-1">입실하기</a>
				</div>
			</div>
		</header>
<%		
	} else {%>
		<header>
			<div id="justify-content" class="container my-2">
				<div class="row justify-content-end">
					<a href="./logout.jsp" type="button" class="btn btn-outline-secondary col-1 px-0 m-1">퇴실하기</a>
				</div>
			</div>
		</header>
<%		
	}
%>