<%@ page import="proj21_funding.service.impl.CategoryServiceImpl"%>
<%@ page import="proj21_funding.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 | 고객센터</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_write.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
<link rel="stylesheet" href="/proj21_funding/css/servicecenter/write.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/servicecenter/all_view_top.css">
</head>
<body>
	<section class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
		</header>
	<section class = "sevicecenter_write">	
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
				<h2>답변하기</h2>
			</div>
			<div id="questioncont">
				<form action="<%=request.getContextPath()%>/qnaRpSuccess"
					method="post">
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
						<dd class="td_right"><label for="userNo">${user.nickName }</label></dd>
					</dl>
					<dl>
						<dt class="td_left"><label for="qnaDate">질문날짜</label></dt>
						<dd class="td_right"><label for="qnaDate"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qna.qnaDate }"/></label></dd>
					</dl>
					<dl>
						<dt class="td_left"><label for="qnaContent">내용</label></dt>
						<dd class="td_right"><label for="qnaContent">${qna.qnaContent }</label></dd>
					</dl>
					<dl>
						<dt class="td_left"><label for="qnaFile">파일첨부</label></dt>
						<dd class="td_right">첨부된 파일 확인</dd>
					</dl>
					<dl>
						<dt class="td_left"><label for="qnaReply">답변내용</label></dt>
						<dd class="td_right"><textarea name="qnaReply" id="qnaReply" cols="40" rows="15" required="required"></textarea></dd>
					</dl>
						<div id="hidden"><input type="hidden" id="userNo" name="userNo.userNo" value="${authInfo.userNo }" size=40 required="required" readonly="readonly" />
								<input type="hidden" id = "qnaNo" name = "qnaNo"  value ="${qna.qnaNo }" size = 40 required="required"  readonly="readonly"/></div>
					<section id="commandCell">
						<input type="submit" value="등록">&nbsp;&nbsp;
						<input type="reset" value="다시쓰기">
					</section>
			 <!--   <a href="/proj21_funding/qnaadminview" style="text-decoration:none"><button id="go_qna" >돌아가기</button></a> -->
				</form>
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