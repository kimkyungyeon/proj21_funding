<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/proj21_funding/css/servicecenter_write.css">
<link rel="stylesheet"
	href="/proj21_funding/css/admin_css/resultClose.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/notice_css/write.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="/proj21_funding/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/proj21_funding/bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript"
	src="/proj21_funding/bootstrap/js/bootstrap.min.js"></script>
<script>
	function closeWindow(){
		opener.parent.location.reload();
		window.close();
	}
</script>
</head>
<body>
<br><br><br>
<br><br><br>
<br><br><br>
<div class="close1">
<img src="<%=request.getContextPath() %>/images/admin/check.jpg" style="width:150px; hegiht:150px">
<h1>게시글 작성이 완료되었습니다.</h1>
<br>
<button class="menubutton" onclick="closeWindow()">닫기</button>
</div>
</body>
</html>