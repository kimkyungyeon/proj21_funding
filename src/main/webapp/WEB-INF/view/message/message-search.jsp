<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/message_css/message-search.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")) {
				$("input[type=checkbox]").prop("checked",true); 
			} else { 
				$("input[type=checkbox]").prop("checked",false);
			}
		});		
	});	
	
	function setReceive(){
		var select = eval("document.selectform");
		var checked = document.getElementsByName("check");
		var chkList = "";
		
		for(var i=0; i<checked.length; i++) {
			if(checked[i].checked == true){				
				chkList += checked[i].value+", ";
			}			
		}	
		
		opener.document.getElementById("receiveUser").value = chkList;
		window.close(); 
	};	
</script>
</head>
<body>	
	<section id="searchArea">
		<div id="proceeding">
			<h2>진행중인 프로젝트</h2>			
			<fieldset id="projects">
				<table>
					<tr>
						<th>번호</th>
						<th>프로젝트 명</th>
						<th>마감일</th>						
					</tr>
					<c:forEach var="pro" items="${projects}">
						<tr>					
							<td><a href="<c:url value="/message/message-search/${pro.prjNo}" />">${pro.prjNo}</a></td>
							<td><a href="<c:url value="/message/message-search/${pro.prjNo}" />">${pro.prjName}</a></td>
							<td><a href="<c:url value="/message/message-search/${pro.prjNo}" />"><tf:formatDateTime value="${pro.endDate}" pattern="yyyy-MM-dd" /></a></td>
						</tr>
					</c:forEach>						
				</table>				
			</fieldset>
		</div>		
		<div id="empty">>></div>
		<div id="support">
			<h2>후원참여 회원</h2>			
			<fieldset id="members">		
				<table>
					<tr>
						<th><input type="checkbox" id="checkAll"/></th>										
						<th>회원번호</th>						
						<th>회원계정</th>						
						<th>회원닉네임</th>												
					</tr>		
					<c:forEach var="funding" items="${fundingInfos}">									
						<tr>
							<td><input type="checkbox" value="${funding.userNo.userId}" id="check" name="check"></td>
							<td>${funding.userNo.userNo}</td>					
							<td>${funding.userNo.userId}</td>					
							<td>${funding.userNo.nickName}</td>							
						</tr>									
					</c:forEach>
				</table>		
			</fieldset>			
		</div>						
	</section>
	<div id="btn">
		<button onclick="setReceive()">선택하기</button>
		<button onclick="window.close();">닫기</button>
	</div>
</body>
</html>