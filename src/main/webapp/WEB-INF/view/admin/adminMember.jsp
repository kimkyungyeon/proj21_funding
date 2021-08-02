<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-회원관리</title>
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
	href="/proj21_funding/css/admin_css/adminMember.css">
<link rel="stylesheet" href="/proj21_funding/css/admin_css/btn.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/paging_css/paging.css">
<script>
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});

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
	<div id="page-wrapper">
		<header>
			<!-- 사이드바 -->
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="admin">100펀딩 관리자 페이지</a></li>
					<li><a class="menu" href="adminMember">회원관리</a></li>
					<li><a class="menu" href="adminProject">프로젝트관리</a></li>
					<li><a class="menu" href="adminBoard">게시판관리</a></li>
					<li><a class="menu" href="adminBoard">QnA관리</a></li>

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
				<h1>회원관리</h1>
				</section>
				<div class="panel panel-default">
					<div class="panel-heading"><strong>회원 통계</strong></div>
					<div class="panel-body">
					<ul>
					    <li><strong>누적회원 수</strong> : ${count }명</li>
						<li><strong>현재회원 수</strong> : ${currentCount }명</li>
						<li><strong>제작자 수</strong> : ${prdCount }명</li>
					</ul>
					</div>
				</div>
				<form action="adminMember" method="post" id="frmSearchMember">
				<input type = "hidden" name="currentPage" value="1">
				<input type = "hidden" name="cntPerPage" value="${pagination.cntPerPage}">
				<input type = "hidden" name="pageSize" value="10">
				<label><input type="checkbox" name="delYn" value="notDelete">탈퇴회원 숨기기  </label>
				<label><input type="checkbox" name="descYn" value="desc">역순으로 보기  </label>
				<div class="col-md-2 inputMember">
					<select name="keyword" class="selectpicker">
						<option value="total" selected="selected">검색키워드</option>
						<option value="memberAccount">회원계정</option>
						<option value="memberName">회원성명</option>
						<option value="nickname">회원별명</option>
						<option value="userno">회원번호</option>
					</select>
				</div>
				<input type="text" class="searchKeyword" name="searchKeyword"/>
				<input type="submit" class="searchBtn" value="검색"/>
				<span>검색결과 : ${listCount }명</span>
				</form>
				<table class="table table-stripedPink table-bordered ">
					<thead>
						<tr>
							<th class="col-md-1 text-center">회원번호</th>
							<th class="col-md-1 text-center">회원계정</th>
							<th class="col-md-1 text-center">성명</th>
							<th class="col-md-1 text-center">별명</th>
							<th class="col-md-2 text-center">H.P</th>
							<th class="col-md-1 text-center">e-mail</th>
							<th class="col-md-1 text-center">우편번호</th>
							<th class="col-md-3 text-center">주소</th>
							<th class="col-md-1 text-center">회원분류</th>
						</tr>
					</thead>

					<tbody>
						<c:set var="total" value="0"/>
						<c:forEach var="user" items="${userList }" varStatus="status">
							<tr data-toggle="collapse"
								data-target="#accordion${status.index }"
								class="text-center clickable">
								<td>${user.userNo}</td>
								<td>${user.userId }</td>
								<td>${user.userName }</td>
								<td>${user.nickName }</td>
								<td>${user.userPhone }</td>
								<td>${user.email }</td>
								<td>${user.zipCode }</td>
								<td>${user.address }, ${user.detailAddress }</td>
								<td>
								<c:if test="${user.secession == true  }">탈퇴회원</c:if> 
								<c:if test="${user.secession != true and user.bankAccount != null }">회원(제작자)</c:if>
								<c:if test="${user.secession != true and user.bankAccount == null }">일반회원</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="9">
									<div id="accordion${status.index }" class="collapse">
										<h4><strong>회원상세정보</strong></h4>
									<div class="panel panel-default">
										<div class="panel-heading"><strong>개인 정보</strong></div>
										<div class="panel-body">
										<span class="userDetail"><strong>회원계정 : </strong> <input type="text" value="${user.userId }" size="10px" readonly/></span>
										<span class="userDetail"><strong>성명 : </strong><input type="text" value="${user.userName }" size="10px" readonly/></span>
										<span class="userDetail"><strong>별명 : </strong><input type="text" value="${user.nickName }" size="10px" readonly/></span><br>
										<span class="userDetail"><strong>H.P : </strong><input type="text" value="${user.userPhone }" size="10px" readonly/></span>
										<span class="userDetail"><strong>이메일 :</strong> <input type="text" value="${user.email }" size="10px" readonly/></span><br>
										<span class="userDetail"><strong>주소 :</strong> <input type="text" value="(${user.zipCode }) ${user.address }, ${user.detailAddress }" size="45px" readonly/></span>
										<span class="userDetail"><strong>은행 :</strong> <input type="text" value="${user.bankName }" size="10px" readonly/></span>
										<span class="userDetail"><strong>계좌번호 :</strong> <input type="text" value="${user.bankAccount }" size="15px" readonly/></span>
										</div>
									</div>
									
									<div class="panel panel-default">
										<div class="panel-heading"><strong>프로젝트 관련정보</strong></div>
										<div class="panel-body">
										<span class="userDetail"><strong>후원한 프로젝트 수 : </strong><input type="text" value="${fundingStatic[user.userNo-1].totalCount } 개" size="10px" readonly/></span>
										<span class="userDetail"><strong>총 후원 금액 : </strong><input type="text" value="<fmt:formatNumber value='${fundingStatic[user.userNo-1].totalPrice }' pattern="#,###"/> 원" size="10px" readonly/></span><br>
										<span class="userDetail"><strong>등록한 프로젝트 수 : </strong><input type="text" value="${regProject[user.userNo-1].totalCount } 개" size="10px" readonly/></span>
										<span class="userDetail"><strong>성공한 프로젝트 수 : </strong><input type="text" value="${successProject[user.userNo-1].totalCount } 개" size="10px" readonly/></span>
										</div>
									</div>
									</div>
								</td>
							</tr>
							<c:set var="total" value="${total+1 }"/>
							</c:forEach>
					</tbody>
				</table>
						 <!--paginate -->
		         <div class="paginate">
		            <ul class="paging">
		               <li><a class="direction prev" href="javascript:void(0);"
		                  onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize},'${delYn }','${descYn }','${keyword }','${searchKeyword }');">
		                  &lt;&lt; </a></li>
		               <li><a class="direction prev" href="javascript:void(0);"
		                  onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize},'${delYn }','${descYn }','${keyword }','${searchKeyword }');">
		                  &lt; </a></li>
		
		               <c:forEach begin="${pagination.firstPage}"
		                  end="${pagination.lastPage}" var="idx">
		                  <li><a
		                     style="color:<c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> "
		                     href="javascript:void(0);"
		                     onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize},'${delYn }','${descYn }','${keyword }','${searchKeyword }');"><c:out
		                        value="${idx}" /></a></li>
		               </c:forEach>
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize},'${delYn }','${descYn }','${keyword }','${searchKeyword }');">
		                  &gt; </a></li>
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination.lastPage},${pagination.cntPerPage},${pagination.pageSize},'${delYn }','${descYn }','${keyword }','${searchKeyword }');">
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
function movePage(currentPage, cntPerPage, pageSize,delYn,descYn,keyword,searchKeyword){
    
    var url = "${pageContext.request.contextPath}/adminMember";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    url = url + "&delYn="+delYn;
    url = url + "&descYn="+descYn;
    url = url + "&keyword="+keyword;
    url = url + "&searchKeyword="+searchKeyword;
    
    location.href=url;
}
 
</script>
</html>