<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/searchId.css">
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/> 
		</header>
		<section id="searchIdArea">
			<form:form action="searchId-rs" modelAttribute="userSearch">
			<form:errors />
				<fieldset id="searchIdForm">
				<h2>회원계정 찾기</h2>
					<div id="searchData">
						<div id="searchCont">
						<p>
							<label>회원성명</label><br>
							<form:input path="userName" id="input" placeholder=" 이름을 입력해주세요."/> 					
						</p>
						<p id="errors"><form:errors path="userName"/>&nbsp;</p>
						</div>
						<div id="searchCont">
						<p>
							<label>이메일</label><br>
							<form:input path="email" id="input" placeholder=" 가입하신 이메일 주소를 입력해주세요."/> 
						</p>
						<p id="errors"><form:errors path="email"/>&nbsp;</p>
						</div>
					</div>
				<form:button id="submit">아이디 찾기</form:button>		
				</fieldset>							
			</form:form>				
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
	</div>
</body>
</html>