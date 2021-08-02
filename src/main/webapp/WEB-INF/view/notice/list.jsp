<%@ page import="proj21_funding.service.impl.BoardServiceImpl"%>
<%@ page import="proj21_funding.service.BoardService"%>
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
<title>공지사항</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_view.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/notice_css/list.css">
<style>
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
			<!-- 검색제작중 -->
			<div id="noticesearch">
				<form action="<%=request.getContextPath()%>/notice/list" method="post" id="frmSearchBoard">
					<input type = "hidden" name="currentPage" value="1">
					<input type = "hidden" name="cntPerPage" value="${pagination.cntPerPage}">
					<input type = "hidden" name="pageSize" value="10">
					<select name="keyword" class="selectpicker">
						<option value="total" selected="selected">검색키워드</option>
						<option value="boardTitle">제목</option>
						<option value="boardContent">내용</option>
					</select>
					<input type="text" class="searchKeyword" name="searchKeyword"/>
					<input type="submit" class="searchBtn" value="검색"/>
				</form>			
			</div>
			<!-- 검색제작중 -->
			<div class="list">
				<ul class="cont">
					<c:choose>
						<c:when test="${fn:length(board) > 0}">
							<c:forEach items="${board}" var="board">
								<li class="title-box"><a
									href="<%=request.getContextPath() %>/notice/detail/${board.boardNo }&${board.categoryNo.categoryNo}"
									class="notice"><span class="title-box"><span
											class="group"><c:forEach var="bc" items="${bc }">
													<c:if test="${bc.categoryNo eq board.categoryNo.categoryNo }">
							${bc.categoryName }
						</c:if>
												</c:forEach></span> <span class="title">${board.boardTitle }</span> <span
											class="date"><fmt:formatDate
													pattern="yyyy-MM-dd HH:mm" value="${board.boardDate }" /></span></span></a></li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<span>조회된 결과가 없습니다.</span>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			
			
			<!--paginate -->
			<div class="paginate">
				<ul class="paging">
					<li><a class="direction prev" href="javascript:void(0);" onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize},'${keyword }','${searchKeyword }');">&lt;&lt;</a></li>
					<li><a class="direction prev" href="javascript:void(0);" onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize},'${keyword }','${searchKeyword }');">&lt;</a></li>

					<c:forEach begin="${pagination.firstPage}" end="${pagination.lastPage}" var="idx">
						<li><a style="color:<c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> " href="javascript:void(0);" onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize},'${keyword }','${searchKeyword }');">
						<c:out value="${idx}" /></a></li>
					</c:forEach>
					<li><a class="direction next" href="javascript:void(0);" onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize},'${keyword }','${searchKeyword }');">&gt; </a></li>
					<li><a class="direction next" href="javascript:void(0);" onclick="movePage(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize},'${keyword }','${searchKeyword }');">&gt;&gt;</a></li>
				</ul>
			</div>
			<!-- /paginate -->

			<div class="bottommenu">
				<c:if test="${authInfo.userNo < 0 }">
					<a href="<%=request.getContextPath()%>/notice/write"><input
						type="button" value="공지글 작성" class="writenotice"></a>
				</c:if>
			</div>
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp" />
		</footer>
	</div>
</body>
<script>

//페이지 이동
function movePage(currentPage, cntPerPage, pageSize, keyword, searchKeyword){
    
    var url = "${pageContext.request.contextPath}/notice/list";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    url = url + "&keyword="+keyword;
    url = url + "&searchKeyword="+searchKeyword;
    
    location.href=url;
}
 
</script>
</html>

<!-- 참고사이트 : https://www.cjlogistics.com/ko/support/faq -->