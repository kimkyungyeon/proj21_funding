<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/userReSign.css">
</head>
<body>
<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
		</header>		
		<section id="reSignArea">
		<h1>회 원 탈 퇴</h1>			
			<form:form modelAttribute="userInfo">
			<form:errors />
				<fieldset id="reSignForm">
					<p>
						<label>비밀번호확인 : 					
						<form:password path="userPw" />						
						</label>					
					</p>
					<p id="errors"><form:errors path="userPw"/>&nbsp;</p>					
					<div id="btn">					
						<form:button>탈퇴하기</form:button>	
						<form:button type="button" onclick="history.back(-1);">뒤로가기</form:button>								
					</div>
				</fieldset>										
			</form:form>
		</section>		
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>		
	</div>
</body>
</html>