<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/prjBoard_css/prjBoard_detail.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"  ></script>
<script type="text/javascript">
	function modifyBoard(){	
		window.open('<%=request.getContextPath()%>/prjBoard/prjBoard-write?postNo=${prBoard.postNo}', '', 'left = 600, top = 150, width = 500, height = 500');
	 }
</script>
</head>
<body>
	<div id="projectUserInfo" >
		<jsp:include page="/WEB-INF/view/project/projectUserInfo.jsp" />
	</div>
	<fieldset id="prjBoardDetailArea">	
	<a href="<c:url value='/prjDetail/${prBoard.prjNo}#prjBoard'/>"><button id="back" type="button">다른 게시글 보기</button></a>			
		<div id="detailArea">
			<section>	
			<br>				
				<div id="nickName">작성자 : ${prBoard.userNo.nickName}
					<c:if test="${prj[0].prjNo.userNo.userId eq prBoard.userNo.userId}">
						<label id="originator">&nbsp;창작자&nbsp; </label>
					</c:if>
				</div>				
				<div id="postDate"><tf:formatDateTime value="${prBoard.postDate}" pattern="yyyy-MM-dd" /></div>				
				<c:if test="${!empty prBoard.postFile}">					
					<div id="postFile"><img src="data:image/jpeg;base64,${img}" alt="img"></div>	
					<br>
				</c:if>
				<div id="postContent">
					<pre>${prBoard.postContent}</pre>
				</div>
			</section>
			<c:if test="${authInfo.userId eq prBoard.userNo.userId}">
				<div id="btn">
					<button type="button" onclick="modifyBoard()">수정</button>
					<a href="<c:url value="/prjDetail/deleteBoard?postNo=${prBoard.postNo}"/>"><button type="button">삭제</button></a>	
				</div>
			</c:if>
			<br>	
			<p id="countReply">${fn:length(boardReply)}개의 댓글이 있습니다.</p>		
			<hr>
			<c:if test="${!empty info || prj[0].prjNo.userNo.userNo eq authInfo.userNo}">
		<form:form modelAttribute="prjBoardReply" action="registerReply">		
			<div><form:hidden path="postNo" value="${prBoard.postNo}"/></div>
			<div id="reReply">
				<form:textarea path="replyContent" id="registerReply"/>								
				<div><form:button id="registerReplyBtn">등록하기</form:button></div>						
			</div>	
			<p id="errors">${err}&nbsp;</p>		
		</form:form>		
		</c:if>
		<section id="boardReply">						
			<c:forEach items="${boardReply}" var="reply">
				<div id="boardReplyCon" >
					<div id="nickName">${reply.userNo.nickName}
					<c:if test="${prj[0].prjNo.userNo.userId eq reply.userNo.userId}">
						<label id="originator">&nbsp;창작자&nbsp; </label>
					</c:if>
					 &nbsp;:</div>				
					<div id="replyContent"><pre>${reply.replyContent}</pre></div>									
				</div>
				<c:if test="${authInfo.userId eq reply.userNo.userId}">								
					<div id="delRebtn">
						<a href="<c:url value="/prjDetail/deleteReply?postNo=${prBoard.postNo}&replyNo=${reply.replyNo}"/>"><button type="button" id="reBtn">삭제</button></a>	
					</div>
				</c:if>
				<p>----------------------------------------------------------------------------------------------------------</p>
			</c:forEach>				
		</section>
		</div>
	</fieldset>
</body>
</html>