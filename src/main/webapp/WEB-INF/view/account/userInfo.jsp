<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/userInfo.css">
	<script type="text/javascript">
	function findAddr(){
		new daum.Postcode({
	        oncomplete: function(data) {        	
	        	console.log(data);        	
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('member_post').value = data.zonecode;
	            if(roadAddr !== ''){
	                document.getElementById("member_addr").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("member_addr").value = jibunAddr;
	            }
	        }
	    }).open();
	}
	
	function openCh(){		
		var popupWidth = 400;
		var popupHeight = 300;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		window.open('userChangePw', '', 'width = ' + popupWidth + ', height = '+ popupHeight
				+ ', left =' + popupX + ', top =' + popupY);
	}	
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/> 
		</header>
		<section id="userInfoArea">
			<form:form modelAttribute="userInfo">
			<form:errors />			
				<fieldset id="userInfoForm">
				<h2>회원정보</h2>
					<div id="infodata">
						<div id="infoCont">
							<p>
								<label>아이디</label><br>
								<form:input path="userId" readonly="true" value="${userInfo.userId}" />
							</p>
							<p id="errors">&nbsp;</p>
						</div>
						<div id="infoCont">
						<p>
							<label>비밀번호</label><br>
							<form:button type = "button" onclick="openCh()">비밀번호 변경</form:button>
						</p>
						<p id="errors">&nbsp;</p>
						</div>
						<div id="infoCont">
						<p>
							<label>이름</label><br>
							<form:input path="userName" readonly="true" value="${userInfo.userName}" /> 
							</p>
							<p id="errors">&nbsp;</p>	
							</div>
						<div id="infoCont">			
							<p>
								<label>별명</label><br>
								<form:input path="nickName" value="${userInfo.nickName}"/> 
							</p>
							<p id="errors"><form:errors path="nickName"/>&nbsp;</p>
						</div>
						<div id="infoCont">
							<p>
								<label>이메일</label><br>
								<form:input path="email" value="${userInfo.email}"/> 
							</p>
							<p id="errors"><form:errors path="email"/>&nbsp;</p>
						</div>
						<div id="infoCont">
							<p>
								<label>H.P</label><br>
								<form:input path="userPhone" value="${userInfo.userPhone}"/> 
							</p>
							<p id="errors">&nbsp;</p>				
						</div>
						<div id="member_post1">
							<p>
								<label>주소</label><br>
								<form:input path="zipCode" id="member_post" placeholder="클릭하세요" readonly="true"/> 
								<form:button type="button" onclick="findAddr()" id="addresssearch">검색</form:button>
							</p>
							<p id="errors">&nbsp;</p>
						</div>
						<div id="infoCont">
							<p>
								<form:input path="address" id="member_addr" readonly="true" value="${userInfo.address}"/> 
							</p>
							<p id="errors"><form:errors path="address"/>&nbsp;</p>	
						</div>
						<div id="infoCont">
							<p>
								<form:input path="detailAddress" value="${userInfo.detailAddress}"/> 
							</p>
							<p id="errors">&nbsp;</p>
						</div>
						<div id="infoCont">
							<p>
								<label>은행명</label><br>
								<form:input path="bankName" value="${userInfo.bankName}"/> 
							</p>
							<p id="errors">&nbsp;</p>
						</div>
						<div id="infoCont">
							<p>
								<label>예금주</label><br>
								<form:input path="accountHolder" /> 
							</p>
							<p id="errors">&nbsp;</p>	
						</div>
						<div id="infoCont">
							<p>
								<label>계좌번호</label><br>
								<form:input path="bankAccount" value="${userInfo.bankAccount}"/> 									
							</p>
							<p id="errors">&nbsp;</p>
						</div>
					</div>
				<div id="btn">
					<form:button id="sub1" value="submit">수정하기</form:button>											
					<a href="<c:url value='/account/userReSign'/>"><form:button id="sub2" type="button" value="del">탈퇴하기</form:button></a>
				</div>
				</fieldset>
			</form:form>
		</section>			
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>		
	</div>
</body>
</html>