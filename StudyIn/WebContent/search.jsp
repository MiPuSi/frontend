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
	<h1 class="text-center pt-4" style="font-weight:900">시험지 검색</h1>
	<jsp:include page="container/header.jsp"/>
	
	<%-- nav --%>
	<jsp:include page="container/nav.jsp"/>

	<%-- main --%>
	<div class="container" style="margin-bottom: 5%;">
        

		<div class="my-4" style="max-width:1200px; min-width:600px;">
            <p class="fs-4  my-5 fw-600">1.풀고자 하는 시험지의 키워드를 입력해 시험지 검색을 진행하시오.</p>
        </div>

        <div class="row justify-content-center">
            <p class="col-2 fs-4" style="display:flex; justify-content:center; align-items: center;">&lt;시험지 검색&gt;</p>
            <form action="/" method="post" id="searchForm" class="col-5">
                    
                <input type="text" id="fname" name="fname" class="py-2 fs-3" style="width:90%;">
               
            </form>
    
            <div class="join-button-group col-3">
                <div class="a" style="height:100%; display: flex; align-items: flex-start;">
                    <button type="button" form="searchForm" class="fs-4 py-2 px-6 bg-white" style="width:50%;">검색</button>
                </div>
            </div>
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
            <a href="#" class="col-10 bg-white px-2 py-2 fs-4 border border-dark" >
                <div class="row">
                    <div class="ranking-number col-1 info">1</div>
                    <div class="student ID col-3 info">220620034</div>
                    <div class="name col-2 info fw-600">최천재</div>
                    <div class ="paper-name col-5 fw-600 info">천재대학교_자료구조론_천재제작</div>
                    <div class="interst-numbe col-1 info">3</div>
                </div>
            </a>

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
        let student_ID = 220620034;
        let student_name = '황컴공';
        let paper_name ='컴공대학교_자료구조론_트리' ;
        let interest_number = 3;
        new Ranking(ranking_number,student_ID,student_name,paper_name,interest_number);
</script>
</body>
</html>