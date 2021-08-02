<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/signUp2.css">
</head>
<body>
<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/> 
		</header>
		<section id="signUpArea">		
			<div id="signUpForm">
				<h1>회원가입이 완료되었습니다.</h1>				
			</div>			
			<div id="btn">
				<a class="btn1" href="<c:url value='/login'/>"><button>로그인하기</button></a>
				<a class="btn1" href="<c:url value='/main'/>"><button>홈페이지 바로가기</button></a>	
			</div>	
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>		
	</div>
</body>
</html>