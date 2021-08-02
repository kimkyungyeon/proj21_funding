<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/searchId-rs.css">
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/> 
		</header>
		<section id="searchIdFormArea">	
			<fieldset id="searchId">				
				회원계정은  [${userSearch.userId}]입니다.							
			</fieldset>
			<div id="btn">
				<a href ="<c:url value='/login'/>" ><button>로그인화면으로</button></a>
				<a href="<c:url value='/account/searchPw'/>"><button>비밀번호 찾기</button></a>
			</div>
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
	</div>
</body>
</html>