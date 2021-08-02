<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/footer.css">
</head>
<body>
		<section id = "footer">
			<div class = "footer_menu">
					<jsp:include page="/WEB-INF/view/home/footer_menu.jsp"/>			
			</div>
			<div class ="footer_info">
					<jsp:include page="/WEB-INF/view/home/footer_info.jsp"/>
			</div>
		</section>
</body>
</html>