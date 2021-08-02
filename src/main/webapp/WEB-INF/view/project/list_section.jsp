<%@page import="proj21_funding.service.impl.PrjOptionServiceImpl"%>
<%@page import="proj21_funding.service.PrjOptionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%-- <%
	PrjOptionService service;
	service = new PrjOptionServiceImpl();
%>
<c:set var="prjDetail" value="<%=service %>"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/project_list_css/list_section.css">
</head>
<body>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
<%-- ${projects } --%>
	<div id="listAll">
		<c:forEach var="prj" items="${prjs }">
			<div id="listcont">
				<div class="border">
					<div class="prj">
						<div class="prjThumb">
							<a href="<c:url value='/prjDetail/${prj.prjNo }'/>"><img src = "<%=request.getContextPath() %>/images/project/project${prj.prjNo }.jpg" class="imgThumb"/></a>
						</div>
						<dl class="prjName">
							<dt><a href="<c:url value='/prjDetail/${prj.prjNo }'/>"><c:if test="${sysYear>=prj.endDate}">[ 마감완료 ]</c:if> ${prj.prjName }</a></dt>
							<dd>제작자 : ${prj.prjManager } | ${prj.pCategoryName }</dd>
							<dd>총 후원자 수 : ${prj.totalCount }</dd>
						</dl>
							<div class="prjpercent"><progress value="${prj.totalPrice }" max = "${prj.prjGoal }"></progress></div>
							<div class="moment"><span class="funding-amount"><fmt:formatNumber value="${prj.totalPrice }" pattern="#,###"/>원</span><span class="percent"><fmt:formatNumber value="${prj.totalPrice/prj.prjGoal*100 }" pattern="0.00"/>%</span></div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>