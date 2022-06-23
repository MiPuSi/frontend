<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>My 시험지</title>

</head>
<body style="background-color:#E9E9E9">
	<%-- header --%>
	<h1 class="text-center pt-4" style="font-weight:900">My 시험지</h1>
	<header>
        <div id="justify-content" class="container my-2">
            <div class="row justify-content-end">
                <a href="#" type="button" class="btn btn-outline-secondary col-1 px-0 m-1">퇴실하기</a>
            </div>
        </div>
    </header>
	
	<%-- nav --%>
	<jsp:include page="container/nav.jsp"/>

	<%-- main --%>
	<div class="container" style="margin-bottom: 5%;">
        <div class="row my-4" >
            <div class="col-6 px-4" style="display:flex; justify-content: flex-end;">
                <a href="#" class="fs-4 px-2 py-2 bg-white border border-dark">My 시험지</a>
            </div>
            <div class="col-6 px-4" style="display:flex; justify-content: flex-start;" >
                <a href="#" class="fs-4 px-2 py-2 bg-white border border-dark">관심 시험지</a>
            </div>
        </div>

		<div class="my-4" style="max-width:1200px; min-width:600px;">
            <p class="fs-4  my-5 fw-600">1. 내가 만든 시험지는 다음과 같습니다.</p>
        </div>

        <div class="ranking row justify-content-center">
            <div class="col-10  px-2 py-2 fs-4" >
                <div class="row">
                    <div class="ranking-number col-1 info"></div>
                    <div class="student ID col-3 info">학번</div>
                    <div class="name col-2 info fw-600">이름</div>
                    <div class ="paper-name col-5 fw-600 info">시험지_제목</div>
                    <div class="interst-numbe col-1 info">관심</div>
                </div>
            </div>
            <div class="col-10 bg-white px-2 py-2 fs-4 border border-dark" >
                <div class="row">
                    <div class="ranking-number col-1 info">1</div>
                    <div class="student ID col-3 info">20181</div>
                    <div class="name col-2 info fw-600">abc</div>
                    <div class ="paper-name col-5 fw-600 info">알고리즘분석</div>
                    <div class="interst-numbe col-1 info">2400</div>
                </div>
            </div>

            <!-- 인스턴스 추가 -->
            
        </div>
    </div>

	<%-- footer --%>
	<jsp:include page="container/footer.jsp"/>
	
	
	
<script type="text/javascript">
	function clickAnswer() {
		var text = document.getElementById("answer").value;
		if (text == 'StudyIn'){
			alert('와우! 정답입니다!');	
		} else {
			alert('그게... 정답이라고 생각하나요..? 정말로?');
		}
	}
	
	 //인스턴스 구조
    // <div class="col-10 bg-white px-2 py-2 fs-4 border border-dark" >
    //         <div class="row">
    //             <div class="ranking-number col-1 info">1</div>
    //             <div class="student ID col-3 info">2018102251</div>
    //             <div class="name col-2 info fw-600">황세훈</div>
    //             <div class ="paper-name col-5 fw-600 info">알고리즘분석</div>
    //             <div class="interst-numbe col-1 info">2400</div>
    //         </div>
    // </div>


    function Ranking(ranking_number,student_ID, student_name, paper_name, intrest_number){
            this.ranking_number=ranking_number;
            this.student_ID=student_ID;
            this.student_name=student_name;
            this.paper_name=paper_name;
            this.intrest_number=intrest_number;
            this.init();
        }

        Ranking.prototype={
            constructor: Ranking,
            init:function(){
                const mainElem=document.createElement('div');
                mainElem.className = "col-10 bg-white px-2 py-2 fs-4 border border-dark";
                mainElem.innerHTML = "<div class='row'>"+
                "<div class='ranking-number col-1 info'>"+this.ranking_number+"</div>"+
                "<div class='student ID col-3 info'>"+ this.student_ID+"</div>"+
                "<div class='name col-2 info fw-600'>"+ this.student_name+"</div>"+
                "<div class ='paper-name col-5 fw-600 info'>"+this.paper_name+"</div>"+
                "<div class='interst-numbe col-1 info'>"+this.intrest_number+"</div>"+
                "</div>"
                document.querySelector('.ranking').appendChild(mainElem);
            }
        }

    //인스턴스(랭킹) 추가 코드
    let ranking_number =2;
    let student_ID = 201815;
    let student_name = 'abc';
    let paper_name ='asdf' ;
    let interest_number = 2300;
    new Ranking(ranking_number,student_ID,student_name,paper_name,interest_number);


    ranking_number =3;
    student_ID = 201215;
    student_name = 'abcd';
    paper_name ='asas' ;
    interest_number = 200;
    new Ranking(ranking_number,student_ID,student_name,paper_name,interest_number);
</script>
</body>
</html>