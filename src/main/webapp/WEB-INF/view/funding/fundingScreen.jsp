<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>100펀딩</title>
<link rel="shortcut icon" href="/proj21_funding/favicon.ico">
<link rel="icon" href="/proj21_funding/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
</head>
<body>
<div class="container">
	<header>		   
		<jsp:include page="/WEB-INF/view/home/header.jsp"/>
	</header>
	<section>
		<jsp:include page="/WEB-INF/view/funding/fundingBody.jsp"/>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
	</footer>

</div>
</body>
</html>