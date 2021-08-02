<%@ page import="proj21_funding.service.impl.CategoryServiceImpl"%>
<%@ page import="proj21_funding.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 | 고객센터</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/servicecenter_view.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/servicecenter/all_view_top.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/servicecenter/write.css">
</head>
<body>
	<section class="container">
		<header>
			<jsp:include page="/WEB-INF/view/home/header_top.jsp" />
		</header>
		<section class="sevicecenter_write">
	
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
		<div id="quesall">
			<div id="question-title">
				<h2>문의하기</h2>
			</div>
			<div id="questioncont">
				<form action="<%=request.getContextPath()%>/qnaSuccess"
					method="post">
					<dl>
						<dt class="td_left"><label for="categoryNo">분류</label></dt>
						<dd class="td_right"><select name="categoryNo.categoryNo">
									<c:forEach var="bc" items="${bc }">
										<option value="${bc.categoryNo }">${bc.categoryName }</option>
									</c:forEach>
							</select></dd>
					</dl>
					<dl>
						<dt class="td_left"><label for="qnaTitle">제목</label></dt>
						<dd class="td_right"><input type="text" name="qnaTitle"
								id="qnaTitle" required="required"></dd>
					</dl>
					<dl>
						<dt class="td_left"><label for="qnaContent">내용</label></dt>
						<dd class="td_right"><textarea name="qnaContent"
									id="qnaContent" cols="40" rows="15" required="required"></textarea></dd>
					</dl>
						<div id="hidden"><input type="hidden" id="userNo" name="userNo.userNo"
								value="${authInfo.userNo }" size=40 required="required"
								readonly="readonly" /></div>
					<section id="commandCell">
						<input type="submit" value="등록">&nbsp;&nbsp; <input
							type="reset" value="다시쓰기">
					</section>
				</form>
			</div>
		</div>
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer_menu.jsp" />
			<jsp:include page="/WEB-INF/view/home/footer_info.jsp" />
		</footer>


	</section>
</body>
</html>