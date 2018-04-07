<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="UTF-8">
<title>亲近自然，热爱动物！欢迎访问动物百科网！</title>
<c:set value="${pageContext.request.contextPath}" var="path"
	scope="page" />
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/js/Calendar.js">
	
</script>
<!-- Bootstrap CSS -->
<link href="${path}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${path}/css/elegant-icons-style.css" rel="stylesheet" />
<link href="${path}/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="container-fluid">
		<div id="navigation"></div>
		<div id="banner"></div>
		<div id="content"></div>
		<div id="footer"></div>
	</div>
</body>
</html>