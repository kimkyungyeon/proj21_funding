<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 메뉴</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/message_css/message-menu.css">
</head>
<body>
	<section id = "message_menu">
		<div><a href ="<c:url value='/message/message-write'/>" id="menuA">쪽지 보내기</a></div>
		<div><a href ="<c:url value='/message/message-receive'/>" id="menuA">받은 쪽지함</a></div>
		<div><a href ="<c:url value='/message/message-unRead'/>" id="menuA">안 읽은 쪽지</a></div>		
		<div><a href ="<c:url value='/message/message-send'/>" id="menuA">보낸 쪽지함</a></div>		         
	</section>
</body>
</html>