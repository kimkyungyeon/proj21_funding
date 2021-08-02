<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="proj21_funding.service.impl.CategoryServiceImpl"%>
<%@ page import="proj21_funding.service.CategoryService"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기 | 공지사항</title>
<link rel="stylesheet"
	href="/proj21_funding/css/servicecenter_write.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/notice_css/write.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- SmartEditor2 라이브러리 -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/nse_files/js/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>
<body>
	<section class="container">
		<section class="sevicecenter_write">
			<h2>글 수정</h2>
					
			<form action="<%=request.getContextPath()%>/adminBoardUpSuccess" method="post">
				<input type="hidden" name="boardNo" id="boardNo" value="${board.boardNo }" />
				<select id="categoryNo" name="categoryNo.categoryNo" class="category">
					<c:forEach var="bc" items="${bc }">
						<c:if test="${bc.categoryClass eq 'board' }">
							<c:choose>
								<c:when test="${bc.categoryNo eq board.categoryNo.categoryNo}">
									<option class="bc" value="${bc.categoryNo }" selected>${bc.categoryName }</option>
								</c:when>
								<c:otherwise>
									<option class="bc" value="${bc.categoryNo }">${bc.categoryName }</option>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
				</select>
				<input type="text" name="boardTitle" id="boardTitle"
					required="required" class="boardTitle"
					value="${board.boardTitle }">
				<textarea name="boardContent" id="boardContent" id="ir1"
					style="width: 100%; height: 400px;">${board.boardContent }</textarea>
					
				<div class="commandCell">
					<input type="submit" value="수정완료" onclick="submitContents(this)" class="menubutton">&nbsp;&nbsp;
					<button id="go_notice" class="menubutton" onclick="window.close()">취소</button>
				</div>
			</form>
		</section>

	</section>
</body>
<script type="text/javascript">
	var contextpath = "${contextPath}";
	console.log(contextpath);
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "boardContent",
		sSkinURI : contextpath + "/nse_files/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	});
	
	$(".updateBtn")..click(function(){
		submitContents(elClickedObj);
	}
	
	function submitContents(elClickedObj) {
		var categoryNo = $("#categoryNo > option:selected").val();
		var boardTitle = $("#boardTitle").val();
		var boardContent = document.getElementById("boardContent").value;
		
		if(boardContent == "" || boardContent == null || boardContent == '&nbsp;' || 
				boardContent == '<br>' || boardContent == '<br/>' || boardContent == '<p>&nbsp;</p>'){
			alert("본문을 작성해주세요.");
			oEditors.getById["boardContent"].exec("FOCUS"); //포커싱
			return;
		} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다.
		
		var result = confirm("발행 하시겠습니까?");
		
		if(result){
			alert("발행 완료!");
			$("#noticeWriteForm").submit();
		}else{
			return;
		}
		
		
		try {
			elClickedObj.form.submit();
		} catch (e) {
		}
		
		})
		
			
		oEditors.getById["boardContent"].exec("UPDATE_CONTENTS_FIELD", []);


	
	}
	
</script>
</html>