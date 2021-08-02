<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그메뉴</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home_css/header_logmenu.css">
<link rel="stylesheet"
	href=" <%=request.getContextPath()%>/css/home_css/main.css">
<link rel="shortcut icon" href="/proj21_funding/favicon.ico">
<link rel="icon" href="/proj21_funding/favicon.ico">
</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="/WEB-INF/view/home/header_top.jsp" />
		</header>
		<c:if test="${empty authInfo}">
			<section id="logon_infomation">
				<div class="logonmenu">
					<a href="">회원정보관리</a>
				</div>
				<div class="logonmenu">
					<a href="<c:url value='/message/message-receive'/>">메시지</a>
				</div>
				<div class="logonmenu">
					<a href="">후원현황</a>
				</div>
				<div class="logonmenu">
					<a href="">등록한 프로젝트</a>
				</div>
				<section id="logon_footer">
					<div class="logonmenu">
						<a href="">로그아웃</a>
					</div>
				</section>
			</section>
		</c:if>
		<c:if test="${!empty authInfo}">
			<section id="logon_infomation">
				<div class="logonmenu">
					<a href="<c:url value='/account/userInfo'/>">회원정보관리</a>
				</div>
				<div class="logonmenu">
					<a href="<c:url value='/message/message-receive'/>">메시지</a>
				</div>
				<div class="logonmenu">
					<a href="<c:url value='/user/funding_status/${authInfo.userNo}'/>">후원현황</a>
				</div>
				<div class="logonmenu">
					<a href="<c:url value = '/homeToMyList/${authInfo.userNo}'/>">등록한
						프로젝트</a>
				</div>
				<section id="logon_footer">
					<div class="logonmenu">
						<a href="<c:url value='/logout'/>">로그아웃</a>
					</div>
				</section>
			</section>
		</c:if>
	</div>
</body>
</html>