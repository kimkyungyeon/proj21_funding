<%@ page import="proj21_funding.service.impl.BoardServiceImpl"%>
<%@ page import="proj21_funding.service.BoardService"%>
<%@ page import="proj21_funding.service.impl.CategoryServiceImpl"%>
<%@ page import="proj21_funding.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_view.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/notice_css/listdetail.css">
<style>
table {
	border: 1px solid;
}

td {
	border: 1px solid;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="/WEB-INF/view/home/header_top.jsp" />
		</header>
		<section class="notice_view">
			<div class="top">
				<div class="top_title">
					<span class="notice">공지사항</span>
				</div>
				<div class="top_category">
					<span class="cate"><a
						href="<%=request.getContextPath()%>/notice/list" class="catetext">전체보기</a></span>
					<c:forEach var="bc" items="${bc }">
						<c:if test="${bc.categoryClass eq 'board' }">
							<span class="cate"><a
								href="<%=request.getContextPath()%>/notice/list/${bc.categoryNo }"
								class="catetext">${bc.categoryName }</a></span>
						</c:if>
					</c:forEach>
				</div>
			</div>
			
			<div class="detail">
				<header class="header_title">
					<c:forEach var="bc" items="${bc }">
						<c:if test="${bc.categoryNo eq board.categoryNo.categoryNo }">
							<span class="group">${bc.categoryName }</span>
						</c:if>
					</c:forEach>
					<h3 class="title">${board.boardTitle }</h3>
					<span class="date"><fmt:formatDate
							pattern="yyyy-MM-dd HH:mm" value="${board.boardDate }" /></span>
					<c:if test="${authInfo.userNo < 0 }">
						<a
							href="<%=request.getContextPath()%>/noticeupdate/${board.boardNo }&${board.categoryNo.categoryNo }"><button
								id="noticeUpdate" class="controllbutton">수정</button></a>
						<a
							href="<%=request.getContextPath()%>/noticedelete/${board.boardNo }&${board.categoryNo.categoryNo }"><button
								id="noticeDelete" class="controllbutton">삭제</button></a>
					</c:if>
				</header>
				<div class="content">${board.boardContent }</div>
			</div>
			
			<div class="bottommenu">
				<a
					href="<%=request.getContextPath()%>/notice/list?currentPage=${pagination.currentPage }&cntPerPage=${pagination.cntPerPage }&pageSize=${pagination.pageSize }"><button
						id="go_notice" class="returnlist">목록보기</button></a>
			</div>
			
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp" />
		</footer>
	</div>
</body>
</html>

<!-- 참고사이트 : https://www.cjlogistics.com/ko/support/faq -->