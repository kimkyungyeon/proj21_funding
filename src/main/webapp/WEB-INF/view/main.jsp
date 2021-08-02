<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>100펀딩 - 크리에이터를 위한 크라우드펀딩</title>
<link rel="shortcut icon" href="/proj21_funding/favicon.ico">
<link rel="icon" href="/proj21_funding/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<!-- 페이지마다 .container해서 main.css에 있는 css비율대로 마진이랑 맞추기 -->
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<section>
			<jsp:include page="/WEB-INF/view/home/main_section2.jsp"/>		
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
	</div>
</body>
</html>

