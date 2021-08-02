<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
     <jsp:useBean id="now" class = "java.util.Date"></jsp:useBean>
					<fmt:formatDate  var="today"  value="${now}" pattern="yyyy-MM-dd"/>
					<c:set var = "project" value="${prjList}"/>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>upload register</title>	
		
		<!--CSS  -->
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/register.css">
		<!--CSS  -->
		
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		<!--datepicker 소스api  -->
		  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		  <link rel="stylesheet" href="/resources/demos/style.css">
		  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  		<!--datepicker 소스api  -->
  		
		<script type="text/javascript">	
	
		
		/*탭   */
		$(document).ready(function(){   
	         $('ul.tabs li').click(function(){
	            var tab_id = $(this).attr('data-tab');

	         $('ul.tabs li').removeClass('current');
	         $('.register_mid').removeClass('current');

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
		
	      //goback()
	      $(function(){
	         var contextPath = "<%=request.getContextPath()%>";
	         $(".return").on("click", function(){
	        	 alert("프로젝트 등록을 취소하시겠습니까? ")
	            window.location.href = contextPath+"/uploadListCancel";	            
	         });         
	      });
	      
	      //datepicker
			$(function(){
				$(".datepicker").datepicker({
					dateFormat: 'yy-mm-dd',
					minDate: 0
				});
			
			});
	      
	      
	      $(function(){
	         var contextPath = "<%=request.getContextPath()%>";
	         $(".test").on("click", function(){
	               
	              var prjGoal =  $('#prjGoal').val();
	              var optPrice = $('#optPrice').val();
	              
	              var addOptPrice1 = $('#addOptPrice1').val();
	              var addOptPrice2 = $('#addOptPrice2').val();
	              var addOptPrice3 = $('#addOptPrice3').val();
	              
	              
	 			  var regexp = /^[0-9]*$/			
				// 조건별 옵션걸기 (문자 사용금지)
	 			 if(!regexp.test(prjGoal) || !regexp.test(optPrice)){
	 				alert("숫자를 입력해주세요")
	 			 }else if(addOptPrice1 != null && addOptPrice2 == null){
	 				 if(!regexp.test(prjGoal) || !regexp.test(optPrice) || !regexp.test(addOptPrice1))
	 				alert("숫자를 입력해주세요")
	 			 }else if(addOptPrice1 != null && addOptPrice2 != null && addOptPrice3 == null){
	 				 if(!regexp.test(prjGoal) || !regexp.test(optPrice) || !regexp.test(addOptPrice1) ||  !regexp.test(addOptPrice2))
	 				alert("숫자를 입력해주세요")
	 			 }else if(addOptPrice1 != null && addOptPrice2 != null && addOptPrice3 != null){
	 				 if(!regexp.test(prjGoal) || !regexp.test(optPrice) || !regexp.test(addOptPrice1) ||  !regexp.test(addOptPrice2) ||  !regexp.test(addOptPrice3))
	 				alert("숫자를 입력해주세요")
	 			 }			 			  
	         });         
	      });   
	      function addopt(i){
				var sCont = "";	
				sCont += "<tbody class = 'addAll'>";
				sCont += "<tr class ='tr_all'>";
				sCont += "<td class = 'td_left'><label for = 'addOptName'>옵션이름</label></td>";
				sCont += "<td class = 'td_right'> <input type='text' id = 'addOptName' class = 'addtext' name = 'addOptName"+ i +"'  required   size = 17/></td>";
				sCont += "</tr>";
				sCont += "	<tr class ='tr_all'>";
				sCont += "	<td class = 'td_left'><label for = 'addOptPrice'>옵션금액</label></td>";
				sCont += "	<td class = 'td_right'><input type='text' id = 'addOptPrice"+ i +"'   class = 'addtext' name = 'addOptPrice"+ i +"'   required  size = 17 /></td>";
				sCont += "</tr>";
				sCont += "	<tr class ='tr_all'>";
				sCont += "	<td class = 'td_left'><label for = 'addOptContent'>옵션내용</label></td>	";
				sCont += "	<td class = 'td_right'> <textarea id = 'textContent'  class = 'addtext' name = 'addOptContent"+ i +"'+  required 	rows='8' cols='38' ></textarea></td>";
				sCont += "</tr>";					
				sCont += "</tbody>";
				
				 $('.addOption:last-child').append(sCont);  
			}
			
			 //아이템 추가
		   $(function(){
				var i = 0;						
				//옵션추가
				$('.optionPlus').on("click", function(){	
					console.log(i ) 
					alert("옵션을 추가 하시겠습니까?")
				//개수 제한걸기
				if(i < 3){					
					i += 1
					addopt(i)					
				}else if(i ==3){
					alert("옵션은 최대 4개까지만 입력하실 수 있습니다.")
				}
				});
				
				//옵션삭제
				$('.optionMinus').on("click", function(){
					console.log(i)
					alert("옵션을 삭제  하시겠습니까?")
					$('.addAll:last-child').remove();
					if(i == 3){
						i = 2
					}else if(i ==2){
						i =1
					}else if(i == 1){
						i = 0
					}else if(i ==0){
						alert("최소한 1개의 옵션은 등록하셔야 됩니다.")
					}
				});	
				/* 버튼 보여주기  */
		 		$('.optionShow').click(function(){				
		 			$(this).parent().remove();
					$('.optionMinus').toggleClass('hidden');	
					$('.optionPlus').toggleClass('hidden');						
				}); 							
		   });
	</script>		
	</head>
	<body>	
		
			
			<form action= "<%=request.getContextPath() %>/listSuccess" method="post" enctype="multipart/form-data">
			<section class="container">	
			<header>		   
					<jsp:include page="/WEB-INF/view/home/header.jsp"/>
			</header>
			<section id = "register_mid">
			<!--탭 부분  -->
			<h2>프로젝트 등록</h2>
				<section class="container_tab">
						<ul class="tabs">
								<li class="tab-link current"  id = "tab-click" data-tab="tab-1">프로젝트 정보</li>
								<li class="tab-link"   id = "tab-click2" data-tab="tab-2">옵션</li>
						</ul>		
			<!--탭 부분  -->
			
			<!--탭1 프로젝트부분  -->			
				<div id="tab-1" class="register_mid current">
				
				
		<section id="register_prjcontent">
			<table class = "register_table" >
				<tbody>
					<tr>
						<td colspan="2">
									<input type="hidden" id="userNo" name="userNo.userNo" 
									value="${authInfo.userNo }" size=15 required="required" readonly="readonly" />
						</td>
					</tr>
					<tr class ='tr_all'>
						<td class="td_left"><label for="userName">작성자</label></td>
						<td class="td_right">
								<input type="text" id="userName" 	name="userName.userName"
										value="${authInfo.userName }" size= 17	required="required" readonly="readonly" />
						</td>			
					</tr>
					<tr class ='tr_all'>
						<td class="td_left"><label for="pCategoryNo">카테고리</label></td>					
						<td class="td_right" >
							<select id="pCategoryNo" name="pCategoryNo.pCategoryNo"  >		
										<option value = "0">-------선택해주세요-----------</option>
								<c:forEach var = "c"  items="${category }" >
										<option  value = " ${c.pCategoryNo }">${c.pCategoryName }</option>										
								</c:forEach>									
							</select>
						</td>
					</tr>
					<tr class ='tr_all'>
						<td class="td_left"><label for="prjName">프로젝트 명</label></td>
						<td class="td_right">
									<input type="text" id="prjName"
											name="prjName" size=45 required />
						</td>
					</tr>
					<tr class ='tr_all'>
						<td class="td_left"><label for="prjContent">프로젝트 소개</label></td>
						<td class="td_right">
								<div class= "sboption">
										<textarea id="textContent"
												name="prjContent" rows="11" cols="38" required="required"  ></textarea>
								</div>	
						</td>
					</tr>
					<tr class ='tr_all'>
						<td class="td_left"><label for="prjGoal">목표금액</label></td>
						<td class="td_right">
									<input type="text" id="prjGoal"	name="prjGoal" size=17 required="required" />
						</td>						
					</tr>
					<tr class ='tr_all'>
						<td class="td_left" id ="border_1"><label for="uploadFile">프로젝트 파일첨부</label>
						</td>
						<td class="td_right">
									<input class ="uploadfile"  type="file" name="uploadfile"	placeholder="파일 선택" required>
						</td>
					</tr>
					<tr class ='tr_all'>
						<td class="td_left"><label for="endDate">마감일</label></td>
						<td class="td_right">						
								<input type="text" class="datepicker" name = "endDate" required="required" placeholder="ex)2021-06-22" autocomplete="off">
						</td>
					</tr>
				</tbody>
			</table>
		</section>
			</div>
			<!--탭1 프로젝트부분  -->	
					
	<!--탭2 옵션부분  -->
				<div id="tab-2" class="register_mid">
				<section id = "register_optcontent">
					<table>
						<tbody>
								<tr class ='tr_all'>											
										<td class = "td_left">
												<label for = "optName">옵션이름</label>
										</td>									
										<td class = "td_right">
												 <input type="text" id = "optName" name = "optName"  size = 17 required="required"></input>
										</td>
								</tr>
								<tr class ='tr_all'>
										<td class = "td_left">
												<label for = "optPrice">옵션금액</label>
										</td>
										<td class = "td_right">
												 <input type="text" id = "optPrice" name = "optPrice"  size = 17 required="required"></input>
										</td>
								</tr>
								<tr class ='tr_all'>
										<td class = "td_left"  id ="border_1">
												<label for = "optContent">옵션내용</label>
										</td>
										<td class = "td_right">
												 <textarea id = "textContent" name = "optContent"	rows="8" cols="38" required="required"></textarea>
										</td>
								</tr>
								<tr>
									<td class="td_right" id = "info"colspan="2">
											<h4>옵션은 최대 4개까지 입력하실 수 있습니다.</h4>								
									</td>
								</tr>		
								<tr  class="options" >
										<td colspan="2">
												 <div id= "tdoption_btns1" >
												  		<button id = "optadd_minu" type = "button" class = "optionShow" >옵션</button>&nbsp; 
												  </div>
												  <div id= "tdoption_btns" >
												  		<button id = "optadd_minu" type = "button" class = "optionPlus hidden" >추가</button>&nbsp; 
												  		<button id = "optadd_minu"  type = "button" class = "optionMinus hidden" >삭제</button>
												  </div>
										</td>
								</tr>	
								</tbody>						
						</table>	
						<table class = "addOption">
						</table>
				</section>
				
					</div>				
				<!--탭2 옵션부분  -->			
					
				</section>		
					<div>	<button  id="MOVE_TOP_BTN">&#10514</button>	</div>			
				<div id="register_btns">
						<input  id = "btns" class = "test" type="submit" value="등록"/>&nbsp;
						<input  id = "btns" type="reset" value="다시쓰기" />&nbsp; 
						<button  id = "btns" type="button" class= "return">뒤로</button>
				</div>	
			
			</section>		
				<footer>
				<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
				</footer>
					</section>
				</form>
		

	</body>
	</html>
