<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>100펀딩-후원완료</title>
<link rel="shortcut icon" href="/proj21_funding/favicon.ico">
<link rel="icon" href="/proj21_funding/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/funding_css/fundingSuccess.css">
</head>
<body>
<div class="container">
	<header>		   
		<jsp:include page="/WEB-INF/view/home/header.jsp"/>
	</header>
	<div>
		<img src="<%=request.getContextPath() %>/images/admin/check.jpg" style="width:300px;height:300px;"/>
		<h1>성공적으로 펀딩이 완료되었습니다.</h1>
		<button type="button" class="btnGo" onclick="location.href='<%=request.getContextPath()%>/'">메인으로 </button>
		<button type="button" class="btnGo" onclick="location.href='<%=request.getContextPath()%>/user/funding_status/${authInfo.userNo}'">후원한 프로젝트 보기</button>
	</div>
	<footer>
		<jsp:include page="/WEB-INF/view/home/footer.jsp" />
	</footer>
</div>
</body>
</html>