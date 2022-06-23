<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Make Test Paper</title>
<script type="text/javascript">
	var idx = 1;

	function add_div(){
		idx += 1;
		
		if (idx >= 11) {
			alert('최대 10문항만 가능합니다.');
			return;
		}
		var div = document.createElement('div');
		div.innerHTML = document.getElementById('question-section').innerHTML;
		document.getElementById('add-section').appendChild(div);
		
		document.getElementsByClassName('lbl-question')[idx-1].innerHTML="&lt;문제 #" + idx + "&gt;";
		document.getElementsByClassName('lbl-answer')[idx-1].innerHTML="&lt;답안 #" + idx + "&gt;";
		
		var tmp = idx - 1;
		var str = "questionDtos[" + tmp + "]";
		document.getElementsByClassName('dtos-question')[idx-1].setAttribute('name', str + '.question');
		document.getElementsByClassName('dtos-question-image')[idx-1].setAttribute('name', str + '.questionImage');
		document.getElementsByClassName('dtos-answer')[idx-1].setAttribute('name', str + '.answer');
		document.getElementsByClassName('dtos-answer-image')[idx-1].setAttribute('name', str + '.answerImage');
	}
	
	function makePaper() {
		var form = document.paperForm;
		form.submit();
	}
</script>

</head>
<body style="background-color:#E9E9E9">
	<%-- header --%>
	<h1 class="text-center pt-4" style="font-weight:900">시험지 제작</h1>
	<jsp:include page="container/header.jsp"/>
	
	<%-- nav --%>
	<jsp:include page="container/nav.jsp"/>
	
	<%-- main --%>
	<div class="container">
		<div class="m-5">
			<form class="form-signin" name="paperForm" action="http://localhost:8000/api/exam/upload" method="post" enctype="multipart/form-data">
				<div class="row">
					<%-- chap 1 --%>
					<div>
						<p class="fs-5 fw-bold">1. 시험지 제작을 진행하기 위해서, 시험지 &lt;제목&gt; 구성에 맞게 빈칸을 채우시오. </p>
					</div>
					<div class="col-2">
						<p class="text-center mt-4 fw-bold">&lt;제목&gt;</p>
					</div>
					<div class="col">
						<div class="form-group row my-3">
							<label class="col-sm-1 align-self-center mb-0">학교명 : </label>
							<div class="col-sm-4">
								<input type="text" id="schoolName" name="schoolName" class="form-control" placeholder="school" autocomplete="off" required autofocus/>
							</div>
						</div>
						<div class="form-group row my-3">
							<label class="col-sm-1 align-self-center mb-0">강의명 : </label>
							<div class="col-sm-4">
								<input type="text" id="lessonName" name="lessonName" class="form-control" placeholder="lesson" autocomplete="off" required/>
							</div>
						</div>
						<div class="form-group row my-3">
							<label class="col-sm-1 align-self-center mb-0">자유명 : </label>
							<div class="col-sm-4">
								<input type="text" id="freeName" name="freeName" class="form-control" placeholder="free..." autocomplete="off" required/>
							</div>
						</div>
					</div>
					
					<%-- chap 2 --%>
					<div class="mt-5">
						<p class="fs-5 fw-bold">2. 시험지에 입력하고자 하는 문제를 등록하시오. </p>
					</div>

					<%-- 문제 --%>
					<div id="question-section">
						<div class="row">
							<div class="col-2">
								<p class="lbl-question text-center mt-1 fw-bold">&lt;문제 #1&gt;</p>
							</div>
							<div class="col">
								<div class="form-group row">
						    		<div class="col-sm-8">
										<textarea class="form-control dtos-question" id="question" name="questionDtos[0].question" placeholder="question" rows="3" style="height: 121px;" required></textarea>
									</div>
								</div>
								<div class="form-group row my-3">
									<div class="col-sm-8">
										<input type="file" accept="image/*" class="dtos-question-image" name="questionDtos[0].questionImage" class="form-control"/>
									</div>
								</div>
							</div>
						</div>
						<%-- 답안 --%>
						<div class="row mt-3">
							<div class="col-2">
								<p class="lbl-answer text-center mt-1 fw-bold">&lt;답안 #1&gt;</p>
							</div>
							<div class="col">
								<div class="form-group row">
						    		<div class="col-sm-8">
										<textarea class="form-control dtos-answer" id="question" name="questionDtos[0].answer" placeholder="answer" rows="3" style="height: 121px;"></textarea>
									</div>
								</div>
								<div class="form-group row my-3">
									<div class="col-sm-8">
										<input type="file" accept="image/*" class="dtos-answer-image" name="questionDtos[0].answerImage" class="form-control"/>
									</div>
								</div>
							</div>
						</div>
						<hr/>
					</div>
					<div id="add-section"></div>
					
					<%-- 버튼 --%>
					<div class="float-end mt-3">
						<input type="button" value="add" class="btn btn-light btn-outline-dark col-sm-1 float-end me-5" id="add_btn" onclick="add_div()"/>
					</div>
					<div class="float-end mt-3">
						<input type="button" value="시험지 제작" class="btn btn-light btn-outline-dark col-sm-2 float-end me-5" id="submit_btn" onclick="makePaper()"/>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%-- footer --%>
	<jsp:include page="container/footer.jsp"/>
</body>