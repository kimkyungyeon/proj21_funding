<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
	<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/mylist_css/mydetail_list.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script type="text/javascript">			
	 $(document).ready(function(){
	//뒤로
	$(function(){
		var contextPath = "<%=request.getContextPath()%>";
		$("#back").on("click", function(){
			window.location.href = contextPath+"/backMyList/${authInfo.userNo}";
		});			
	});
		
	//옵션버튼
		$('.optionShowHide').click(function(){
			$('.optionShowHide').parent().parent().parent().parent().parent().next().toggleClass('hidden');			
			$('.optionMinus').toggleClass('hidden');
		});
	
	// 화면 상단이동
	$("#MOVE_TOP_BTN").click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return false;
	});
	
	//옵션삭제
	$('.optionMinus').on("click", function(){
		alert("옵션을 정말 삭제하시겠습니까?")		
		$('.addAll:last-child').remove();
	});
	
	var contextPath = "<%=request.getContextPath()%>";
	$('#delete_button').on("click", function(){
		window.location.href = contextPath+"/deletePrj/${optList[0].prjNo.prjNo}?userNo=${authInfo.userNo}";
		alert("프로젝트가 삭제되었습니다.")		
	});
 });
		
</script>
</head>
<body>
<%-- ${optList[0].prjNo.prjNo} --%>

	<section class="container">
			<header id = "mydetail_header">		   
					<jsp:include page="/WEB-INF/view/home/header.jsp"/>
			</header>
			<h2>프로젝트</h2>
		<form  action= "<%=request.getContextPath() %>/myListUpdate/${authInfo.userNo}" method="post">
			<section id = "detaillist_content">
				<table class = "update_table">
						<tbody>
						<tr class = "col2">
										<td class="td_left"><label for="userName">작성자</label></td>
										<td class="td_right" >
												<span id="userName">${authInfo.userName}</span>																					
										</td>					
								</tr>
								<tr class = "col3">
										<td class="td_left"><label for="pCategoryNo">카테고리</label></td>
										<td class="td_right" >
												<span id="pCategoryName">${categoryList[0].pCategoryName }</span>
										</td>
								</tr>
								<tr class = "col4">
										<td class="td_left"><label for="prjName">프로젝트</label></td>
										<td class="td_right" >
											<input type="hidden" id="prjNo" name="pNo" value="${optList[0].prjNo.prjNo}" 
														readonly="readonly"/>
											<input type="hidden" id="userNo" name="userNo.userNo" value="${authInfo.userNo}" 
														readonly="readonly"/>
											<input type="text" id="prjName" name="pName" value="${myList[0].prjNo.prjName}" 
														size=46	required="required"/>			
										</td>
								</tr>
								<tr class = "col5">
										<td class="td_left"><label for="prjContent">프로젝트 소개</label></td>
										<td class = "td_right">
											 <textarea id = "textContent" name = "pContent" class="sboption" required="required">${myList[0].prjNo.prjContent}</textarea>
										</td>
								</tr>								
								<tr class = "col6">
										<td class="td_left"><label for="prjGoal">목표금액</label></td>
										<td class="td_right" >
												 <span id="prjGoal">
														<fmt:formatNumber value="${myList[0].prjNo.prjGoal}" pattern="\\#,###"/>
												 </span>
										 </td>										
								</tr>
								<tr class = "col7">
										<td class="td_left"><label for="prjTagetPercent">달성률</label></td>
										<td class="td_right" >
												<progress value="${myList[0].prjNo.totalPrice}" max = "${myList[0].prjNo.prjGoal }"></progress><br> 
													<fmt:formatNumber value="${myList[0].prjNo.totalPrice/myList[0].prjNo.prjGoal*100}" pattern = "0.0" /><span>%</span>
										</td>
								</tr>
				
								
								<tr class = "col8">
										<td class="td_left"><label for="startDate">시작일</label></td>
										<td class="td_right" ><span id="startDate">${myList[0].prjNo.startDate}</span></td>
								</tr>
								<tr class = "col9">
										<td class="td_left"><label for="endDate">마감일</label></td>
										<td class="td_right" ><span id="endDate">${myList[0].prjNo.endDate}</span></td>
								</tr>
								<tr class = "col11">
										<td class="td_left"><label for="uploadfile">첨부사진</label></td>
										<td class="td_right" >
											<img id = "uploadfile" src="<%=request.getContextPath() %>/images/project/project${myList[0].prjNo.prjNo}.jpg" />
										</td>
								</tr>
								<tr>
										<td  colspan="2" >
											<div id = "addbtns">
													<button id = "optionMinus" type="button" class ="optionShowHide">옵션</button> 
													<button id = "optionMinus"type = "button" class = "optionMinus hidden" >옵션삭제</button>
											</div>
										</td>
								</tr>
							</tbody>
					</table>
					<section class= "addOption hidden">
					<table  class = "update_table">
							<tbody>
									 <c:choose>
									<c:when test="${optList[0].prjNo.prjNo eq optList[3].prjNo.prjNo}">
											<tr class = "col12">
													<td class="td_left">	<label for="optName">옵션1</label>	</td>
													<td class="td_right" >
															<span class = "opt1">
															<input type="hidden" id = "optNo" name = "oNo" value= "${optList[0].optNo}" ></input>
																		<input type="text" id="optName"	name="oName"
																			value="${optList[0].optName}"	 size=45 required="required"/><br>
																		<fmt:formatNumber value="${optList[0].optPrice}" pattern="\\#,###"/>																		
															</span>						
													</td>									
											</tr>																				
											<tr class = "col14">
													<td class="td_left"><label for="optContent">아이템</label></td>
													<td class="td_right" >
																<textarea id="textContent" name="oContent"  class="sb2option"
																			required="required" >${optList[0].optContent}</textarea>
													</td>											
											</tr>
											<tbody class= 'addAll'>	
											<tr class = "col12">
													<td class="td_left">	<label for="optName">옵션2</label>	</td>
													<td class="td_right" >
															<span class = "opt2">
															<input type="hidden" id = "optNo" name = "addOptNo1" value= "${optList[1].optNo}" />
																		<input type="text" id="optName"	name="addOptName1"
																			value="${optList[1].optName}"	 size=45 required="required"/><br>
																		<fmt:formatNumber value="${optList[1].optPrice}" pattern="\\#,###"/>																		
															</span>						
													</td>									
											</tr>											
											<tr class = "col14">
													<td class="td_left"><label for="optContent">아이템</label></td>
													<td class="td_right" >
																<textarea id="textContent" name="addOptContent1"  class="sb2option"
																		required="required" >${optList[1].optContent}</textarea>
													</td>											
											</tr>
											</tbody>
											
											<tbody class= 'addAll'>	
											<tr class = "col12">
													<td class="td_left">	<label for="optName">옵션3</label>	</td>
													<td class="td_right" >
															<span class = "opt3">
															 <input type="hidden" id = "optNo" name = "addOptNo2" value= "${optList[2].optNo}" />
																		<input type="text" id="optName"	name="addOptName2"
																			value="${optList[2].optName}"	 size=45 required="required"/><br>
																		<fmt:formatNumber value="${optList[2].optPrice}" pattern="\\#,###"/>																		
															</span>						
													</td>									
											</tr>											
											<tr class = "col14">
													<td class="td_left"><label for="optContent">아이템</label></td>
													<td class="td_right" >
																<textarea id="textContent" name="addOptContent2"  class="sb2option"
																		required="required" >${optList[2].optContent}</textarea>
													</td>											
											</tr>
											</tbody>
											
											<tbody class= 'addAll'>										
											<tr class = "col12">
													<td class="td_left">	<label for="optName">옵션4</label>	</td>
													<td class="td_right" >
															<span class = "opt4">
															 <input type="hidden" id = "optNo" name = "addOptNo3" value= "${optList[3].optNo}" />
																		<input type="text" id="optName"	name="addOptName3"
																			value="${optList[3].optName}"	 size=45 required="required"/><br>
																		<fmt:formatNumber value="${optList[3].optPrice}" pattern="\\#,###"/>																		
															</span>						
													</td>									
											</tr>											
											<tr class = "col14">
													<td class="td_left"><label for="optContent">아이템</label></td>
													<td class="td_right" >
																<textarea id="textContent" name="addOptContent3"  class="sb2option"
																	required="required" >${optList[3].optContent}</textarea>
													</td>											
											</tr>			
											</tbody>					
									</c:when>
									<c:when test="${optList[0].prjNo.prjNo eq optList[2].prjNo.prjNo}">
											<tr class = "col12">
													<td class="td_left">	<label for="optName">옵션1</label>	</td>
													<td class="td_right" >
															<span class = "opt1">
																 <input type="hidden" id = "optNo" name = "oNo" value= "${optList[0].optNo}" />
																		 <input type="text" id="optName"	name="oName"
																			value="${optList[0].optName}"	 size=45 required="required"/><br>
																		<fmt:formatNumber value="${optList[0].optPrice}" pattern="\\#,###"/>																		
															</span>						
													</td>									
											</tr>											
											<tr class = "col14">
													<td class="td_left"><label for="optContent">아이템</label></td>
													<td class="td_right" >
																<textarea id="textContent" name="oContent"  class="sb2option"
																			required="required" >${optList[0].optContent}</textarea>
													</td>											
											</tr>
											<tbody class= 'addAll'>	
											<tr class = "col12">
													<td class="td_left">	<label for="optName">옵션2</label>	</td>
													<td class="td_right" >
															<span class = "opt2">
															<input type="hidden" id = "optNo" name = "addOptNo1" value= "${optList[1].optNo}"/>
																		 <input type="text" id="optName"	name="addOptName1"
																			value="${optList[1].optName}"	 size=45 required="required"/><br>
																		<fmt:formatNumber value="${optList[1].optPrice}" pattern="\\#,###"/>																		
															</span>						
													</td>									
											</tr>											
											<tr class = "col14">
													<td class="td_left"><label for="optContent">아이템</label></td>
													<td class="td_right" >
																<textarea id="textContent" name="addOptContent1"  class="sb2option"
																		required="required" >${optList[1].optContent}</textarea>
													</td>											
											</tr>
											</tbody>
											
											<tbody class= 'addAll'>										
											<tr class = "col12">
													<td class="td_left">	<label for="optName">옵션3</label>	</td>
													<td class="td_right" >
															<span class = "opt3">
																 <input type="hidden" id = "optNo" name = "addOptNo2" value= "${optList[2].optNo}"/>
																		 <input type="text" id="optName"	name="addOptName2"
																			value="${optList[2].optName}"	 size=45 required="required"/><br>
																		<fmt:formatNumber value="${optList[2].optPrice}" pattern="\\#,###"/>																		
															</span>						
													</td>									
											</tr>											
											<tr class = "col14">
													<td class="td_left"><label for="optContent">아이템</label></td>
													<td class="td_right" >
																<textarea id="textContent" name="addOptContent2"  class="sb2option"
																		required="required" >${optList[2].optContent}</textarea>
													</td>											
											</tr>
											</tbody>
											
											</c:when>
											<c:when test="${optList[0].prjNo.prjNo eq optList[1].prjNo.prjNo}">
											<tr class = "col12">
													<td class="td_left">	<label for="optName">옵션1</label>	</td>
													<td class="td_right" >
															<span class = "opt1">
																	 <input type="hidden" id = "optNo" name = "oNo" value= "${optList[0].optNo}"/>
																		<input type="text" id="optName"	name="oName"
																			value="${optList[0].optName}"	 size=45 required="required"/><br>
																		<fmt:formatNumber value="${optList[0].optPrice}" pattern="\\#,###"/>																		
															</span>						
													</td>									
											</tr>											
											<tr class = "col14">
													<td class="td_left"><label for="optContent">아이템</label></td>
													<td class="td_right" >
																<textarea id="textContent" name="oContent"  class="sb2option"
																			required="required" >${optList[0].optContent}</textarea>
													</td>											
											</tr>
											<tbody class= 'addAll'>	
											<tr class = "col12">
													<td class="td_left">	<label for="optName">옵션2</label>	</td>
													<td class="td_right" >
															<span class = "opt2">
																 <input type="hidden" id = "optNo" name = "addOptNo1" value= "${optList[1].optNo}" />
																		 <input type="text" id="optName"	name="addOptName1"
																			value="${optList[1].optName}"	 size=45 required="required"/><br>
																		<fmt:formatNumber value="${optList[1].optPrice}" pattern="\\#,###"/>																		
															</span>						
													</td>									
											</tr>											
											<tr class = "col14">
													<td class="td_left"><label for="optContent">아이템</label></td>
													<td class="td_right" >
																<textarea id="textContent" name="addOptContent1"  class="sb2option"
																		required="required" >${optList[1].optContent}</textarea>
													</td>											
											</tr>	
											</tbody>
																					
											</c:when>
											<c:when test="${empty optList[1] }">
												<tr class = "col12">
														<td class="td_left"><label for="optName">옵션이름</label></td>
														<td class="td_right" >
													<input type="text" id="optName"	name="oName"
																				value="${optList[0].optName}"	 size=45 required="required" ></input> 
														</td>									
												</tr>
												<tr class = "col13">
														<td class="td_left"><label for="optPrice">옵션금액</label></td>
														<td class="td_right" >
																<span id="optPrice">													
																	<fmt:formatNumber value="${optList[0].optPrice}" pattern="\\#,###"/>
																</span>
														</td>
												</tr>
												<tr class = "col14">
														<td class="td_left"><label for="optContent">옵션내용</label></td>
													<td class="td_right" >
																	<textarea id="textContent" name="oContent"  class="sb2option"
																			rows="8" cols="35"	required="required" >${optList[0].optContent}</textarea>
														</td>				
												</tr> 										
											</c:when>
								</c:choose>
						
							</tbody>					
					</table>				
					</section>
						
				</section>					
					<div>	<button  id="MOVE_TOP_BTN">&#10514</button>	</div>			
						<div id = "btns_bottom">
								<input class= "btns" type="submit"  value="수정"/>&nbsp;
								<button class= "btns" type="button" id = "delete_button">삭제</button>&nbsp;							
								<button class= "btns" type="button" id = "back">뒤로</button>								
						</div>		
					</form>				
			<footer>
					<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
			</footer>
	</section>
</body>
</html>