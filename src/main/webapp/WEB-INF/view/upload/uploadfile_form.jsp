<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			var cnt = 1;
			function fn_addFile(){
				$("#d_file").append("<br>" + "<input type ='file' name = 'file" + cnt +"'/> ");
			}
		</script>
</head>
<body>
		<h1>파일 업로드</h1>
		<form action=" <%=request.getContextPath() %>/fileUpload"  method="post" enctype= "multipart/form-data">
				<label>아이디 : </label>
						<input type="text" name = "id"><br>
				<label>이름 :  </label>
						<input type="text" name = "name"><br>
						<input type="button" value = "파일 추가"  onclick="fn_addFile()"><br>
						
						<div id ="d_file">
						
						</div>
						<input type = "submit" value = "업로드">		
		</form>

</body>
</html>