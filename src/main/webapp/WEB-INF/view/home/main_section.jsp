<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main_center_section</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main_section.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script> $(document).ready(function(){
	$('.title').slick({		 
		 prevArrow : $('.title-prev'),
		 nextArrow : $('.title-next'),
		 infinite: true,   
	      autoplay: true,
	      autoplaySpeed: 2000,
	      slidesToShow: 1,
	      slidesToScroll: 1
	});
 
	$('.slider').slick({
      dots: false,
      arrows: false,     
  
      infinite: true,   
      autoplay: true,
      autoplaySpeed: 2000,      
      slidesToShow: 4,
      slidesToScroll: 4,      
      responsive: [ {
         breakpoint: 600, // 화면의 넓이가 600px 이상일 때
         settings: {
            slidesToShow: 3,
            slidesToScroll: 3
            }},
            { breakpoint: 320, // 화면의 넓이가 320px 이상일 때
               settings: {
                  slidesToShow: 1,
                  slidesToScroll: 1 }
            }]
   });
   });
</script>
</head>
<body>																					
				<div class="title">						
					<c:forEach items="${maxprj}" var="maxprj">
						<div id="title-post">
							<div id="title-image">
							<a href="<c:url value='/prjDetail/${maxprj.prjNo}'/>"><img src="images/project/project${maxprj.prjNo}.jpg"  id="projImg"></a>							
							</div>
							<div id="title-imageinfo">
									${maxprj.prjName}<br>
									${maxprj.totalCount}명 / ${maxprj.rate}% 
							</div>
						</div>																	
					</c:forEach>							
				</div>
				<div id="title-btn">
					<button type="button" class="title-prev"><</button>
					<button type="button" class="title-next">></button>					
				</div>

			<div class="mainSlid">	
				<h2>신규 프로젝트</h2>																				
				<div class="slider">						
					<c:forEach items="${newprj}" var="newprj">
						<div class="post">
							<a href="<c:url value='/prjDetail/${newprj.prjNo}'/>"><img src="images/project/project${newprj.prjNo}.jpg"><span class="listprojtitle">${newprj.prjName}</span></a>
						</div>
					</c:forEach>										
				</div>			
			</div>			
						
			<div class="mainSlid">
				<h2>주목할 만한 프로젝트</h2>																
				<div class="slider">								
					<c:forEach items="${recommendPrjs}" var="rePrjs">
						<div class="post">
							<a href="<c:url value='/prjDetail/${rePrjs.prjNo}'/>"><img src="images/project/project${rePrjs.prjNo}.jpg"><span class="listprojtitle">${rePrjs.prjName}</span></a>
						</div>
					</c:forEach>
				</div>					
			</div>
			
			<div class="mainSlid">
				<h2>마감 임박 프로젝트</h2>	
					<div class="slider">							
					<c:forEach items="${endprjs}" var="endprjs">
						<div class="post">
							<a href="<c:url value='/prjDetail/${endprjs.prjNo}'/>"><img src="images/project/project${endprjs.prjNo}.jpg"><span class="listprojtitle">${endprjs.prjName}</span></a>
						</div>						
					</c:forEach>					
				</div>					
			</div>

</body>
</html>