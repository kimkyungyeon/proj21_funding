<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 배너</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home_css/header_top.css">
</head>
<body>
	<div class="header">
		<div class="header_menu">
			<c:choose>
				<c:when test="${empty authInfo }">
					<a href="<%=request.getContextPath()%>/home/menu" class="prjcate">프로젝트
						둘러보기</a>
					<a href="<%=request.getContextPath()%>/uploadMain" class="prjcate">프로젝트
						올리기</a>
				</c:when>
				<c:otherwise>
					<a href="<%=request.getContextPath()%>/home/menu" class="prjcate">프로젝트
						둘러보기</a>
					<a
						href="<%=request.getContextPath() %>/uploadMain/${authInfo.userNo}"
						class="prjcate">프로젝트 올리기</a>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="main_frame">
			<a class="pointer_header" href="/proj21_funding/main">100펀딩</a>
		</div>

		<div class=account_menu>
			<c:if test="${authInfo.userNo < 0 }"><button class="adminHome" onclick="location.href='<%=request.getContextPath()%>/admin'">관리자 홈</button></c:if>
			<c:if test="${empty authInfo}">
				<a class="login" href="<c:url value='/login'/>">로그인</a>&nbsp;&colon;&nbsp;
				<a class="login" href="<c:url value='/account/signUp1'/>">회원가입</a>
			</c:if>
			<c:if test="${!empty authInfo}">
				<a class="login"
					href="<%=request.getContextPath()%>/home/header_logmenu"><span>${authInfo.nickName}</span>님
					환영합니다.</a>
			</c:if>
		</div>
	</div>
</body>
</html>