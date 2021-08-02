<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>100펀딩 - 크리에이터를 위한 크라우드펀딩</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico">
<link rel="icon" href="<%=request.getContextPath()%>/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/paging_css/paging.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/project_list_css/searchSection.css">
<script>
	$(function() {
		
		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
		
	}); 
</script>
</head>
<body>

	<div class="container">
		<header>
			<jsp:include page="/WEB-INF/view/home/header.jsp" />
		</header>
		<%-- ${projects } --%>
		<!-- 프로젝트검색 부분 개발중  -->
		<section id="searchSection">
			<form action="projectList" method="post">
				<input type = "hidden" name="currentPage" value="1">
				<input type = "hidden" name="cntPerPage" value="${pagination.cntPerPage}">
				<input type = "hidden" name="pageSize" value="10">
				<label id="magamYn"><input type="checkbox" name="finishYn" value="finished">마감 프로젝트도 보기  </label>
				<select name="keyword" class="selectpicker">
					<option value="total" selected="selected">검색키워드</option>
					<option value="prjName">프로젝트명</option>
					<option value="prjManager">제작자</option>
				</select>
				<input type="text" class="searchKeyword" name="searchKeyword"/>
				<input type="submit" class="searchBtn" value="검색"/>
				<span>검색결과 : ${listCount }개</span>
			</form>
			
		</section>
		<section>
			<jsp:include page="/WEB-INF/view/project/list_section.jsp" />
		</section>
		<!--paginate -->
		        <div class="paginate">
		           <ul class="paging">
		              <li><a class="direction prev" href="javascript:void(0);"
		                 onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize},'${finishYn }','${keyword }','${searchKeyword }');">
		                 &lt;&lt; </a></li>
		              <li><a class="direction prev" href="javascript:void(0);"
		                 onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize},'${finishYn }','${keyword }','${searchKeyword }');">
		                 &lt; </a></li>
	
		               <c:forEach begin="${pagination.firstPage}"
		                  end="${pagination.lastPage}" var="idx">
		                  <li><a style="color:<c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> "
		                     href="javascript:void(0);"
		                     onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize},'${finishYn }','${keyword }','${searchKeyword }');"><c:out
		                        value="${idx}" /></a></li>
		               </c:forEach>
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize},'${finishYn }','${keyword }','${searchKeyword }');">
		                  &gt; </a></li>
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination.lastPage},${pagination.cntPerPage},${pagination.pageSize},'${finishYn }','${keyword }','${searchKeyword }');">
		                  &gt;&gt; </a></li>
		            </ul>
		         </div>
		         <!-- /paginate -->
				<button  id="MOVE_TOP_BTN">TOP</button>
	
	<footer>
		<jsp:include page="/WEB-INF/view/home/footer.jsp" />
	</footer>
	</div>
</body>
<script>
//페이지 이동
function movePage(currentPage, cntPerPage, pageSize,finishYn,keyword,searchKeyword){
    
    var url = "${pageContext.request.contextPath}/projectList";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    url = url + "&finishYn="+finishYn;
    url = url + "&keyword="+keyword;
    url = url + "&searchKeyword="+searchKeyword;
    
    location.href=url;
}
 
</script>
</html>