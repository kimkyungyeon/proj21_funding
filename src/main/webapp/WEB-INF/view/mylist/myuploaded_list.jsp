<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>등록된 리스트</title>
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/mylist_css/myuploaded_list.css">			
			<link rel="stylesheet" href="<%=request.getContextPath() %>/css/paging_css/paging.css">
			
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		<script type="text/javascript">			
		/* 메인홈으로 */
	$(function(){
		var contextPath = "<%=request.getContextPath()%>";
		$("#go_main").on("click", function(){
			window.location.href = contextPath+"/";
		});			
	});
		
		/* 프로젝트 보기 */
	$(function(){
		var contextPath = "<%=request.getContextPath()%>";
		$("#select_list").on("click", function(){
			window.location.href = contextPath+"/projectList";
		});			
	});
<%-- 		/*팝업 창  */
	function openWrite(){		
		window.open('<%=request.getContextPath()%>/prjBoard/prjBoard-write', '', 'left = 600, top = 150, width = 500, height = 500');
	}; --%>
		
</script>
</head>
<body>
<%-- ${myList[0] } --%>
<%-- ${myList }
${count }
 --%>
 <%-- ${map } --%>
<%--  ${pagination }
 ${count } --%>
		<section class="container">	
		<header>		   
				<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		
			<h4>프로젝트 제목을 선택하시면 자세한 프로젝트 정보를 확인하실 수 있습니다.</h4>	
		<section class = "list_main">
		<table class= "list_table">		
			<thead id = "column">
				<tr>
						<th class = "count">번호</th>
						<th>프로젝트</th>
						<th>목표 금액</th>
						<th>달성률</th>
						<th>시작일</th>
						<th>마감일<br>(결제일)</th>
						<th>진행상황</th>
				</tr>
			</thead>
			<tbody id= "context">
				<c:forEach var = "list" items = "${myList}" varStatus="status">	
				<tr class = "size"> 
							<td class = "count">${status.index+1 } </td>
							<td>
									<a id = "pointer" href = "<%=request.getContextPath() %>/selectDetailList/${list.prjNo.prjNo }" >${list.prjNo.prjName }</a>
							</td>
							<td id = "prjGoal">
									<fmt:formatNumber value="${list.prjNo.prjGoal }" pattern="\\#,###"/> </td>	
							<td>
							<fmt:formatNumber value="${list.prjNo.totalPrice/list.prjNo.prjGoal*100}" pattern = "0.0" />
										<span>%</span>						
							</td>									
							<td>${list.prjNo.startDate }</td>
							<td>${list.prjNo.endDate }</td>
						<%-- 	<td>${list.prjNo.payDate } </td> --%>
								
						 <jsp:useBean id="now" class = "java.util.Date"></jsp:useBean>
						 <fmt:formatDate  var="today"  value="${now}" pattern="yyyy-MM-dd"/>  
							<td>
							<c:choose>
										<c:when test="${ list.prjNo.endDate < today  }">
											<span class = "success">진행완료</span><br>
										</c:when>
										<c:when test="${list.prjNo.endDate >= today }">									
											<span>진행중</span><br>
										</c:when>										
							</c:choose>	
							<c:if test = "${list.prjNo.totalPrice >= list.prjNo.prjGoal}">
											<span class = "success">목표금액달성</span>
							</c:if>
							<c:if test = "${list.prjNo.totalPrice< list.prjNo.prjGoal}">
											<span></span>
							</c:if>		
							</td>
				</tr>
				</c:forEach>
				</tbody>
		</table>
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
				<div id ="foot_btn">
						<button class = "btns" id= "select_list">프로젝트 보기</button>
						<button class = "btns" id = "go_main">메인</button>&nbsp;						
				</div>	
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
			</section>
</body>
<script>
function movePage(currentPage, cntPerPage, pageSize){
    
    var url = "${pageContext.request.contextPath}/homeToMyList/${authInfo.userNo}";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;    
    
    location.href=url;
}
</script>
</html>