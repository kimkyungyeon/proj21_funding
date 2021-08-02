<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>uploadInfo</title>
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/upload_info.css">		
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script type="text/javascript">
			/* 프로젝트 등록 */
		$(function(){
			var contextPath = "<%=request.getContextPath()%>";
			$("#register_proj").on("click", function(){
				
				var num =	${list.bankAccount}
				console.log(num)
			 	if(num != null){
			 		window.location.href = contextPath+"/registerForm";					
				}else{				
					alert("계좌등록 후 사용할 수 있습니다.")
					window.open(contextPath+'/registerAccount', '계좌 등록', 'top = 150,  width = 1000, height = 350 ');					
		
				} 				
			});			
			
			   $("#MOVE_TOP_BTN").click(function() {
		     		$('html, body').animate({
		     			scrollTop : 0
		     		}, 400);
		     		return false;
		     	});
			
			/*로그인 페이지로  */
			var contextPath = "<%=request.getContextPath()%>";
			$("#login").on("click", function(){
				alert("로그인 후 사용하실 수 있습니다.")
			 window.location.href = contextPath+"/login";
			});			
			
			
		});
			
		   
			
			
	
		</script>
</head>
<body>
<%-- ${list.bankAccount } --%>
	<section id = "info">
		<section id = "info_top">
				<jsp:include page="/WEB-INF/view/upload/info_top.jsp"/>
		</section>
		<section id = "info_mid">
				<jsp:include page="/WEB-INF/view/upload/info_mid.jsp"/>
					
		</section>
		<section id = "info_bottom">
				<jsp:include page="/WEB-INF/view/upload/info_bottom.jsp"/>
		</section>
		<button  id="MOVE_TOP_BTN">&#10514</button>	
	</section>
</body>
</html>