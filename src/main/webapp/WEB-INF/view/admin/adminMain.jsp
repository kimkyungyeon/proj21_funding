<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-메인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="/proj21_funding/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/proj21_funding/bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/proj21_funding/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/paging_css/paging.css">
<link rel="stylesheet" href="/proj21_funding/css/admin_css/adminSide.css">
<link rel="stylesheet" href="/proj21_funding/css/admin_css/btn.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
//차트버전 최신으로 불러오기
google.charts.load('current', {'packages':['corechart']});
//차트를 로드3
google.charts.setOnLoadCallback(lineChart);
google.charts.setOnLoadCallback(salesRankingChart);
google.charts.setOnLoadCallback(sponsorRankingChart);

	function salesRankingChart(){
		var data = google.visualization.arrayToDataTable([
			['프로젝트명','매출액',{role:'annotation'}],
			['${salesRanking[0].prjName}',${salesRanking[0].totalPrice},'${salesRanking[0].totalPrice}원'],
			['${salesRanking[1].prjName}',${salesRanking[1].totalPrice},'${salesRanking[1].totalPrice}원'],
			['${salesRanking[2].prjName}',${salesRanking[2].totalPrice},'${salesRanking[2].totalPrice}원'],
			['${salesRanking[3].prjName}',${salesRanking[3].totalPrice},'${salesRanking[3].totalPrice}원'],
			['${salesRanking[4].prjName}',${salesRanking[4].totalPrice},'${salesRanking[4].totalPrice}원']
		]);
		
		 var options = {
			        title: "프로젝트별 매출액 랭킹  Top5",
			        bar: {groupWidth: "50%"},
			        legend: { position: "bottom" }
		};
		 
		 var chart = new google.visualization.BarChart(document.getElementById("projectRankingChart"));
	     chart.draw(data, options);
	}
	function sponsorRankingChart(){
		var data = google.visualization.arrayToDataTable([
			['회원','후원 횟수',{role:'annotation'}],
			['${sponsorRanking[0].sponsorName}(${sponsorRanking[0].sponsor})',${sponsorRanking[0].totalCount},'${sponsorRanking[0].totalCount}회'],
			['${sponsorRanking[1].sponsorName}(${sponsorRanking[1].sponsor})',${sponsorRanking[1].totalCount},'${sponsorRanking[1].totalCount}회'],
			['${sponsorRanking[2].sponsorName}(${sponsorRanking[2].sponsor})',${sponsorRanking[2].totalCount},'${sponsorRanking[2].totalCount}회'],
			['${sponsorRanking[3].sponsorName}(${sponsorRanking[3].sponsor})',${sponsorRanking[3].totalCount},'${sponsorRanking[3].totalCount}회'],
			['${sponsorRanking[4].sponsorName}(${sponsorRanking[4].sponsor})',${sponsorRanking[4].totalCount},'${sponsorRanking[4].totalCount}회']
		]);
		
		 var options = {
			        title: "후원자별 후원수 랭킹  Top5",
			        bar: {groupWidth: "50%"},
			        legend: { position: "bottom"},
			        series:{
			        	0:{color:'orange'}
			        }
		};
		 
		 var chart = new google.visualization.BarChart(document.getElementById("sponsorRankingChart"));
	     chart.draw(data, options);
	}
	
	
	
	function lineChart(){
		console.log(${fn:length(salesStat)})
	 	var arr = [
			['기간','후원수','금액'],
			['${salesStat[0].period}',${salesStat[0].count1},${salesStat[0].sum1}],
			['${salesStat[1].period}',${salesStat[1].count1},${salesStat[1].sum1}],
			['${salesStat[2].period}',${salesStat[2].count1},${salesStat[2].sum1}]
			]; 
		
		var dataTable = google.visualization.arrayToDataTable(arr);
		
		var options = {
				title: '100펀딩 월별 후원수 및 매출 현황',
				legend : {position:'bottom'},
 				series : {
 					0:{targetAxisIndex:0,axis:'후원수'},
					1:{targetAxisIndex:1,axis:'매출'}
 				},
				vAxes:{
					0:{title:'후원수'},
					1:{title:'매출'}
				},
				vAxis:{
					gridlines:{count:0}
				},
				hAxis:{
					gridlines: {count: 2}
				}
		};
		
		var objDiv = document.getElementById('line_chart');
		
		var chart = new google.visualization.LineChart(objDiv);
		chart.draw(dataTable,options)
	}
	
	
	
	
</script>

<script>
</script>
</head>
<body>
<div id="page-wrapper">
<header>
			<!-- 사이드바 -->
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="admin">100펀딩 관리자 페이지</a></li>
					<li><a class="menu" href="adminMember">회원관리</a></li>
					<li><a class="menu" href="adminProject">프로젝트관리</a></li>
					<li><a class="menu" href="adminBoard">게시판관리</a></li>
					<li><a class="menu" href="adminQna">QnA관리</a></li>
				</ul>
			</div>
			<!-- /사이드바 -->
		</header>
  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
    	<button class="goMain" onclick="location.href='<%=request.getContextPath()%>'">메인으로 이동</button>
		<button class="goMain" onclick="location.href='<%=request.getContextPath()%>/logout'">로그아웃</button>
    	<h1>메인화면</h1>
    	
    	<div id="line_chart" style="width:100%; height:500px;"></div>
    	<div id="projectRankingChart" style="width:49%; height:500px; display:inline-block"></div>
    	<div id="sponsorRankingChart" style="width:49%; height:500px; display:inline-block"></div>
    </div>
  </div>
</div>  
  <!-- /본문 -->


 
</body>
</html>
