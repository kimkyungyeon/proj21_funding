<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>uploadMain</title>
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
</head>
<body>
		<section class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<section id = "upload_info">
			<jsp:include page="/WEB-INF/view/upload/upload_info.jsp"/>		
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
		</section>		

</body>
</html>