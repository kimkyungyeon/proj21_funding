<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-게시판관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="/proj21_funding/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/proj21_funding/bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript"
	src="/proj21_funding/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="/proj21_funding/css/admin_css/adminSide.css">
<link rel="stylesheet"
	href="/proj21_funding/css/admin_css/adminBoard.css">
<link rel="stylesheet" href="/proj21_funding/css/admin_css/btn.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/paging_css/paging.css">
</head>
<body>
	<div id="page-wrapper">
		<header>
			<!-- 사이드바 -->
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="admin">100펀딩 관리자 페이지</a></li>
					<li><a href="adminMember">회원관리</a></li>
					<li><a href="adminProject">프로젝트관리</a></li>
					<li><a href="adminBoard">게시판관리</a></li>
					<li><a class="menu" href="adminQna">QnA관리</a></li>
				</ul>
				
			</div>
			<!-- /사이드바 -->
		</header>
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<button class="goMain" onclick="location.href='<%=request.getContextPath()%>'">메인으로 이동</button>
				<button class="goMain" onclick="location.href='<%=request.getContextPath()%>/logout'">로그아웃</button>
				<section>
					<h1>게시판관리</h1>
				</section>
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>게시판 통계</strong>
					</div>
					<div class="panel-body">
						<ul>
							<li><strong>공지사항 수</strong> : ${noticeCount }개</li>
							<li><strong>이벤트 수</strong> : ${eventCount }개</li>
						</ul>
					</div>
				</div>
				<form action="adminBoard" method="post" id="frmSearchBoard">
				<div class="col-md-4">
					<input type = "hidden" name="currentPage" value="1">
					<input type = "hidden" name="cntPerPage" value="${pagination.cntPerPage}">
					<input type = "hidden" name="pageSize" value="10">
					<select name="category" class="selectpicker">
						<option value="total" selected="selected">카테고리명</option>
						<c:forEach var="bc" items="${bc }" varStatus="status">
						<option value="${bc.categoryNo }">${bc.categoryName }</option>
						</c:forEach>
					</select>
					<select name="keyword" class="selectpicker">
						<option value="total" selected="selected">검색키워드</option>
						<option value="boardTitle">제 목</option>
						<option value="boardContent">내 용</option>
					</select>
				</div>
				<input type="text" class="searchKeyword" name="searchKeyword"/>
				<input type="submit" class="searchBtn" value="검 색"/>
				<span>검색결과 : ${listCnt }개</span>
				<button class="searchBtn" style="float:right"
				 onclick="window.open('adminNotice/write','수정하기','width=1200,height=800,location=no,status=no')">글쓰기</button>
				</form>
				<table class="table table-stripedPink table-bordered ">
					<thead>
						<tr>
							<th class="col-md-1 text-center">번 호</th>
							<th class="col-md-1 text-center">분 류</th>
							<th class="col-md-3 text-center">제 목</th>
							<th class="col-md-1 text-center">작성일</th>
						</tr>
	 				</thead>
					<tbody>
						<c:forEach var="board" items="${board }" varStatus="status">
							<tr data-toggle="collapse"
								data-target="#accordion${status.index }"
								class="text-center clickable">
								<td>${board.boardNo}</td>
								<td>${board.categoryNo.categoryName }</td>
								<td class="text-left">${board.boardTitle }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.boardDate }" /></td>
							</tr>
							<tr>
								<td colspan="4">
									<div id="accordion${status.index }" class="collapse">
										<div>
											<h4><strong>글 상세보기</strong></h4>
											<button onclick="window.open('adminNoticeUpdate/${board.boardNo}&${board.categoryNo.categoryNo }','수정하기','width=1200,height=800,location=no,status=no')" style="float:right">수 정</button>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading"><strong>제목 : ${board.boardTitle }</strong>
											<span style="float:right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.boardDate }" /></span></div>
											<div class="panel-body">
											<p><strong>내 용 : </strong></p>
											<div><p>${board.boardContent }</p></div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
						 <!--paginate -->
		         <div class="paginate">
		            <ul class="paging">
		               <li><a class="direction prev" href="javascript:void(0);"
		                  onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize},'${category }','${keyword }','${searchKeyword }');">
		                  &lt;&lt; </a></li>
		               <li><a class="direction prev" href="javascript:void(0);"
		                  onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize},'${category }','${keyword }','${searchKeyword }');">
		                  &lt; </a></li>
		
		               <c:forEach begin="${pagination.firstPage}"
		                  end="${pagination.lastPage}" var="idx">
		                  <li><a
		                     style="color:<c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> "
		                     href="javascript:void(0);"
		                     onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize},'${category }','${keyword }','${searchKeyword }');"><c:out
		                        value="${idx}" /></a></li>
		               </c:forEach>
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize},'${category }','${keyword }','${searchKeyword }');">
		                  &gt; </a></li> 
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination.lastPage},${pagination.cntPerPage},${pagination.pageSize},'${category }','${keyword }','${searchKeyword }');">
		                  &gt;&gt; </a></li>
		            </ul>
		         </div>
		         <!-- /paginate -->
			</div>
		</div>
	</div>
</body>
<script>
//페이지 이동
function movePage(currentPage, cntPerPage, pageSize,category,keyword,searchKeyword){
    
    var url = "${pageContext.request.contextPath}/adminBoard";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    url = url + "&category="+category;
    url = url + "&keyword="+keyword;
    url = url + "&searchKeyword="+searchKeyword;
    
    location.href=url;
}
 
</script>
</html>