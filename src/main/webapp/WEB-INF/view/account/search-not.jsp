<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/search-not.css">
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/> 
		</header>	
		<section id="searchnotArea">
			<fieldset id="searchnotForm">				
				입력 된 정보로 등록된<br> 회원을 찾을 수 없습니다.
			</fieldset>	
			<div id="btn">					
				<a href="<c:url value='/main'/>"><button>메인화면으로</button></a>
				<a href="<c:url value='/account/signUp1'/>"><button>회원가입하기</button></a>			
			</div>
		</section>	
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
	</div>
</body>
</html>