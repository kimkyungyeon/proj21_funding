<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
			<meta charset="UTF-8">
			<title>계좌 등록</title>
					<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
					<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/register_bankaccount.css">
					<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script type="text/javascript">			
				/* 뒤로 */
				
			$(function(){
				var contextPath = "<%=request.getContextPath()%>";
				$(".cancel").on("click", function(){
				self.opener=self;
				window.close();
				});	
				
				  $(".test").on("click", function(){
						/* validation */  
					   var bankAccount =$('#bankAccount').val();
			           var accountHolder = $('#accountHolder').val();
					   
					   var regexp = /^[0-9]*$/			
					   
					   if(!regexp.test(bankAccount)){
						  	alert("숫자를 입력해주세요")
					   }else if(regexp.test(accountHolder)){
							alert("숫자는 입력이 안됩니다.")
					   }
			         });				
				
			});		
				
				  
				
				
	
</script>
					
</head>
<body>
<%-- ${authInfo.userNo} --%>
<%-- ${authInfo.userNo} --%>
		<section class="container">
			
				<h2>계좌등록</h2>
						<form  action= "<%=request.getContextPath() %>/registerBank/${authInfo.userNo} " method="post">
								<section id = "bankaccount_content">
										<table class= "register_table">
												<tbody>
															<tr class = "col2">
																	<td class="td_left"><label for="accountHolder">예금주</label></td>
																	<td class="td_right" >
																		<input type="hidden" id="userNo" name="userNo" value="${authInfo.userNo}" 
																					size=49	required="required" readonly="readonly"/>								
																			<input type="text" id="accountHolder" name="accountHolder" 
																					size=30	placeholder= "예금주를 입력해주세요."/>																								
																	</td>
															</tr>	
															<tr class = "col3">
																	<td class="td_left"><label for="bankName">은행명</label></td>
																	<td class="td_right" >
																			<select id = "bankName" name = "bankName" required="required" readonly="readonly" >
																					<option value = "0">----은행을 선택해주세요----</option>
																					<option value = "국민은행">국민은행</option>
																					<option value = "농협">농협</option>
																					<option value = "신한은행">신한은행</option>
																					<option value = "우리은행">우리은행</option>
																					<option value = "하나은행">하나은행</option>
																					<option value = "새마을금고">새마을금고</option>
																					<option value = "카카오뱅크">카카오뱅크</option>																			
																			</select>
																	</td>					
															</tr>
																<tr class = "col4">
																	<td class="td_left"><label for="bankAccount">계좌번호</label></td>
																	<td class="td_right" >
																			<input type="text" id="bankAccount" name="bankAccount" 
																					size=30	 required="required"   placeholder= "결제시 사용 할 계좌를 적어주세요." />																								
																	</td>
																</tr>											
												</tbody>
										</table>
								</section>						
											<div id = "btns_bottom">
													<input id = "btns" type="submit" class= "test"  value="계좌등록" readonly="readonly"/>&nbsp;							
													<button id = "btns"  type="button" class = "cancel" >취소</button>																					
											</div>		
							</form>				
				
	</section>
</body>
</html>