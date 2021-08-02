<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>100펀딩-후원현황</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/user_css/funding_status.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/paging_css/paging.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
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
${count }
<%-- ${fundingList }
후원현황 --%>
<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<section class = "funding_main">
		<table class = "funding_table">
			<tr class="tablehead">
				<th> </th>
				<th id="prjName">프로젝트명</th>
				<th>옵션내용</th>
				<th>가격</th>
				<th>마감일<br>(결제일)</th>
				<th>결제<br>여부</th>
				<th>마감<br>여부</th>
			</tr>
			<c:forEach var="funding" items="${fundingList }">
			<tr>
				<td><img src="<%=request.getContextPath()%>/images/project/project${funding.prjNo.prjNo }.jpg"/></td>
				<td class="link">
						<a id = "pointer" href="<%=request.getContextPath()%>/prjDetail/${funding.prjNo.prjNo}">${funding.prjNo.prjName }</a>
				</td>
				<td>${funding.optNo.optContent}</td>
				<td>
						<fmt:formatNumber value="${funding.optNo.optPrice}" pattern="\\#,###"/>
				</td>
				<td>${funding.prjNo.endDate}</td>
				<c:choose>
						<c:when test="${funding.payYn eq true}">
								<td style="color:red; font-weight:bold">결제<br>완료</td>
						</c:when>
						<c:otherwise>
								<td>미결제</td>
						</c:otherwise>
				</c:choose>
				<c:choose>
						<c:when test="${funding.endYn eq true}">
								<td style="color:red; font-weight:bold">마감<br>완료</td>
						</c:when>
						<c:otherwise>
							<td>진행중</td>
						</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
		</table>
		         <div>	<button  id="MOVE_TOP_BTN">&#10514</button>	</div>	
				 <!--paginate -->
		         <div class="paginate">
		            <ul class="paging">
		               <li><a class="direction prev" href="javascript:void(0);"
		                  onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize});">
		                  &lt;&lt; </a></li>
		               <li><a class="direction prev" href="javascript:void(0);"
		                  onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
		                  &lt; </a></li>
		
		               <c:forEach begin="${pagination.firstPage}" end="${pagination.lastPage}" var="idx">
		               <li><a style="color:<c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> "
		                     href="javascript:void(0);" onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
		                        value="${idx}" /></a></li>
		               </c:forEach>
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
		                  &gt; </a></li>
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination.lastPage},${pagination.cntPerPage},${pagination.pageSize});">
		                  &gt;&gt; </a></li>
		            </ul>
		         </div>
		         <!-- /paginate -->
			
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
</div>
</body>
<script>
function movePage(currentPage, cntPerPage, pageSize){
    
    var url = "${pageContext.request.contextPath}/user/funding_status/${authInfo.userNo}";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    
    
    location.href=url;
}
</script>
</html>