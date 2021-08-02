<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/message_css/message-write.css">
<script type="text/javascript">
	function openSearch(){		
		window.open('message-search', '', 'left = 500, top = 150, width = 1000, height = 700')
	}
</script>
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/> 
		</header>
		<section id="messageFormArea">		
			<fieldset id="menu">
				<jsp:include page="/WEB-INF/view/message/message-menu.jsp"/>
			</fieldset>
			<div id="message">
				<h2>쪽지 보내기</h2>		
				<form:form modelAttribute="message">	
				<form:errors />
					<fieldset id="messageForm">
						<p>
							<label>보내는회원</label>:
							<form:input path="sendUser" readonly="true" value="${authInfo.userId}"  id="input1"/> 
						</p>
						<p id="errors">&nbsp;</p>
						<p>
							<label>받는회원</label>: 
							<form:input path="receiveUser" id="receiveUser" /> 
							<form:button type="button" onclick="openSearch()">검색</form:button>
						</p>
						<p id="errors"><form:errors path="receiveUser" />&nbsp;</p>
						<p>						
							<form:textarea path="msgContent"  cols="40" rows="15" id="input2"/> 
						</p>
						<p id="errors"><form:errors path="msgContent" />&nbsp;</p>					
						<div id="btn">
							<form:button >보내기</form:button>
							<form:button type ="reset">다시쓰기</form:button>
						</div>
					</fieldset>	
				</form:form>
			</div>		
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>		
	</div>
</body>
</html>