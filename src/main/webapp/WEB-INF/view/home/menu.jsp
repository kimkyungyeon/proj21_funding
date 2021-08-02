<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home_css/menu.css">
<link rel="stylesheet"
	href=" <%=request.getContextPath()%>/css/home_css/main.css">
</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="/WEB-INF/view/home/header_top.jsp" />
		</header>
		<section id="menulist">
			<div class="menulist2">
				<div class="project_menu">
					<a href="<%=request.getContextPath()%>/projectList">모든 프로젝트</a>
				</div>
				<%-- <div class="project_menu">
					<a href="<%=request.getContextPath()%>/sucessImbakProject">성공
						임박 프로젝트</a>
				</div> --%>
			</div>					
			<div class="menulist2">
				<div class="cate_title">카테고리</div>
				<c:forEach items="${prjCategory}" var="prjCategory">
					<div class="project_menu"><a href="<c:url value='/projectList/${prjCategory.pCategoryNo}'/>">${prjCategory.pCategoryName}</a></div>
				</c:forEach>
			</div>
		</section>
	</div>
</body>
</html>