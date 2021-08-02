<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창작자에게 문의하기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/project_list_css/question-write.css">
</head>
<body>
	<div id="question">
		<h2>창작자에게 문의하기</h2>		
		<form:form modelAttribute="message">	
		<form:errors />
			<fieldset id="questionForm">				
				<form:hidden path="sendUser" value="${authInfo.userId}"/>						
				<p>
					<label>받는회원</label>: 
					<form:input path="receiveUser" readonly="true" value="${prj[0].prjNo.userNo.userId}" id="receiveUser"/> 							
				</p>						
				<p>						
					<form:textarea path="msgContent"  cols="40" rows="15" id="input"/> 
				</p>
				<p id="errors"><form:errors path="msgContent" />${complet}&nbsp;</p>					
				<div id="btn">
					<form:button >보내기</form:button>
					<form:button type="button" onclick="window.close();">닫기</form:button>
				</div>
			</fieldset>	
		</form:form>
	</div>	
</body>
</html>