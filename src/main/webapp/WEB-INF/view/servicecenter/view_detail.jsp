<%@ page import="proj21_funding.service.impl.CategoryServiceImpl"%>
<%@ page import="proj21_funding.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_view.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/servicecenter/all_view_top.css">
<link rel="stylesheet"
	href="/proj21_funding/css/servicecenter/write.css">
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
		</header>
	<section class = "sevicecenter_view_detail">
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
				<h2>문의내용</h2>
			</div>
			<div id="questioncont">
					<dl>
						<dt class="td_left"><label for="categoryNo">분류</label></dt>
						<dd class="td_right">
							<c:forEach var="bc" items="${bc }">
								<c:if test="${bc.categoryNo eq qna.categoryNo.categoryNo }" >
									<label for="categoryNo">${bc.categoryName }</label>
								</c:if>
							</c:forEach>
					</dl>
					<dl>
						<dt class="td_left"><label for="qnaTitle">제목</label></dt>
						<dd class="td_right"><label for="qnaTitle">${qna.qnaTitle }</label></dd>
					</dl>
					<dl>
						<dt class="td_left"><label for="userNo">질문자</label></dt>
						<dd class="td_right"><label for="userNo">
							<c:forEach var="user" items="${user }">
								<c:if test="${user.userNo eq qna.userNo.userNo }" >
									${user.nickName }
								</c:if>
							</c:forEach>
						</label></dd>
					</dl>
					<dl>
						<dt class="td_left"><label for="qnaDate">질문날짜</label></dt>
						<dd class="td_right"><label for="qnaDate"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qna.qnaDate }"/></label></dd>
					</dl>
					<dl>
						<dt class="td_left"><label for="qnaContent">내용</label></dt>
						<dd class="td_right"><label for="qnaContent">${qna.qnaContent }</label></dd>
					</dl>
				<c:choose>
				<c:when test ="${qna.qnaReply eq null }">
					<dl>
						<dt class="td_left"><label for="qnaDate">답변날짜</label></dt>
						<dd class="td_right"><label for="qnaDate">0000-00-00</label></dd>
					</dl>
					<dl>
						<dt class="td_left"><label for="qnaReply">답변내용</label></dt>
						<dd class="td_right"><label for="qnaReply"><span>답변을 준비 중입니다.<br>질문의 답변까지는 주말을 제외하고 2~3일이 소요될 수 있습니다.<br>문의 답변 시간 : 평일 09:00 ~ 17:00</span></label></dd>
					</dl>
				</c:when>
				<c:when test ="${qna.qnaReply ne null }">
					<dl>
						<dt class="td_left"><label for="qnaDate">답변날짜</label></dt>
						<dd class="td_right"><label for="qnaDate"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qna.replyDate }"/></label></dd>
					</dl>
					<dl>
						<dt class="td_left"><label for="qnaReply">답변내용</label></dt>
						<dd class="td_right"><label for="qnaReply">${qna.qnaReply }</label></dd>
					</dl>
				</c:when>
				</c:choose>
						<div id="hidden"><input type="hidden" id="userNo" name="userNo.userNo"
								value="${authInfo.userNo }" size=40 required="required"
								readonly="readonly" /></div>
				<section id="commandCell">
					<c:if test="${authInfo.userNo < 0 }">
						<a href="/proj21_funding/qnaadminview?currentPage=${pagination.currentPage }&cntPerPage=${pagination.cntPerPage }&pageSize=${pagination.pageSize }"><button  id="commandbutton">돌아가기</button></a>
						<a href="<%=request.getContextPath() %>/qnareply/${qna.qnaNo}"><input type="button" id="commandbutton" value="답변하기"></a>
					</c:if>
					<c:if test="${authInfo.userNo > 0 }">
						<a href="/proj21_funding/qnauserview?currentPage=${pagination.currentPage }&cntPerPage=${pagination.cntPerPage }&pageSize=${pagination.pageSize }"><button  id="commandbutton">돌아가기</button></a>
						<a href="<%=request.getContextPath() %>/qnadelete/${qna.qnaNo}"><input type="button" id="commandbutton" value="삭제하기"></a>
					</c:if>
				</section>
			</div>
		</div>
	<footer>
		<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
	</footer>
	</section>
	</div>
</body>
</html>