<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 | 고객센터</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter/write.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/servicecenter/write2.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/servicecenter/all_view_top.css">
</head>
<body>
	<section class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
		</header>
	<section class = "sevicecenter_write_end">
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
	
	<h2>문의하기</h2>
	
	<div class="writeendform">
		<p class="complete">질문이 접수되었습니다.</p>
		<p class="buyeon">질문의 답변까지는 주말을 제외하고 2~3일이 소요될 수 있습니다.</p>
		<p class="time">문의 답변 시간 : <span>평일 09:00 ~ 17:00</span></p>
	
	<div id="btn">
		<a href="/proj21_funding/qnawrite"><input type="button" value="다른 문의하기" class="btn1"></a>
		<a href="/proj21_funding/qnauserview"><input type="button" value="내 문의 내역 확인하기" class="btn1"></a>
	</div>	
	
	</div>
	
	</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer_menu.jsp"/> 
			<jsp:include page="/WEB-INF/view/home/footer_info.jsp"/> 
		</footer>		

	
	</section>
</body>
</html>