<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
<script>
    $('.carousel').carousel({
      interval: 100000 //기본 5초
    })
</script>
<style>
    .carousel-inner > .carousel-item > img{
      width: 640px;
      height: 500px;
    }
</style>
<title>Insert title here</title>
<link href="./resources/css/solve.css" rel="stylesheet" />
</head>
<%@ page import="com.restapi.HttpUtil, java.net.URLEncoder, java.util.*, org.json.JSONObject, com.dto.*" %>
<%
	request.setCharacterEncoding("utf-8");
	ArrayList<QuestionDTO> ret = null;
	int exam_id = 0;
	String auth = (String) session.getAttribute("Authorization");
	if (auth != null) {
		// API 연결
		HttpUtil ht = new HttpUtil();
		exam_id = ht.myPaperInfo(auth);
		if (exam_id != -1) {
			ret = ht.getTestPaper(auth, exam_id);
			System.out.println(ret.toString());
		}
	}
%>
<body style="background-color:#E9E9E9">
	<%-- header --%>
	<h1 class="text-center pt-4" style="font-weight:900">StudyIn</h1>
	<jsp:include page="container/header.jsp"/>
	
	<%-- nav --%>
	<jsp:include page="container/nav.jsp"/>

	<%-- main --%>
	<div class="container">
		<%-- solve test paper --%>
		
		<div class="my-4" style="max-width:1200px; min-width:600px;">
			<p class="fs-5 fw-bold mb-5">3. 문제가 랜덤으로 섞인 시험지를 다운로드 하시오</p>
            <div class="text-center">
                <div class="btn-group" style ="width:80%">
                	<form action="./questionPdf.jsp?id=<%= exam_id %>" method="post" name="loginForm">
	                    <button type="submit" class="btn btn-light btn-outline-dark" style="font-size:28px;">시험지 다운로드(pdf)</button>
                    </form>
                </div>
            </div>
		</div>

		<div style="max-width:1200px; min-width:600px;">
			<p class="fs-5 fw-bold" style="margin-top:10%">4. 다음 문제들을 풀어보시오</p>
			<div id="carouselExampleControls" class="carousel slidev my-5" data-bs-ride="carousel" style="max-width:700px; margin:0px auto;">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <p class="fs-5"><b>&lt;문제 #1&gt;</b> <%= ret.get(0).getQuestion() %></p>
			      <img src="./resources/upload/<%= ret.get(0).getQuestionImage() %>" class="d-block w-100" alt="...">
			    </div>
			    <%
			    	int size = ret.size();
			    
			    	for (int i = 1;i < size; i++) { %>
			    		<div class="carousel-item">
			    		  <p class="fs-5"><b>&lt;문제 #<%= i + 1 %>&gt;</b> <%= ret.get(i).getQuestion() %></p>
					      <img src="./resources/upload/<%= ret.get(i).getQuestionImage() %>" class="d-block w-100" alt="...">
					    </div>
			    <%
			    	}
			    %>
			  </div>
			  
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
	        <div style="display:flex; justify-content: flex-end;">
	            <a href="./main.jsp" class="fs-4 btn btn-light btn-outline-dark py-1 fw-bold">시험지 제출</a>
	        </div>
		</div>
	</div>

	<%-- footer --%>
	<jsp:include page="container/footer.jsp"/>
	
	<script type="text/javascript">
    //시험지 정보
        let university_name="a";
        let subject_name="b";
        let detail_name="c";
    
        let file_name = university_name+'_'+subject_name+'_'+detail_name+'.pdf';
        const file_component = document.querySelector('.file-name');
        file_component.innerHTML = file_name;
    </script>
</body>
</html>