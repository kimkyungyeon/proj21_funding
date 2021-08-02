<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창작자 정보</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/project_list_css/projectUserInfo.css">
<script type="text/javascript">
	function openQuestion(){		
		window.open('<%=request.getContextPath()%>/project/question-write', '', 'left = 600, top = 150, width = 500, height = 500');
	}
</script>
</head>
<body>
	<fieldset id="projectUserInfo">
		<h2>창작자 소개</h2>
		<div>				
			${prj[0].prjNo.userNo.userName}				
			<button value="${prj[0].prjNo.userNo.userId}"  onclick="openQuestion()" >문의하기</button>
		</div>
	</fieldset>
</body>
</html>