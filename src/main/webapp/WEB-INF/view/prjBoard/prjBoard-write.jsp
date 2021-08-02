<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 게시판</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/prjBoard_css/prjBoard_write.css">
</head>
<body>
	<fieldset id="prjBoardwriteArea">
	<form:form modelAttribute="prjBoard" enctype="multipart/form-data" method="post">
	<form:errors />
		<form:hidden path="postNo" value="${pBoard.postNo}"/>
		<form:hidden path="prjNo" value="${prjNo}"/>		
		<form:hidden path="userNo.userNo" value="${authInfo.userNo}"/>		
		<p>파일 : 
			<c:if test="${!empty pBoard}">
				${pBoard.fileName}<br>
			</c:if>
			<form:input path="postFile" type="file" accept=".jpg, .jpeg, .png" text="${pBoard.fileName}" />
		</p>
		<textarea cols="40" rows="15"  name="postContent" id="postContent" >${pBoard.postContent}</textarea>
		<%-- <p><form:textarea path="postContent" value="${pBoard.postContent}" /><c:out value="${pBoard.postContent}"/><p>	 --%>
		<p id="errors"><form:errors path="postContent"/>${complet}&nbsp;</p>		
		<div id="btn">
			<c:if test="${empty pBoard}">
				<form:button>등록하기</form:button>
			</c:if>
			<c:if test="${!empty pBoard}">
				<form:button>수정하기</form:button>
			</c:if>			
		</div>
	</form:form>	
	</fieldset>
</body>
</html>