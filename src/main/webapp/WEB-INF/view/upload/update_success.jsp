<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>upload_success</title>
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/update_success.css">
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
					<script type="text/javascript">
							/* 전체 리스트로 */
							$(function(){
								var contextPath = "<%=request.getContextPath()%>";
								$("#go_list").on("click", function(){
									window.location.href = contextPath+"/projectListAll";
								});			
							
							/* 메인으로 */
								$("#go_main").on("click", function(){
									window.location.href = contextPath+"/";
							});
							
							/* 나의 리스트로으로 */
								$("#go_myList").on("click", function(){
									window.location.href = contextPath+"/myUploadedlist/${authInfo.userNo }";
								});			
							      $("#MOVE_TOP_BTN").click(function() {
							     		$('html, body').animate({
							     			scrollTop : 0
							     		}, 400);
							     		return false;
							     	});
							
							});
					</script>
</head>
<body>
<%-- ${optList }
${project } --%>
<%-- ${optList[0].prjNo.prjNo}
${optList[1].prjNo.prjNo }
${project }
${project.prjGoal }--%>
<%-- ${category }  --%>
<%--  ${project } --%>
<%-- ${optList} --%>
<%-- ${project } --%>
<%-- ${authInfo.userName } --%>
<%-- ${optList }
		 --%>
