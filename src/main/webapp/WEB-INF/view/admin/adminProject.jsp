<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-프로젝트관리</title>
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
	href="/proj21_funding/css/admin_css/adminProject.css">
<link rel="stylesheet" href="/proj21_funding/css/admin_css/btn.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/paging_css/paging.css">
<script>
	$(function() {
		
		$(".btnOption").click(function(){
			if($(this).html()=='옵션보기'){
				$(this).html('옵션닫기')
			
			var prjNo = $(this).val();
			var contextPath = "${contextPath}"
			$.ajax({
				type :"Get",
				url:contextPath+"/getOptList/"+prjNo,
				contentType:"application/json; charset=utf-8",
				dataType: 'json',
				success: function(json){
					console.log(prjNo)
					var dataLength = json.length;
					var sCont="";
						sCont +="<h3 class='optTable'>옵션리스트</h3><table class='table optTable'><thead><th>번호</th><th>옵션명</th><th>가격</th><th>설명</th></thead><tr>";
					for ( i = 0; i < dataLength; i++) {
						sCont += "<tr>";
						sCont += "<td>"+(i+1) +"</td>";
						sCont += "<td>" +json[i].optName +"</td>";
						sCont += "<td>" +json[i].optPrice +"</td>";
						sCont += "<td>" +json[i].optContent +"</td>";
						sCont += "</tr>";
					}
						sCont +="</table>";
					console.log(sCont)
					$(".btnOption"+prjNo).parent().append(sCont);
				}
			})
			} else{
				$(this).html('옵션보기')
				$('.optTable').remove();
			}
		})
		
		
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
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
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
		<!-- 본문 -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<button class="goMain" onclick="location.href='<%=request.getContextPath()%>'">메인으로 이동</button>
				<button class="goMain" onclick="location.href='<%=request.getContextPath()%>/logout'">로그아웃</button>
				<section>
					<h1>프로젝트관리</h1>
				</section>
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>프로젝트 통계</strong>
					</div>
					<div class="panel-body">
						<ul>
							<li><strong>누적 프로젝트 수 :</strong> ${sumCount.prjNo } 개</li>
							<li><strong>누적 후원 수 :</strong> ${sumCount.totalCount} 회</li>
							<li><strong>누적 후원금액 :</strong> <fmt:formatNumber value="${sumCount.totalPrice }" pattern="#,###"/>원</li>
						</ul>
					</div>
				</div>
				<form action="adminProject" method="post" id="frmSearchProject">
				<input type = "hidden" name="currentPage" value="1">
				<input type = "hidden" name="cntPerPage" value="${pagination.cntPerPage}">
				<input type = "hidden" name="pageSize" value="10">
				<label><input type="checkbox" name="successYn" value="successed">성공프로젝트만 보기  </label>
				<div class="col-md-4">
					<select name="category" class="selectpicker">
						<option value="total" selected="selected">카테고리명</option>
						<c:forEach var="category" items="${categoryList }" varStatus="status">
						<option value="${category.pCategoryNo }">${category.pCategoryName }</option>
						</c:forEach>
					</select>
					<select name="keyword" class="selectpicker">
						<option value="total" selected="selected">검색키워드</option>
						<option value="prjName">프로젝트명</option>
						<option value="nickname">닉네임</option>
						<option value="managerName">성명</option>
					</select>
				</div>
				<input type="text" class="searchKeyword" name="searchKeyword"/>
				<input type="submit" class="searchBtn" value="검색"/>
				<span>검색결과 : ${fn:length(prjList) }개</span>
				</form>
				<table class="table table-stripedPink table-bordered ">
					<thead>
						<tr>
							<th class="col-md-1 text-center">번 호</th>
							<th class="col-md-3 text-center">제 목</th>
							<th class="col-md-1 text-center">분 류</th>
							<th class="col-md-1 text-center">제작자</th>
							<th class="col-md-1 text-center">목표금액</th>
							<th class="col-md-1 text-center">현재금액</th>
							<th class="col-md-1 text-center">달성률</th>
							<th class="col-md-1 text-center">마감일</th>
							<th class="col-md-1 text-center">상태</th>
						</tr>
	 				</thead>
					<tbody>
						<c:forEach var="prj" items="${prjList }" varStatus="status">
							<tr data-toggle="collapse"
								data-target="#accordion${status.index }"
								class="text-center clickable">
								<td>${prj.prjNo}</td>
								<td class="text-left"><a href="<%=request.getContextPath() %>/prjDetail/${prj.prjNo}">${prj.prjName }</a></td>
								<td>${prj.pCategoryName }</td>
								<td>${prj.prjManager } (${prj.managerName })</td>
								<td><fmt:formatNumber value="${prj.prjGoal }" pattern="#,###"/> 원</td>
								<td><fmt:formatNumber value="${prj.totalPrice }" pattern="#,###"/> 원</td>
								<td>${prj.rate }%</td>
								<td>${prj.endDate }</td>
								<td>
									<c:if test="${prj.prjGoal<=prj.totalPrice }">목표 달성</c:if>
									<c:if test="${prj.prjGoal>prj.totalPrice and sysYear>prj.endDate}">달성 실패</c:if>
									<c:if test="${prj.prjGoal>prj.totalPrice and sysYear<=prj.endDate}">진행중</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="9">
									<div id="accordion${status.index }" class="collapse">
									<h4><strong>프로젝트상세정보</strong></h4>
									<div class="panel panel-default">
										<div class="panel-heading"><strong>프로젝트 정보</strong></div>
										<div class="panel-body">
										<div class="prjDetail" style="float:left">
										<span class="prjTitle"><strong>제 목 : </strong> <input type="text" value="${prj.prjName }" size="50" readonly/></span><br>
										<strong>내 용 : </strong><br>
										<textarea id="prjContent" rows="5"  readonly="readonly">${prj.prjContent }</textarea>
										</div>
										<div class="prjDetail">
										<span class="userDetail"><strong>분 류 : </strong><input type="text" value="${prj.pCategoryName }" size="10px" readonly/></span>
										<span class="userDetail"><strong>제작자 : </strong><input type="text" value="${prj.prjManager }" size="10px" readonly/></span><br>
										<div class="progress1">
										  <span class="progress-bar" role="progressbar" aria-valuenow="${prj.rate }" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width:${prj.rate}%">
										    ${prj.rate }
										  </span>
										</div>
										<span class="userDetail"><strong>목표금액 : </strong>
										<input type="text" value="<fmt:formatNumber value="${prj.prjGoal }" pattern="#,###"/> 원" size="10px" readonly/>
										</span>
										<span class="userDetail"><strong>현재금액 :</strong> 
										<input type="text" value="<fmt:formatNumber value="${prj.totalPrice }" pattern="#,###"/> 원" size="10px" readonly/></span>
										<span class="userDetail"><strong>달성률 : </strong><input type="text" class="prjRate" value="${prj.rate }%"size="10px" readonly/>
										</span><br>
										<span class="userDetail"><strong>시작일 :</strong> 
										<input type="text" value="${prj.startDate }" size="10px" readonly/></span>
										<span class="userDetail"><strong>마감일 :</strong> 
										<input type="text" value="${prj.endDate }" size="15px" readonly/></span>
										<span class="userDetail"><strong>진행 상태 :</strong> 
										<input type="text" value="<c:if test='${prj.prjGoal<=prj.totalPrice }'>목표 달성</c:if><c:if test='${prj.prjGoal>prj.totalPrice and sysYear>prj.endDate}'>달성 실패</c:if><c:if test="${prj.prjGoal>prj.totalPrice and sysYear<prj.endDate}">진행중</c:if>" size="15px" readonly/></span>
										<!--레이어관련  -->
										<a href="#" onclick="window.open('sponsorList/${prj.prjNo }','후원자 리스트','width=1000, height=800, location=no, top=100, left=100')">후원자 리스트 보기</a><br>
										</div>
										<div class='optList'>
										<button class="btnOption btnOption${prj.prjNo }" value="${prj.prjNo }">옵션보기</button>
										</div>
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
		                 onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize},'${successYn }','${category }','${keyword }','${searchKeyword }');">
		                 &lt;&lt; </a></li>
		              <li><a class="direction prev" href="javascript:void(0);"
		                 onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize},'${successYn }','${category }','${keyword }','${searchKeyword }');">
		                 &lt; </a></li>
	
		               <c:forEach begin="${pagination.firstPage}"
		                  end="${pagination.lastPage}" var="idx">
		                  <li><a style="color:<c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> "
		                     href="javascript:void(0);"
		                     onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize},'${successYn }','${category }','${keyword }','${searchKeyword }');"><c:out
		                        value="${idx}" /></a></li>
		               </c:forEach>
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize},'${successYn }','${category }','${keyword }','${searchKeyword }');">
		                  &gt; </a></li>
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination.lastPage},${pagination.cntPerPage},${pagination.pageSize},'${successYn }','${category }','${keyword }','${searchKeyword }');">
		                  &gt;&gt; </a></li>
		            </ul>
		         </div>
		         <!-- /paginate -->
				<button  id="MOVE_TOP_BTN">TOP</button>
			</div>
		</div>
	</div>
</body>
<script>
//페이지 이동
function movePage(currentPage, cntPerPage, pageSize,successYn,category,keyword,searchKeyword){
    
    var url = "${pageContext.request.contextPath}/adminProject";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    url = url + "&successYn="+successYn;
    url = url + "&category="+category;
    url = url + "&keyword="+keyword;
    url = url + "&searchKeyword="+searchKeyword;
    
    location.href=url;
}
 
</script>
</html>