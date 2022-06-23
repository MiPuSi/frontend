<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>PDF</title>

<style>
    .problem{
        height:25%; 
        width:50%;
        display:flex; 
        flex-direction: column; 
        align-items:space-between; 
        position:relative;
        border-bottom: 1px solid #000;
    }
    .line{
        position:absolute; 
        bottom:0; 
        width: 100%;
        border: 1px solid #000;
    }

    .problem_answer{
        font-size:medium;
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
	<div class="container" style= "height:150vh;">

        <div class="row problems mt-4" style="height:25%">

            <div class="problem py-4 col-6" style="border-right:1px solid #000; height:100%;">
                <div>
                    <p class="problem-number fs-4 fw-bold">&lt;답안 #1&gt;</p>
                    <p class="problem_answer fs-4"></p>
                </div>
            </div>

            <div class="problem py-4 col-6" style="height:100%;">
                <div>
                    <p class="problem-number fs-4 fw-bold">&lt;답안 #5&gt;</p>
                    <p class="problem_answer fs-4"></p>
                </div>
            </div>

            
        </div>

        <div class="row problems" style="height:25%">

            <div class="problem py-4 col-6" style="border-right:1px solid #000; height:100%;">
                <div>
                    <p class="problem-number fs-4 fw-bold">&lt;답안 #2&gt;</p>
                    <p class="problem_answer fs-4"></p>
                </div>
            </div>

            <div class="problem py-4 col-6" style="height:100%;">
                <div>
                    <p class="problem-number fs-4 fw-bold">&lt;답안 #6&gt;</p>
                    <p class="problem_answer fs-4"></p>
                </div>
            </div>

            
        </div>

        <div class="row problems" style="height:25%">

            <div class="problem py-4 col-6" style="border-right:1px solid #000; height:100%;">
                <div>
                    <p class="problem-number fs-4 fw-bold">&lt;답안 #3&gt;</p>
                    <p class="problem_answer fs-4"></p>
                </div>
            </div>

            <div class="problem py-4 col-6" style="height:100%;">
                <div>
                    <p class="problem-number fs-4 fw-bold">&lt;답안 #7&gt;</p>
                    <p class="problem_answer fs-4"></p>
                </div>
            </div>

            
        </div>


        <div class="row problems" style="height:25%;">

            <div class="problem py-4 col-6" style="border-right:1px solid #000; height:100%; border-bottom: 0px;">
                <div>
                    <p class="problem-number fs-4 fw-bold">&lt;답안 #4&gt;</p>
                    <p class="problem_answer fs-4"></p>
                </div>
            </div>

            <div class="problem py-4 col-6" style="height:100%; border-bottom: 0px;">
                <div>
                    <p class="problem-number fs-4 fw-bold">&lt;답안 #8&gt;</p>
                    <p class="problem_answer fs-4"></p>
                </div>
            </div>
        </div>
        
    </div>	
    
	<%-- footer --%>
	<jsp:include page="container/footer.jsp"/>
	
	<script type="text/javascript">
        
        const paper_title = document.querySelector('.title')

        paper_title.innerHTML = "시험대학교_미분적분학_미분적분";


        //답 배열로 저장
        let answers=['a','b','c','d','e','f'];  

        document.querySelectorAll('.problem_answer')[1].innerHTML='a';

        for(let i =0 ; i<=8; i++){
            if (answers[i]){
                document.querySelectorAll('.problem_answer')[i].innerHTML=answers[i];
            }
        }

    </script>
</body>