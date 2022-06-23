<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>TestPage</title>
<%@ page import="com.restapi.HttpUtil, java.net.URLEncoder, org.json.JSONObject" %>
<%@ page import="java.util.*, org.json.JSONObject, com.dto.*" %>

<%
	request.setCharacterEncoding("utf-8");

	String title = null;
	ArrayList<QuestionDTO> list = null;
	String auth = (String) session.getAttribute("Authorization");
	String id = request.getParameter("id");
	if (auth != null || id != null) {
		// API 연결
		HttpUtil ht = new HttpUtil();
		title = ht.getTestPaperTitle(auth, Integer.valueOf(id));
		list = ht.getTestPaper(auth, Integer.valueOf(id));
	}
%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
	function pdf_down() {
		console.log("PDF 다운로드");
		// Get the element.
		var element = document.getElementById('pdf_canvas');

		// Generate the PDF.
		html2pdf().from(element).set({
			margin: 0,
			filename: 'filename.pdf',
			html2canvas: { scale: 1 },
			jsPDF: {orientation: 'portrait', unit: 'mm', format: 'a4', compressPDF: true}
		}).save();
	}
</script>
</head>
<body style="background-color:#E9E9E9">
	<button onclick="pdf_down();">PDF 다운로드</button>
	<div id="pdf_canvas" style="width: 900px; margin: 0px auto; background-color:#E9E9E9">
	<%-- header --%>
	<h1 class="text-center py-4" style="font-weight:900"><%= title %></h1>
	
	<%-- nav --%>
	<nav>
        <div class="container">
            <div class="row  border border-dark border-start-0 border-end-0">
                <div class="col align-self-center my-2">
                    <p class="m-0 fs-4">학과 : </p>
                </div>
                <div class="col align-self-center my-2">
                    <p class="m-0 fs-4">학번 : </p>
                </div>
                <div class="col align-self-center my-2">
                    <p class="m-0 fs-4">이름 : </p>
                </div>
            </div>
           
        </div>
    </nav>
	
	<%-- main --%>
	<div class="container">
	<%
	int size = list.size();
	
	for (int idx = 0; idx < size; idx = idx + 2) { %>
       <div class="row" style="height: 300px;">
           <div class="col-4">
           		<img src="./resources/upload/<%= list.get(idx).getQuestionImage() %>" class="mt-2 d-block" alt="..." style ="height: 250px; width: 250px;">
           </div>
           <div class="col">
               <p class="problem-number fs-4 fw-bold">&lt;문제 #<%=idx+1 %>&gt;</p>
               <p class="problem_question fs-5"><%= list.get(idx).getQuestion() %></p>
           </div>
       </div>
       <hr />
	<%	
	}
	%>
	</div>	
	
	<%-- footer --%>
	<jsp:include page="container/footer.jsp"/>
	</div>
	
</body>