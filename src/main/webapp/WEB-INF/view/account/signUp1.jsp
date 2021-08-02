<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/signUp1.css">
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
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
		</header>
		<section id="signUpArea">	
			<form:form action="signUp2" modelAttribute="userSignUp">	
			<form:errors />		
			<fieldset id="signUpForm">
			<h2>회원 가입<span id="necessary">*필수 입력사항입니다.</span></h2>			
				<div id="signUpdata">
					<div id="signUpCont">
					<p>
						<label >*아이디</label><br>
						<form:input path="userId" placeholder="사용할 아이디를 입력해주세요." />
					</p>					
					<p id="errors"><form:errors path="userId"/>&nbsp;</p>
					</div>
					<div id="signUpCont">
					<p>
						<label>*비밀번호입력 </label><br>
						<form:password path="userPw" placeholder="비밀번호를 입력해주세요."/>
					</p>	
					<p id="errors"><form:errors path="userPw"/>&nbsp;</p>				
					<p>
						<form:password path="confirmUserPw" placeholder="비밀번호를 확인합니다." />
					</p>				
					<p id="errors"><form:errors path="confirmUserPw"/>&nbsp;</p>
					</div>
					<div id="signUpCont">
					<p>
						<label>*이름</label><br>
						<form:input path="userName" placeholder="이름을 입력해주세요."/> 
					</p>
					<p id="errors"><form:errors path="userName"/>&nbsp;</p>	
					</div>
					<div id="signUpCont">
					<p>
						<label>*별명</label><br>
						<form:input path="nickName" placeholder="별명을 입력해주세요."/>
					</p> 
					<p id="errors"><form:errors path="nickName"/>&nbsp;</p>
					</div>
					<div id="signUpCont">
					<p>
						<label>*이메일</label><br>
						<form:input path="email" placeholder="이메일을 입력해주세요."/>
					</p> 
					<p id="errors"><form:errors path="email"/>&nbsp;</p>
					</div>
					<div id="signUpCont">
					<p>
						<label>H.P</label><br>
						<form:input path="userPhone" placeholder="전화번호를 입력해주세요."/>
					</p>		 
					<p id="errors">&nbsp;</p>				
					</div>
					<div id="signUpCont">
					<p>
						<label>*주소</label><br>
						<form:input path="zipCode" id="member_post" placeholder="클릭하세요" readonly="true" /> 
						<form:button type="button" onclick="findAddr()">검색</form:button>
					</p>
					<p id="errors">&nbsp;</p>					
					</div>
					<div id="signUpCont">
					<p>
						<form:input path="address" id="member_addr" readonly="true" />
					</p>
					<p id="errors"><form:errors path="address"/>&nbsp;</p>					
					<p>
						<form:input path="detailAddress" placeholder="상세주소를 입력하세요" />
					</p>		 
					<p id="errors">&nbsp;</p>						
					</div>
					<div id="signUpCont">
					<p>
						<label>은행명</label><br>
						<form:input path="bankName"  placeholder="사용할 은행명을 입력해주세요."/>
					</p>
					<p id="errors">&nbsp;</p>
					</div>
					<div id="signUpCont">
					<p>
						<label>예금주</label><br>
						<form:input path="accountHolder"  placeholder="예금주를 입력해주세요."/>
					</p>
					<p id="errors">&nbsp;</p>	
					</div>
					<div id="signUpCont">
					<p>
						<label>계좌번호</label><br>
						<form:input path="bankAccount"  placeholder="사용할 계좌번호를 입력해주세요."/>
					</p>
					<p id="errors">&nbsp;</p>		
					</div>
				</div>		
				<p id="Terms">	
					<form:checkbox path="agree" value="true"/>					
					<span>이용약관에 모두 동의 합니다.</span>			
					<a href="#"><form:button type="button">보기</form:button></a>
				</p>
				<p id="agreeEerrors"><form:errors path="agree"/>&nbsp;</p>							
				<form:button id="submit">회원가입</form:button>
			</fieldset>			
			</form:form>
		</section>		
	</div>
</body>
</html>