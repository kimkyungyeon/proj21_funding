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
<title>후원자 리스트</title>
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
	href="/proj21_funding/css/admin_css/sponsorList.css">
</head>
<body>
		<!-- 본문 -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<section>
					<h1>${prjDetail.prjName }</h1><h4>${prjDetail.prjContent }</h4><hr>
				</section>
				<h3>후원자 리스트</h3>
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>프로젝트 정보</strong>
					</div>
					<div class="panel-body">
							<div class="proDiv">
							<div class="progress1">
								<span class="progress-bar" role="progressbar" aria-valuenow="${prj.rate }" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width:${prjDetail.rate}%">
								</span>
							</div>
							<span><strong>달성률</strong> : ${prjDetail.rate }%</span><br>
							</div>
							<span><strong>목표금액</strong> : <fmt:formatNumber value="${prjDetail.prjGoal }" pattern="#,###"/>원</span>
							<span><strong>달성금액</strong> : <fmt:formatNumber value="${prjDetail.totalPrice }" pattern="#,###"/>원</span>
							<span><strong>후원자 수</strong> : ${prjDetail.totalCount }명</span>
					</div>
				</div>
				<table class="table table-stripedPink table-bordered ">
					<thead>
						<tr >
							<th class="col-md-1 text-center">번호</th>
							<th class="col-md-1 text-center">후원자 명</th>
							<th class="col-md-1 text-center">닉네임</th>
							<th class="col-md-1 text-center">계정</th>
							<th class="col-md-1 text-center">후원 옵션</th>
							<th class="col-md-3 text-center">후원 내용</th>
							<th class="col-md-1 text-center">후원 금액</th>
						</tr>
	 				</thead>
					<tbody>
					<c:forEach var="sponsor" items="${sponsorList }" varStatus="status">
						<tr class="text-center">
							<td>${status.count }</td>
							<td>${sponsor.sponsorName }</td>
							<td>${sponsor.sponsor }</td>
							<td>${sponsor.userId }</td>
							<td>${sponsor.optName }</td>
							<td class="text-left">${sponsor.optContent }</td>
							<td><fmt:formatNumber value="${sponsor.optPrice}" pattern="#,###"/>원</td>
							
						</tr>	
					</c:forEach>
					</tbody>
				</table>
				<button  id="MOVE_TOP_BTN">TOP</button>
			</div>
		</div>

</body>
</html>