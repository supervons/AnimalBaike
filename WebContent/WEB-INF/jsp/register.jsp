<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上投票系统</title>
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

			<div class="logo">动物百科注册</div>
			<div class="login_form">
				<form action="${path}/Login/register/" method="POST">
					<font color="red">${requestScope.message}${requestScope.addFlag}</font>
					<ul>
					<li class="login-item">
						<!-- 				 enctype="multipart/form-data" --> <span>用户名：</span> <input
						type="text" id="userId" name="userId"
						class="login_input"> <span id="count-msg" class="error"></span>
					</li>
					<li class="login-item"><span>密   码：</span> <input
						type="password" id="userPassword" name="userPassword"
						class="login_input"> <span id="password-msg" class="error"></span></li>

					<li class="login-item"><span>手机号：</span> <input
						type="text" id="phoneNum" name="phoneNum"
						class="login_input"> <span id="password-msg" class="error"></span></li>

					<li class="login-item" style="width:50%;float:left"><span>验证码：</span> <input
						type="password" style="width:30%"  id="userPassword" name="userPassword"
						class="login_input">
						</li>
						<input id="sendCodeBtn" style="width:45%;float:right;margin-top:5%" class="btn btn-default" type="button" value="获取验证码" onclick="sendCode()"/>
						
					<li class="login-sub" ><input type="submit" value="注册" />
					</ul>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${path}/js/canvas-particle.js"></script>
</body>
</html>