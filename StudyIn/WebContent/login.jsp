<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Insert title here</title>
<link href="./resources/css/loginStyle.css" rel="stylesheet" />
</head>
<body style="background-color:#E9E9E9">
	<h1 class="text-center pt-4" style="font-weight:900">입실하기</h1>
	<%-- header --%>
	<jsp:include page="container/header.jsp"/>
	
	<%-- nav --%>
	<jsp:include page="container/nav.jsp"/>

	<%-- login --%>
	<jsp:include page="container/login_feature.jsp"/>

	<%-- footer --%>
	<jsp:include page="container/footer.jsp"/>
	
	<script type="text/javascript">
        function checkDuplicateId() {          
            // parameter
            var id = document.querySelector('#email').value;
            const form = document.querySelector('.form');

            //validation check
            if (id.length == 0) {
                flag=false;
                alert("아이디를 입력해주세요.");
                document.querySelector('#email').focus();
                return false;                
            }
            
            var regId = /^[a-z]+[a-z0-9]{5,11}$/;
            if (!regId.test(id)){
                flag=false;
                alert("아이디는 영문자로 시작하는 6~12자 영문자와 숫자이어야 합니다.");
                document.querySelector('#email').focus();
                return false;
            }

            flag=true;
        }

        function checkPasswd() {
            var passwd = document.querySelector('#password').value;

            if (passwd.length == 0 && flag) {
                alert("비밀번호를 입력해주세요.");
                return false;
            }
            
            var regPasswd = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
            
            if (!regPasswd.test(passwd) &&flag) {
                alert('비밀번호는 영문자와 숫자가 각각 적어도 하나는 들어간 6~12자 영문자 또는 숫자이어야 합니다.');
                return false;
            }
          
            
        }
        var flag=true;
        const login_button = document.querySelector('.login-button');
        login_button.addEventListener('click',function(e){

            checkDuplicateId();
            checkPasswd();

        })

    </script>
</body>
</html>