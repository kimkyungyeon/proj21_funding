<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/login.css">
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/> 			
		</header>
		<section id="loginFormArea">
			<div id="loginForm">
			<h1>로그인</h1>
			<form:form modelAttribute="userLogin">
			<form:errors />
				<fieldset id="loginUser">
					<div id="logindata">
						<div id="loginidpw">
							<p id="idpwinput">
								<form:input path="userId" id="input" placeholder="이메일 주소 입력"/>
							</p>
							<p id="errors"><form:errors path="userId"/>&nbsp;</p>
								</div>		
						<div id="loginidpw">								
							<p id="idpwinput">
								<form:password path="userPw" id="input" placeholder="비밀번호 입력"/>
							</p>
							<p id="errors"><form:errors path="userPw"/>&nbsp;</p>
							</div>							
						</div>
					<p id="remember">
						<label><form:checkbox path="rememberUserId"/>아이디 기억하기</label>
					</p>
					<form:button id="login">로 그 인</form:button>				
				</fieldset>		
				<fieldset id="hrefBtn">
					<p id="go_signon">아직 계정이 없으신가요??<a href="<c:url value='/account/signUp1'/>"><span>회원가입하기</span></a></p>
					<p id="search_idpw"><a href="<c:url value='/account/searchAccount'/>">아이디/비밀번호를 잊으셨나요??</a></p>
				</fieldset>			
			</form:form>	
			</div>					
		</section>
	</div>
</body>
</html>