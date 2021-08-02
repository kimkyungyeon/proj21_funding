<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/userChangePw1.css">
</head>
<body>
	<div class="container">
		<section id="userChangePwArea">
			<form:form modelAttribute="userChangePw">
				<fieldset id="userChangePwForm">
					<p>						
						<label>현재 비밀번호</label>:
						<form:password path="currentUserPw"/>
					</p>
					<p id="errors"><form:errors path="currentUserPw"/>&nbsp;</p>
					<p>						
						<label>변경 비밀번호</label>:
						<form:password path="newUserPw"/>
					</p>
					<p id="errors"><form:errors path="newUserPw"/>&nbsp;</p>
					<p>						
						<label>변경 비밀번호확인</label>:
						<form:password path="confirmUserPw"/>
					</p>
					<p id="errors"><form:errors path="confirmUserPw"/>&nbsp;</p>
					<div id="btn">
						<p><form:button>변경하기</form:button></p>	
					</div>	
				</fieldset>
			</form:form>
		</section>
	</div>
</body>
</html>