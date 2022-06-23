<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>시험지 풀기</title>
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

.info{
    display:flex;
    justify-content: center;
    
}

.comment{
    height:10vh;
    border-top: 1px solid #000;
    margin-top: 5%;
}

.gray{
    color:#000;
    opacity: 0.5;
}
</style>
</head>
<body style="background-color:#E9E9E9">
	<%-- header --%>
	<h1 class="text-center pt-4" style="font-weight:900">시험지 풀기</h1>
	<jsp:include page="container/header.jsp"/>
	
	<%-- nav --%>
	<jsp:include page="container/nav.jsp"/>

	<%-- main --%>
	<div class="container ">
		<!-- <%-- 명언 타임 --%> -->
		<div class="my-5">
			<div class="text-center">
				<p class="m-0 py-4 border border-dark bg-white fs-6">배우고 때때로 이를 익히면 또한 기쁘지 아니한가 (學而時習之 不亦說乎) - 공자</p>
			</div>
		</div>


        
        
		<div class="my-4" style="max-width:1200px; min-width:600px;">
			<p class="fs-4 fw-bold mb-5">1. 선택한 시험지가 궁금하다면 다운로드 하시오.</p>

            <div class="ranking row justify-content-center mb-4">
                <div class="col-10  px-2 py-2 fs-4" >
                    <div class="row">
                        <div class="student ID col-3 info">학번</div>
                        <div class="name col-2 info fw-600">이름</div>
                        <div class ="paper-name col-5 fw-600 info">시험지_제목</div>
                        <div class="interst-numbe col-2 info">관심</div>
                    </div>
                </div>
                <a href="#" class="col-10 bg-white px-2 py-2 fs-4 border border-dark" >
                    <div class="row">
                        <div class="student ID col-3 info">220620034</div>
                        <div class="name col-2 info fw-600">최천재</div>
                        <div class ="paper-name col-5 fw-600 info">천재대학교_자료구조론_천재제작</div>
                        <div class="interst-numbe col-2 info">3</div>
                    </div>
                </a>
            </div>

            <div class="text-center">
                <div class="btn-group" style ="width:80%">
                    <button type="button" class=" w-100 py-2 border border-dark bg-white file-name" disabled style="color:#000; font-size: 25px;"></button>
                    <button type="button" class=" w-50 py-2 border border-dark bg-white fw-bold" style="font-size:28px; ">시험지 다운로드</button>
                </div>
            </div>
		</div>

        <div style="margin-top:5%; height:15vh">
            <p class="fs-4 fw-bold my-5">2. 시험지가 마음에 들었다면 관심을 표현하십시오</p>
            <div style="width:40%; display:flex; justify-content: flex-end;">
                <div style="width:55%; display:flex; justify-content: space-between;">
                    <p class="fs-4 fw-bold">관심 있으면 클릭</p>
                    <button class="px-2 py-0 fs-5 current-paper-intrest-number" style="height:70%"></button>
                </div>
                
            </div>
        </div>
        

        
        <div style="margin-bottom:15%;">
            <p class="fs-4 fw-bold">3. 다음 문제들을 풀어보시오</p>
            
                <div class="px-8 problems" style="width:100%; height:60%">
                    <div class="row justify-content-around align-items-center" style="width:100%; height:90%">
                        <div class="direction col-2">
                            <div class="a">
                                <button class = "previous ">
                                    ▼
                                </button>
                            </div>
                            
                           
                        </div>
                        <div class="col-8  py-2 " style="height:55vh;" >
                            <div class="problem  border border-dark bg-white" style="width:80%; height:55vh; margin:0 auto">
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

        <div>
            <p class="fs-4 fw-bold">4. 시험 결과에 대해 이의신청이 있다면 아래 빈칸에 입력하시고 의견을 공유하시오</p>
        </div>

        <div class="row justify-content-center" style="margin-bottom: 5%;">
            <form action="/" method="post" id="comment" class="col-7">
                <textarea name="fname" id="fname" cols="30" rows="3" class="fs-4"  style="width:100%"></textarea>
            </form>
    
            <div class="comment-button col-3">
                <div class="a" style="height:100%; display: flex; align-items: flex-start;">
                    <button type="button" form="comment" class="fs-4 py-2 px-6 bg-white" style="width:40%; height:100%">입력</button>
                </div>
            </div>
        </div>

        <div class="comment-list  mb-4">

                <!-- 댓글 인스턴스 -->
                <div class="comment row py-4">
                    <div class="student ID col-2 fs-5 gray">220622001</div>
                    <div class="name col-2 fs-4 fw-600">김시험</div>
                    <p class ="contents col-6 fs-5 gray">트리의 정의 문제에서 답이 4번으로 되어있는데, 트리는 사이클이 없기 때문에 2번이 답인 거 같습니다.</p>
                    <div class="interst-number col-2 " style="display: flex; justify-content: center;">
                        <button class="px-2 py-0 fs-5" style="height:70%">♡ 3</button>
                    </div>
                </div>
                <div style="position:relative">
                    <p class="date fs-5 gray" style="position: absolute; right:0">2022.06.22. 14:25</p>
                </div>
                <!-- 댓글 인스턴스 -->
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

    //2번 관심 수 
    const current_paper_intrest_number_component = document.querySelector('.current-paper-intrest-number');  

    let current_paper_intrest_number=4;
    current_paper_intrest_number_component.innerHTML ="♡ " +current_paper_intrest_number;

    //댓글 인스턴스 생성

    const commet_list_component = document.querySelector('.comment-list');


    function Comment(student_ID,student_name, contents, intrest_number,date){
            this.student_ID=student_ID;
            this.student_name=student_name;
            this.contents=contents;
            this.intrest_number=intrest_number;
            this.date = date;
            this.init();
        }


        Comment.prototype={
            constructor: Comment,
            init:function(){
                const mainElem=document.createElement('div');
                mainElem.className = "comment-list  mb-4";
                mainElem.innerHTML = " <div class='comment row py-4'>"+
                    "<div class='student ID col-2 fs-5 gray'>"+this.student_ID+"</div>"+
                    "<div class='name col-2 fs-4 fw-600'>"+this.student_name+"</div>"+
                    "<p class ='contents col-6 fs-5 gray'>"+this.contents +"</p>"+
                    "<div class='interst-number col-2 ' style='display: flex; justify-content: center;'>"+
                        "<button class='px-2 py-0 fs-5' style='height:70%'>♡ "+this.intrest_number+"</button>"+
                    "</div>"+
                "</div>"+
                "<div style='position:relative'>"+
                    "<p class='date fs-5 gray' style='position: absolute; right:0'>"+this.date+"</p>"+
                "</div>"+
                "</div>"


                commet_list_component.appendChild(mainElem);
            }
        }
        new Comment(220622742,'조결과','자료구조론 시험지 문제 구성이 좋아요',0,'2022.06.22. 20:25');
    
    
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