<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function clickAnswer() {
		var text = document.getElementById("answer").value;
		if (text == 'StudyIn'){
			alert('와우! 정답입니다!');	
		} else {
			alert('그게... 정답이라고 생각하나요..? 정말로?');
		}
	}
</script>
</head>
<body style="background-color:#E9E9E9">
	<%-- header --%>
	<h1 class="text-center pt-4" style="font-weight:900">StudyIn</h1>
	<jsp:include page="container/header.jsp"/>
	
	<%-- nav --%>
	<jsp:include page="container/nav.jsp"/>

	<%-- main --%>
	<div class="container text-center">
		<%-- 명언 타임 --%>
		<div class="my-5">
			<div class="text-center">
				<p class="m-0 py-4 border border-dark bg-white fs-6">배우고 때때로 이를 익히면 또한 기쁘지 아니한가 (學而時習之 不亦說乎) - 공자</p>
			</div>
		</div>

		<%-- main image --%>
		<div class="my-4" style="max-width:800px; min-width:600px; margin: 0 auto;">
			<p class="fs-5 fw-bold">1. 다음 글이 나타내는 의미는 무엇인가</p>
			<img data-src="holder.js/300x300" class="img-thumbnail" alt="300x300" src="./resources/image/home.png" 
						data-holder-rendered="true" style="width: 700px; height:400px;margin:auto; display:inline-block;">
			<div class="row ps-4 my-5" style="width:700px;">
				<div class="col">
					<p class="fs-5 fw-bold">정답 : </p>
				</div>
				<div class="col-6">
					<input class="form-control" type="text" name="answer" id="answer" placeholder="Enter the string" required/>
				</div>
				<div class="col">
					<button class="btn btn-light btn-outline-dark" onclick="clickAnswer()">입력</button>
				</div>
			</div>
		</div>
	</div>

	<%-- footer --%>
	<jsp:include page="container/footer.jsp"/>
</body>
</html>