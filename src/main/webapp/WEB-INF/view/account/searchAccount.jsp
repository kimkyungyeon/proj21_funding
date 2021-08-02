<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/searchAccount.css">
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/> 
		</header>
		<section id="searchArea">
			<fieldset id="searchForm">
				<fieldset id="searchIdForm">
					<a href="<c:url value='/account/searchId'/>"><button>회원계정 찾기</button></a>
				</fieldset>
				<fieldset id="searchPwForm">
					<a href="<c:url value='/account/searchPw'/>"><button>비밀번호 찾기</button></a>
				</fieldset>
			</fieldset>					
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>		
	</div>
</body>
</html>