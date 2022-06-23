<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
a{
    color: inherit;
  text-decoration: none;
}

.problems{
    display:flex;
    justify-content: space-around;
    align-items: center;
}

.direction{

    width:40px;
    height:40px;
    font-size: 32px;
    border:1px
    
}

.previous{
    padding:4px 2px;
    background-color: #fff;
    transform-origin: 0% 0%;
    transform: rotate(90deg);
    border: 1px solid #000;

    position: absolute;
    left: 90%;
    

}
.next{
    padding:4px 2px;
    background-color: #fff;
    transform-origin: 0% 0%;
    transform: rotate(-90deg) ;
    border: 1px solid #000;

    position: absolute;
    top: 100%;
    left: 10%;
}

.a{
    width:100%;
    height: 100%;;
    display:block;
    position: relative;
}


.problem{
    display:flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;

}
</style>
</head>
<body style="background-color:#E9E9E9">
	<%-- header --%>
	<h1 class="text-center pt-4" style="font-weight:900">StudyIn</h1>
	<jsp:include page="container/header.jsp"/>
	
	<%-- nav --%>
	<jsp:include page="container/nav.jsp"/>

	<%-- main --%>
	<div class="container">
		<%-- 명언 타임 --%>
		<div class="my-5">
			<div class="text-center">
				<p class="m-0 py-4 border border-dark bg-white fs-6">배우고 때때로 이를 익히면 또한 기쁘지 아니한가 (學而時習之 不亦說乎) - 공자</p>
			</div>
		</div>

		<%-- solve test paper --%>
		
		<div class="my-4" style="max-width:1200px; min-width:600px;">
			<p class="fs-5 fw-bold mb-5">3. 문제가 랜덤으로 섞인 시험지를 다운로드 하시오</p>
            <div class="text-center">
                <div class="btn-group" style ="width:80%">
                    <button type="button" class=" w-100 py-2 border border-dark bg-white file-name" disabled style="color:#000; font-size: 25px;"></button>
                    <button type="button" class=" w-50 py-2 border border-dark bg-white fw-bold" style="font-size:28px; ">시험지 다운로드</button>
                </div>
            </div>
		</div>

        
        <div class="my-4">
            <p class="fs-5 fw-bold" style="margin-top:10%">4. 다음 문제들을 풀어보시오</p>
            
                <div class="px-8 problems" style="width:100%; height:60%">
                    <div class="row justify-content-around align-items-center" style="width:100%; height:90%">
                        <div class="direction col-2">
                            <div class="a">
                                <button class = "previous ">
                                    ▼
                                </button>
                            </div>
                            
                           
                        </div>
                        <div class="col-8  py-2 " style="height:100%;" >
                            <div class="problem  border border-dark bg-white" style="width:80%; height:100%; margin:0 auto">
                                <p class="problem-number fs-4"></p>
                                <div class="problem-text border border-dark" style="width:90%; height:80%">
                                    <div style="position:relative; width:100%; height:100%">
                                        <p class="question fs-3 fw-bold" style="position:absolute; top:4%; left:3%;"></p>
                                        <p class="answer fs-4 fw-bold" style="position:absolute; top:83%; left:60%;"></p>
                                    </div>
                                    
                                </div>
                            </div>
        
                        </div>
                        <div class="direction col-2">
                            <div class="a">
                                <button class = "next ">
                                    ▼
                                </button>
                            </div>
                        </div>
                    </div>
                    
    
                </div>
            
            

        </div>

        <div style="display:flex; justify-content: flex-end;">
            <a href="./main.jsp" class="fs-4 border border-dark bg-white px-2 py-1 fw-bold" style="display:inline-block; color: inherit; text-decoration: none;">
                	시험지 제출
            </a>
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
        file_component.innerHTML = file_name

    //문제번호
        const problem_num_component = document.querySelector('.problem-number');
        let problem_num = 1;
        problem_num_component.innerHTML = '&lt;문제 #'+problem_num+'&gt;'

    //question & answer
        const question_component = document.querySelector('.question');
        const answer_component = document.querySelector('.answer');
        let question= "abcd";
        let answer="0";

        question_component.innerHTML = 'Q. '+question;
        answer_component.innerHTML = 'Answer: ' +answer;

    
    
    
        function clickAnswer() {
            var text = document.getElementById("answer").value;
            if (text == 'StudyIn'){
                alert('와우! 정답입니다!');	
            } else {
                alert('그게... 정답이라고 생각하나요..? 정말로?');
            }
        }
    </script>
</body>
</html>