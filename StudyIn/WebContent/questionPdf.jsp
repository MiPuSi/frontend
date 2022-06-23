<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>TestPage</title>

<style>
    .problem{
        height:25%; display:flex; flex-direction: column; align-items:space-between; position:relative;

    }
    .line{
        position:absolute; bottom:0; width: 100%;
    }

</style>

</head>
<body style="background-color:#E9E9E9">
	<%-- header --%>
	<h1 class="text-center py-4 title" style="font-weight:900"></h1>
	
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
	<div class="container problems" style= "height:150vh; ">
        <div class="problem py-4">
            <div>
                <p class="problem-number fs-4 fw-bold">&lt;문제 #1&gt;</p>
                <p class="problem_question fs-5">1+1?</p>
            </div>
            <hr class="line">
        </div>
    </div>	
    
	<%-- footer --%>
	<jsp:include page="container/footer.jsp"/>
	
	<script type="text/javascript">
		 const paper_title = document.querySelector('.title')
	     const problems_component= document.querySelector('.problems');
	
	     paper_title.innerHTML = "시험대학교_미분적분학_미분적분"
	
	     let problem_number=2;
	     let problem_question='abcd?';
	
	     function Question(problem_number,problem_question){
	         this.problem_number=problem_number;
	         this.problem_question=problem_question;
	         this.init();
	     }
	
	     Question.prototype={
	         constructor: Question,
	         init:function(){
	             const mainElem=document.createElement('div');
	             mainElem.className = "problem py-4";
	             mainElem.innerHTML = "<div>"+
	             "<p class='problem-number fs-4 fw-bold'>&lt;문제 #"+problem_number+"&gt;</p>"+
	             "<p class='problem_question fs-5'>"+problem_question+"</p>"+
	             "</div>"+
	             "<hr class='line'>"
	             problems_component.appendChild(mainElem);
	         }
	     }
	     
	     new Question(problem_number,problem_question)
	
	     problem_number=3
	     problem_question='?'
	     new Question(problem_number,problem_question)
	
	     
	     problem_number=4
	     problem_question='alwkejfl;jewnlb'
	     new Question(problem_number,problem_question)
	</script>
</body>