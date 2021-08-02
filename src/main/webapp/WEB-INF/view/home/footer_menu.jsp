<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풋터 메뉴</title>
<link rel="stylesheet"
	href=" <%=request.getContextPath()%>/css/home_css/footer_menu.css">
</head>
<body>
	<div class="menu">
		<div class="go_menu">
			<a href="<%=request.getContextPath()%>/notice/list">공지사항</a> <a
				href="">이용약관</a> <a href="<%=request.getContextPath()%>/qnaallview"
				id="go_center">고객센터</a>
		</div>
		<div class="go_question">
			<a href="<%=request.getContextPath()%>/qnawrite"><span class="ques">문의하기</span></a>
		</div>
	</div>
</body>
</html>