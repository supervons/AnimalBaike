<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>动物百科-登陆</title>
<c:set value="${pageContext.request.contextPath}" var="path"
	scope="page" />
<link rel="stylesheet" href="${path}/css/reset.css" />
<link rel="stylesheet" href="${path}/css/login.css" />
<link rel="stylesheet" href="${path}/css/bootstrap-theme.css" />
<link rel="stylesheet" href="${path}/css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="${path}/css/bootstrap.css" />
<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/js/login.js"></script>
</head>
<body>
	<div class="page">
		<div class="loginwarrp">

			<div class="logo">登陆动物百科</div>
			<div id="userInputcheck" class="alert alert-danger"
				style="display: none">
				<a class="close" onclick="closeAlert()">&times;</a> <strong>提示：</strong>请输入用户名及密码。
			</div>
			<div id="userLogincheck" class="alert alert-danger"
				style="display: none">
				<a class="close" onclick="closeAlert()">&times;</a> <strong>提示：</strong>登陆失败，用户名或密码错误。
			</div>
			<div class="login_form">
				<form action="${path}/Login/login/" method="POST">
					<input type="hidden" value="${requestScope.flag}" id="loginFlag"/>
<%-- 					<font color="red">${requestScope.message}${requestScope.addFlag}</font> --%>
					<ul>
					<li class="login-item">
						<!-- 				 enctype="multipart/form-data" --> <span>用户名：</span> <input
						type="text" id="userId" name="userId"
						class="login_input"> <span id="count-msg" class="error"></span>
					</li>
					<li class="login-item"><span>密 码：</span> <input
						type="password" id="userPassword" name="userPassword"
						class="login_input"> <span id="password-msg" class="error"></span></li>

					<li ><input class="btn btn-default" type="submit" value="登录" onclick="return checkLogin()"/>
					<input class="btn btn-default" type="reset" name="Register" value="加入我们" onclick="window.location.href='${path}/Navigation/goToRegister/'"/>
					<input class="btn btn-default" type="reset" name="Register" value="忘记密码" onclick="window.location.href='${path}/Navigation/goToRegister/'"/></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${path}/js/canvas-particle.js"></script>
</body>
</html>