<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/prjBoard_css/prjBoard.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"  ></script>
<script type="text/javascript">
	$(document).ready(function(){   
	    $('ul.tabs li').click(function(){
	       var tab_id = $(this).attr('data-tab');
	
	    $('ul.tabs li').removeClass('current');
	    $('.board_mid').removeClass('current');
	
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	 }); 
	    
	    $("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});

	function openWrite(){		
		window.open('<%=request.getContextPath()%>/prjBoard/prjBoard-write', '', 'left = 600, top = 150, width = 500, height = 500');
	};
</script>
</head>
<body>
	<div id="projectUserInfo" >
		<jsp:include page="/WEB-INF/view/project/projectUserInfo.jsp" />
	</div>	
	<fieldset id="prjBoardArea">			
		<section>	
			<fieldset id="btnWrite">
				<c:choose>
					<c:when test="${!empty info}">			
						<button id="btnOpenWrite" onclick="openWrite()" value="${prjNo}">글쓰기</button>
					</c:when>
					<c:when test="${prj[0].prjNo.userNo.userNo eq authInfo.userNo}">			
						<button id="btnOpenWrite" onclick="openWrite()" value="${prjNo}">글쓰기</button>
					</c:when>
					<c:otherwise>
						후원자만 글을 쓸 수 있습니다.
					</c:otherwise>
				</c:choose>				
			</fieldset>
							
			<section class="container_tab">
				<ul class="tabs">
					<li class="tab-link current"  id = "tab-click" data-tab="tab-1">모든 게시물 보기</li>
					<li class="tab-link"   id = "tab-click2" data-tab="tab-2">창작자 작성 게시물</li>
				</ul>
				
				<div id="tab-1" class="board_mid current">
					<h2>모든 게시물 보기</h2>
					<c:forEach  var="board" items="${board}" varStatus="status">				
						<fieldset class="board">
						<div id="boardContent">											
							<div id="nickName">작성자 : ${board.userNo.nickName}
							<c:if test="${prj[0].prjNo.userNo.userNo eq board.userNo.userNo}">
								<label id="originator">&nbsp;창작자&nbsp; </label>
							</c:if>
							</div>				
							<div id="postDate"><tf:formatDateTime value="${board.postDate}" pattern="yyyy-MM-dd" /></div>				
							<div id="content">
								<c:if test="${!empty board.postFile}">					
									<div id="postFile"><a href="<c:url value="/prjDetail/${prj[0].prjNo.prjNo}?postNo=${board.postNo}#prjBoard"/>"><img src="data:image/jpeg;base64,${img[status.index]}" alt="img"></a></div>	
								</c:if>
								<div id="postContent">
									<pre><a href="<c:url value="/prjDetail/${prj[0].prjNo.prjNo}?postNo=${board.postNo}#prjBoard"/>">${board.postContent}</a></pre>
								</div>
							</div>
						</div>
							<hr>
							<p id="reCount"><a href="<c:url value="/prjDetail/${prj[0].prjNo.prjNo}?postNo=${board.postNo}#prjBoard"/>">💬&nbsp;${reCount[status.index]}</a></p>
						</fieldset>	
					</c:forEach>
				</div>
			
				<div id="tab-2" class="board_mid">
					<h2>창작자 작성 게시물</h2>						
					<c:forEach  var="board" items="${board}" varStatus="status">				
						<c:if test="${prj[0].prjNo.userNo.userNo eq board.userNo.userNo}">
							<fieldset class="board">
							<div id="boardContent">								
								<div id="nickName">작성자 : ${board.userNo.nickName}
								<label id="originator">창작자</label></div>				
								<div id="postDate"><tf:formatDateTime value="${board.postDate}" pattern="yyyy-MM-dd" /></div>				
								<div id="content">
									<c:if test="${!empty board.postFile}">					
										<div id="postFile"><a href="<c:url value="/prjDetail/${prj[0].prjNo.prjNo}?postNo=${board.postNo}#prjBoard"/>"><img src="data:image/jpeg;base64,${img[status.index]}" alt="img"></a></div>	
									</c:if>
									<div id="postContent">
										<pre><a href="<c:url value="/prjDetail/${prj[0].prjNo.prjNo}?postNo=${board.postNo}#prjBoard"/>">${board.postContent}</a></pre>								
									</div>
								</div>
							</div>
								<hr>
								<p id="reCount"><a href="<c:url value="/prjDetail/${prj[0].prjNo.prjNo}?postNo=${board.postNo}#prjBoard"/>">💬&nbsp;${reCount[status.index]}</a></p>
							</fieldset>	
						</c:if>	
					</c:forEach>
				</div>			
			</section>			
		</section>		
	</fieldset>
	<div>	<button  id="MOVE_TOP_BTN">&#10514</button>	</div>		
</body>
</html>