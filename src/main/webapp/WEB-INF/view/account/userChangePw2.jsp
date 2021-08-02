<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/userChangePw2.css">
</head>
<body>
	<div class="container">
		<section id="userChangePwArea">
			<fieldset id="userChangePwForm">
				<p>비밀번호가 변경되었습니다.</p>				
			</fieldset>
			<button type="button" onclick="window.close();">확인</button>
		</section>
	</div>
</body>
</html>