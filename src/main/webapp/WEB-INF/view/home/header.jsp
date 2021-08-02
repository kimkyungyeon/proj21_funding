<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/header.css">
</head>
<body>					
			<section id= "header">
					<div id = "header_main">
							<jsp:include page="/WEB-INF/view/home/header_top.jsp"/>
					</div>
			</section>		

</body>
</html>