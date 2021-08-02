<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 쪽지</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/message_css/message-detail.css">
</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="/WEB-INF/view/home/header.jsp" />
		</header>
		<section id="messageFormArea">
			<fieldset id="menu">
				<jsp:include page="/WEB-INF/view/message/message-menu.jsp" />
			</fieldset>	
			<div id="message">
			<h2>상세 쪽지</h2>	
			<fieldset id="messageForm">					
				<form:form modelAttribute="message" >					
					<p>
						<label>보내는회원</label>:
						<form:input path="sendUser" readonly="true" value="${seUser}" id="input"/>
					</p>
					<p>
						<label>받는회원</label>:
						<form:input path="receiveUser" readonly="true" value="${rcUser}" id="input"/>
					</p>
					<p>
						<textarea rows="15" cols="40" readonly="readonly">${content}</textarea>
					</p>
					<c:if test="${rcUser eq authInfo.userId}">
						<p><form:textarea path="msgContent" id="text"/></p>
						<p id="errors">${err}&nbsp;</p>
						<form:hidden path="readYN" value="${readYN}"/>						
						<form:hidden path="currentPage" value="${currentPage}"/>						
					</c:if>		
					<div id="btn">
						<c:if test="${rcUser eq authInfo.userId}">	
							<form:button>답장하기</form:button>
						</c:if>						
						<a href="<c:url value="/message/message-receive/delete/${msgNo}?readYN=${readYN}&currentPage=${currentPage}" />">
							<form:button type="button">삭제</form:button></a>
						<button type="button" onclick="location.href = document.referrer;">뒤로가기</button>
					</div>
				</form:form>
			</fieldset>
			</div>
		</section>		
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp" />
		</footer>
	</div>
</body>
</html>