<%-- ${project } --%>
<section class="container">
		<header>		   
				<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<h2>프로젝트 수정을 하였습니다.</h2>
		<section id= "table_all">
			<table class= "update_table" >
						<tbody>
								<tr class = "col1">
										<td class="td_left"><label for="userName">작성자</label></td>
										<td class="td_right" ><span id="userName">${authInfo.userName }</span></td>
								</tr>
								<tr class = "col2">
										<td class="td_left"><label for="pCategoryNo">카테고리</label></td>
										<td class="td_right" >
												<span id="pCategoryNo">												
														${category.pCategoryNo.pCategoryName }
												</span>
										</td>
								</tr>
								<tr class = "col3">
										<td class="td_left"><label for="prjName">프로젝트</label></td>
										<td class="td_right" ><span id="prjName">${project.pName }</span></td>
								</tr>
								<tr class = "col4">
										<td class="td_left"><label for="prjContent">프로젝트 소개</label></td>
										<td class="td_right" >
												<div class ="sboption">${project.pContent }</div>
										</td>
								</tr>								
								<tr class = "col5">
										<td class="td_left"><label for="prjGoal">목표금액</label></td>
										<td class="td_right" >
												<span id="prjGoal">
														<fmt:formatNumber value="${project.pGoal }" pattern="\\#,###"/>
												 </span>
										 </td>										
								</tr>								
								<tr class = "col6">
										<td class="td_left"><label for="endDate">마감일</label></td>
										<td class="td_right" ><span id="endDate">${project.eDate}</span></td>
								</tr>							
								<c:choose>
									<c:when test="${optList[0].prjNo.prjNo eq optList[3].prjNo.prjNo}">
										<tr class = "col8">										
							<!-- 추가적인 3개 옵션이 있을시 -->
											<td class="td_left"><label for="opt1">옵션1</label></td>
											<td class="td_right" >
												<span id="opt1">아이템 : ${optList[0].optName}<br>
											   			금액 : <fmt:formatNumber value="${optList[0].optPrice}" pattern="\\#,###"/>
											   	</span>
											</td>
										</tr>
										<tr class = "col10">
											<td class="td_left"><label for="optContent">내용</label></td>
											<td class="td_right"  colspan="2">
															<div class ="sb2option">${optList[0].optContent}</div>
											</td>
										</tr>	
										<tr class = "col9">
											<td class="td_left"><label for="opt2"> 옵션2</label></td>
											<td class="td_right" >
														<span id="opt2">아이템 : ${optList[1].optName}<br>
																금액 : <fmt:formatNumber value="${optList[1].optPrice}" pattern="\\#,###"/>
														</span>
											</td>
										</tr>
										<tr class = "col10">
											<td class="td_left"><label for="optContent">내용</label></td>
											<td class="td_right" colspan="2" >
															<div class ="sb2option">${optList[1].optContent}</div>
										  	</td>
							
										</tr>	
										<tr class = "col9">
											<td class="td_left"><label for="opt2">옵션3</label></td>
											<td class="td_right" >
														<span id="opt2">아이템 : ${optList[2].optName}<br>
														 		금액 :  <fmt:formatNumber value="${optList[2].optPrice}" pattern="\\#,###"/>
														</span>
											</td>
										</tr>
										<tr class = "col10">
											<td class="td_left"><label for="optContent">내용</label></td>
											<td class="td_right" colspan="2" >
															<div class ="sb2option">${optList[2].optContent}</div>
										  	</td>
										</tr>	
										<tr class = "col9">
											<td class="td_left"><label for="opt2">옵션4</label></td>
											<td class="td_right" >
														<span id="opt2">아이템 : ${optList[3].optName}<br>
														 		금액 :  <fmt:formatNumber value="${optList[3].optPrice}" pattern="\\#,###"/>
														</span>
											</td>
										</tr>
										<tr class = "col10">
											<td class="td_left"><label for="optContent">내용</label></td>
											<td class="td_right" colspan="2" >
															<div class ="sb2option">${optList[3].optContent}</div>
										  	</td>
										  	<!-- 추가적인 3개 옵션이 있을시 -->	
										</tr>	
									</c:when>
								
								<c:when test="${optList[0].prjNo.prjNo eq optList[2].prjNo.prjNo}">
										<tr class = "col8">										
							<!-- 추가적인 2개 옵션이 있을시 -->
											<td class="td_left"><label for="opt1">옵션1</label></td>
											<td class="td_right" >
												<span id="opt1">아이템 : ${optList[0].optName}<br>
											   			금액 : <fmt:formatNumber value="${optList[0].optPrice}" pattern="\\#,###"/>
											   	</span>
											</td>
										</tr>
										<tr class = "col10">
											<td class="td_left"><label for="optContent">내용</label></td>	
											<td class="td_right"  colspan="2">
															<div class ="sb2option">${optList[0].optContent}</div>
											</td>
										</tr>	
										<tr class = "col9">
											<td class="td_left"><label for="opt2"> 옵션2</label></td>
											<td class="td_right" >
														<span id="opt2">아이템 : ${optList[1].optName}<br>
																금액 : <fmt:formatNumber value="${optList[1].optPrice}" pattern="\\#,###"/>
														</span>
											</td>
										</tr>
										<tr class = "col10">
											<td class="td_left"><label for="optContent">내용</label></td>
											<td class="td_right" colspan="2" >
															<div class ="sb2option">${optList[1].optContent}</div>
										  	</td>
							
										</tr>	
										<tr class = "col9">
											<td class="td_left"><label for="opt2">옵션3</label></td>
											<td class="td_right" >
														<span id="opt2">아이템 : ${optList[2].optName}<br>
														 		금액 :  <fmt:formatNumber value="${optList[2].optPrice}" pattern="\\#,###"/>
														</span>
											</td>
										</tr>
										<tr class = "col10">
											<td class="td_left"><label for="optContent">내용</label></td>
											<td class="td_right" colspan="2" >
															<div class ="sb2option">${optList[2].optContent}</div>
										  	</td>
										  	<!-- 추가적인 2개 옵션이 있을시 -->	
										</tr>	
									</c:when>
									<c:when test="${optList[0].prjNo.prjNo eq optList[1].prjNo.prjNo}">
										<tr class = "col8">										
							<!-- 추가적인 1개 옵션이 있을시 -->
											<td class="td_left"><label for="opt1">옵션1</label></td>
											<td class="td_right" >
													<span id="opt2">아이템 : ${optList[0].optName}<br>
														 		금액 :  <fmt:formatNumber value="${optList[0].optPrice}" pattern="\\#,###"/>
														</span>
											</td>
										</tr>
										<tr class = "col10">
											<td class="td_left"><label for="optContent">내용</label></td>
											<td class="td_right"  colspan="2">
															<div class ="sb2option">${optList[0].optContent}</div>
											</td>
										</tr>	
										<tr class = "col9">
											<td class="td_left"><label for="opt2">옵션2</label></td>
											<td class="td_right" >
															<span id="opt2">아이템 : ${optList[1].optName}<br>
														 		금액 :  <fmt:formatNumber value="${optList[1].optPrice}" pattern="\\#,###"/>
														</span>
											</td>
										</tr>
										<tr class = "col10">
											<td class="td_left"><label for="optContent">내용</label></td>
											<td class="td_right" colspan="2" >
															<div class ="sb2option">${optList[1].optContent}</div>
										  	</td>
							<!-- 추가적인 1개 옵션이 있을시 -->	
										</tr>	
									</c:when>
									
									<c:when test="${empty optList[1] }">
										<tr class = "col8">
							<!-- 옵션이 1개일때 -->
												<td class="td_left"><label for="optName">옵션이름</label></td>
												<td class="td_right" ><span id="optName">${optList[0].optName}</span></td>
										</tr>
										<tr class = "col9">
												<td class="td_left"><label for="optPrice">옵션금액</label></td>
												<td class="td_right" >
														<span id="optPrice">													
																<fmt:formatNumber value="${optList[0].optPrice}" pattern="\\#,###"/>
														</span>
												</td>
										</tr>
										<tr class = "col10">
												<td class="td_left"><label for="optContent">옵션내용</label></td>
												<td class="td_right" ><div class ="sb2option">${optList[0].optContent}</div></td>
												
							<!-- 옵션이 1개일때 -->			
										</tr>									
									</c:when>					
							</c:choose>			
						</tbody>
				</table>
		</section>
			<div>	<button  id="MOVE_TOP_BTN">&#10514</button>	</div>			
				<div id ="foot_btn">
						<button class = "btns" id = "go_list">최근 프로젝트</button>&nbsp;
						<button class = "btns" id = "go_main">메인</button>&nbsp;
						<button class = "btns" id = "go_myList">내 프로젝트</button>						
				</div>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
	</section>


</body>
</html>