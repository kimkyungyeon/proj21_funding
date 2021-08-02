<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안 읽은 쪽지함</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/message_css/message-unRead.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/paging_css/paging.css">
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
	
	//10,20,30개씩 selectBox 클릭 이벤트
	function changeSelectBox(currentPage, cntPerPage, pageSize){
	    var selectValue = $("#cntSelectBox").children("option:selected").val();
	    movePage(currentPage, selectValue, pageSize);
	    
	}
	
	//페이지 이동
	function movePage(currentPage, cntPerPage, pageSize){
	    
	    var url = "${pageContext.request.contextPath}/message/message-unRead";
	    url = url + "?currentPage="+currentPage;
	    url = url + "&cntPerPage="+cntPerPage;
	    url = url + "&pageSize="+pageSize;
	    
	    location.href=url;
	}
</script>
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/>					 
		</header>
		<section id="messageFormArea">		
			<fieldset id="menu">
				<jsp:include page="/WEB-INF/view/message/message-menu.jsp"/>
			</fieldset>
			<div id="message">
				<h2>안 읽은 쪽지함(${pagination.totalRecordCount})</h2>
				<form:form modelAttribute="message"  action="dels">
				<fieldset id="messageForm">
					<table>
						<tr>	
							<th><input type="checkbox" id="checkAll"/></th>					
							<th>발신자</th>						
							<th>내용</th>
							<th>발신일</th>						
						</tr>
						<c:forEach var="msg" items="${messages}">
							<tr>
								<td><form:checkbox path="check" value="${msg.msgNo}"/></td>		
								<td><a href="<c:url value="/message/message-receive/${msg.msgNo}?currentPage=${pagination.currentPage}&readYN=${msg.readYN}" />">${msg.sendUser}</a></td>		
								<td><a href="<c:url value="/message/message-receive/${msg.msgNo}?currentPage=${pagination.currentPage}&readYN=${msg.readYN}" />">${msg.msgContent}</a></td>									
								<td><tf:formatDateTime value="${msg.sendDate}" pattern="yyyy-MM-dd" /></td>																			
							</tr>
						</c:forEach>					
					</table>
				</fieldset>
				
				<!--paginate -->
			    <div class="paginate">
		            <ul class="paging">
		               <li><a class="direction prev" href="javascript:void(0);"
		                  onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize});">
		                  &lt;&lt; </a></li>
		               <li><a class="direction prev" href="javascript:void(0);"
		                  onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
		                  &lt; </a></li>
		
		               <c:forEach begin="${pagination.firstPage}" end="${pagination.lastPage}" var="idx">
		               <li><a style="color:<c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> "
		                     href="javascript:void(0);" onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
		                        value="${idx}" /></a></li>
		               </c:forEach>
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
		                  &gt; </a></li>
		               <li><a class="direction next" href="javascript:void(0);"
		                  onclick="movePage(${pagination.lastPage},${pagination.cntPerPage},${pagination.pageSize});">
		                  &gt;&gt; </a></li>
		            </ul>
		         </div>
			    <!-- /paginate -->
			   <form:hidden path="readYN"  value="false"/> 
			   <form:hidden path="currentPage" value="${pagination.currentPage}"/>
			   <div id="btn">
			  	 <form:button>삭제</form:button>
			   </div>
			</form:form>
		</div>				
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>		
	</div>
</body>
</html>