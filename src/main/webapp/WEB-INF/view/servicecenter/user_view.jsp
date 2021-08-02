<%@ page import="proj21_funding.service.impl.QNAImpl"%>
<%@ page import="proj21_funding.service.QNAService"%>
<%@ page import="proj21_funding.service.impl.CategoryServiceImpl"%>
<%@ page import="proj21_funding.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/servicecenter/all_view_top.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/servicecenter/user_view.css">
</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="/WEB-INF/view/home/header_top.jsp" />
		</header>
		<section class="sevicecenter_view">
	<div id="top">
		<div id="top_title">
			<span class="faq">고객센터</span>
		</div>
		<div id="top_category">
		<ul id="titlename">
			<li id="cate"><a href="/proj21_funding/qnaallview" class="catetext">자주 묻는 질문</a></li>
			<c:choose>
				<c:when test="${authInfo.userNo < 0 }">
					<li id="cate" value="${authInfo.userNo }"><a href="/proj21_funding/qnaadminview" class="catetext">모든 질문 보기</a></li>
				</c:when>
				<c:otherwise>
					<li id="cate" value="${authInfo.userNo }"><a href="/proj21_funding/qnauserview" class="catetext">내 질문</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		</div>
	</div>
			<p class="seolmyoung">고객님이 하신 1:1 질문내역 페이지입니다.</p>
			<div id="userqnaall">
					<c:choose>
						<c:when test="${fn:length(qna) > 0}">
							<c:forEach items="${qna}" var="qna">
								<ul class="userqna">
									<li class="question">
									<a href="/proj21_funding/qnadetail/${qna.qnaNo}" style="text-decoration:none">
										<c:forEach var="bc" items="${bc }">
											<c:if test="${bc.categoryNo eq qna.categoryNo.categoryNo }">
												<span id="ct">[${bc.categoryName }]</span>
											</c:if>
										</c:forEach>
										<span id="q">Q.</span><span id="qtitle"> ${qna.qnaTitle }</span>
										<c:choose>
												<c:when test="${qna.qnaReply eq null }">
													<span id="afalse">답변 대기 중</span>
												</c:when>
												<c:when test="${qna.qnaReply ne null }">
													<span id="atrue">답변 완료</span>
												</c:when>
											</c:choose>
										<span id="qnadate"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qna.qnaDate }" /></span>
									</a>
									</li>
								</ul>
							</c:forEach>
						</c:when>
						<c:otherwise>
								<td colspan="4">조회된 결과가 없습니다.</td>
						</c:otherwise>
					</c:choose>
			</div>

			<!--paginate -->
			<div class="paginate">
				<ul class="paging">
					<li><a class="direction prev" href="javascript:void(0);" onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize});">&lt;&lt;</a></li>
					<li><a class="direction prev" href="javascript:void(0);" onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">&lt;</a></li>

					<c:forEach begin="${pagination.firstPage}" end="${pagination.lastPage}" var="idx">
						<li><a style="color:<c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> " href="javascript:void(0);" onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize});">
						<c:out value="${idx}" /></a></li>
					</c:forEach>
					<li><a class="direction next" href="javascript:void(0);" onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">&gt; </a></li>
					<li><a class="direction next" href="javascript:void(0);" onclick="movePage(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">&gt;&gt;</a></li>
				</ul>
			</div>
			<!-- /paginate -->
			<footer>
				<jsp:include page="/WEB-INF/view/home/footer.jsp" />
			</footer>
		</section>
	</div>
</body>
<script>
//페이지 이동
function movePage(currentPage, cntPerPage, pageSize){
    
    var url = "${pageContext.request.contextPath}/qnauserview";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    
    location.href=url;
}
 
</script>
</html>

<!-- 참고사이트 : https://www.cjlogistics.com/ko/support/faq -->