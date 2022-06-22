<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Join</title>

<style>
    *{
    box-sizing: border-box;
    margin:0;
  
  }

body{
  font-family: 'Work Sans';
}

.user-join{
  margin-top:134px;
}

.demand{

  line-height: 35.19px;
  font-weight: 600;
  width: 838px;
  height: 52px;
  margin-bottom:24px;
}



.input{
  display:flex;
  align-items: center;
  margin-bottom:32px;
  font-family: 'Work Sans';
font-style: normal;
font-weight: 600;
line-height: 35px;
letter-spacing: -0.02em;

}

label{
  width:141px;
  height: 39px;
  display:inline-flex;
  justify-content: flex-end;
  margin-right:38px;
}


.input
input{
  width:24%;
  height: 48px;  
}
.last{
  margin-bottom:48px;
}

.join-button-group{

  height:58px;
}

.a{
  position:absolute;
  left:38%;
}

.button{
  width: 151px;
  height: 48px;
  border:1px solid #000;
  margin-right: 49px;
  background-color: #fff;

  font-style: normal;
font-weight: 300;
font-size: 18px;
line-height: 29px;
letter-spacing: -0.02em;
font-weight: 600;

}
</style>

</head>
<body style="background-color:#E9E9E9">
	<%-- header --%>
	<jsp:include page="container/header.jsp"/>
	
	<%-- nav --%>
	<jsp:include page="container/nav.jsp"/>

	<!-- login page -->
	<jsp:include page="container/join_feature.jsp"/>
   

	<%-- footer --%>
	<jsp:include page="container/footer.jsp"/>
</body>
</html>