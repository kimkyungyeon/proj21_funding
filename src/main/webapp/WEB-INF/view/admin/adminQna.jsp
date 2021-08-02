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
<title>관리자-Qna관리</title>
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
	href="/proj21_funding/css/admin_css/adminQna.css">
<link rel="stylesheet" href="/proj21_funding/css/admin_css/btn.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/paging_css/paging.css">
<script>
	$(function(){
		
		$(".btnUpdate").on("click",function(e){
			e.preventDefault();
			var contextPath = "<%= request.getContextPath()%>";
			var idx = $(this).val();
			var adminNo = ${authInfo.userNo};
			if($(this).html()=="답변하기"){
				$(".btnUpdate"+idx).parent().append("<button class='btnCancel"+idx+"' style='float:right; width:50px;margin-top:10px'>취소</button>");
				$(".btnUpdate"+idx).text("답변저장");
				$(".btnUpdate"+idx).addClass("btnConfirm"+idx);
				$(".reply"+idx).removeAttr("readonly");
				
				$(".btnCancel"+idx).click(function(){
					$(".reply"+idx).attr("readonly","readonly");
					$(".btnUpdate"+idx).text("답변하기");
					$(".btnCancel"+idx).remove();
					$(".btnUpdate"+idx).removeClass("btnConfirm"+idx);
					return false;
				})
				var data;
			}
		})
			$(".btnConfirm"+idx).click(function(){
				e.preventDefault();
				data = {
						qnaNo : idx,
						adminNo : 1,
						qnaReply : $(".reply"+idx).val(),
						replyDate : $.now()};
		
				$.ajax({
					url:contextPath +"/replyQna/"+idx,
					type:"PATCH",
					contentType:"application/json; charset=utf-8",
					dataType:"json",
					cache:false,
					data: JSON.stringify(data),
					success: function(data) {
						$(".btnUpdate"+idx).text("답변하기");
						$(".reply"+idx).prop("readonly","readonly");
						$(".btnCancel"+idx).remove();
						$(".btnConfirm"+idx).removeClass();
						window.location.reload();
					}
				})
			})
	})
</script>
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
					<h1>QnA관리</h1>
				</section>
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>게시판 통계</strong>
					</div>
					<div class="panel-body">
						<ul>
							<li><strong>전체 QnA 수</strong> : ${qnaCount } 개</li>
							<li><strong>답변완료 QnA 수</strong> : ${replyCount } 개</li>
							<li><strong>미완료 QnA 수</strong> : ${qnaCount-replyCount } 개</li>
							
						</ul>
					</div>
				</div>
				<form action="adminQna" method="post" id="frmSearchQna">
					<input type = "hidden" name="currentPage" value="1">
					<input type = "hidden" name="cntPerPage" value="${pagination.cntPerPage}">
					<input type = "hidden" name="pageSize" value="10">
					<select name="category" class="selectpicker">
						<option value="total" selected="selected">카테고리명</option>
						<option value="3">사이트관련</option>
						<option value="4">창작자관련</option>
						<option value="5">후원자관련</option>
					</select>
					<select name="replyYn" class="selectpicker">
						<option value="total" selected="selected">답변여부(전체)</option>
						<option value="replyNo">답변 미완료</option>
					</select>
					<select name="keyword" class="selectpicker">
						<option value="total" selected="selected">검색키워드</option>
						<option value="qnaTitle">질문제목</option>
						<option value="qnaContent">질문내용</option>
						<option value="nickname">회원별명</option>
					</select>
				<input type="text" class="searchKeyword" name="searchKeyword"/>
				<input type="submit" class="searchBtn" value="검색"/>
				<span>검색결과 : ${count }개</span>
				</form>
				<table class="table table-stripedPink table-bordered ">
					<thead>
						<tr>
							<th class="col-md-1 text-center">번 호</th>
							<th class="col-md-1 text-center">분 류</th>
							<th class="col-md-3 text-center">제 목</th>
							<th class="col-md-1 text-center">질문자</th>
							<th class="col-md-1 text-center">작성일</th>
							<th class="col-md-1 text-center">답변여부</th>
						</tr>
	 				</thead>
					<tbody>
						<c:forEach var="qna" items="${qnaList }" varStatus="status">
							<tr data-toggle="collapse"
							data-target="#accordion${status.index }"
							class="text-center clickable">
								<td>${qna.qnaNo }</td>
								<td>${qna.categoryNo.categoryName }</td>
								<td>${qna.qnaTitle }</td>
								<td>${qna.userNo.nickName }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qna.qnaDate }" /></td>
								<td>
									<c:if test="${qna.qnaReply == null }">미답변</c:if>
									<c:if test="${qna.qnaReply != null }">답변완료</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div id="accordion${status.index }" class="collapse">
										<div class="qnaDetail">
											<div class="panel panel-default">
												<div class="panel-heading">
													<strong>제목 : ${qna.qnaTitle }</strong>
													<span style="float:right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qna.qnaDate }" /></span>
												</div>
												<div class="panel-body">
													<button class="btnUpdate btnUpdate${qna.qnaNo }" style="float:right" value="${qna.qnaNo }">답변하기</button>
													<div class="divText">
													<p><strong>내 용 : </strong></p>
													<textarea class="textContent" readonly="readonly">${qna.qnaContent }</textarea>
													</div>
													<div class="divText">
													<p><strong>답 변 : </strong></p>
													<textarea class="textContent reply${qna.qnaNo }" readonly="readonly">${qna.qnaReply }</textarea>
													</div>
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
		                  onclick="movePage(1,${pagination1.cntPerPage},${pagination1.pageSize},'${category }','${keyword }','${searchKeyword }','${replyYn }');">
		                  &lt;&lt; </a></li>
		               <li><a class="direction prev" href="javascript:void(0);"
		                  onclick="movePage(${pagination1.currentPage}<c:if test="${pagination1.hasPreviousPage == true}">-1</c:if>,${pagination1.cntPerPage},${pagination1.pageSize},'${category }','${keyword }','${searchKeyword }','${replyYn }');">
		                  &lt; </a></li>
		
		               <c:forEach begin="${pagination1.firstPage}"
		                  end="${pagination1.lastPage}" var="idx">
		                  <li><a
		                     style="color:<c:out value="${pagination1.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> "
		                     href="javascript:void(0);"
		                     onclick="movePage(${idx},${pagination1.cntPerPage},${pagination1.pageSize},'${category }','${keyword }','${searchKeyword }','${replyYn }');"><c:out
		                        value="${idx}" /></a></li>
		               </c:forEach>
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination1.currentPage}<c:if test="${pagination1.hasNextPage == true}">+1</c:if>,${pagination1.cntPerPage},${pagination1.pageSize},'${category }','${keyword }','${searchKeyword }','${replyYn }');">
		                  &gt; </a></li>
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination1.lastPage},${pagination1.cntPerPage},${pagination1.pageSize},'${category }','${keyword }','${searchKeyword }','${replyYn }');">
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
function movePage(currentPage, cntPerPage, pageSize, category, keyword, searchKeyword, replyYn){
    var url = "${pageContext.request.contextPath}/adminQna";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    url = url + "&category="+category;
    url = url + "&keyword="+keyword;
    url = url + "&replyYn="+replyYn;
    url = url + "&searchKeyword="+searchKeyword;
    location.href=url;
}
 
</script>
</html>