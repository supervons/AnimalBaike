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
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${path}/js/login.js"></script>
<script type="text/javascript" src="${path}/js/register.js"></script>
<script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script>
</head>
<body>
	<div>
		<div class="loginwarrp">

			<div class="logo">动物百科注册</div>
			<div id="welcomeInfo" class="alert alert-info" style="display: block">
				加入动物百科，尽情释放自己吧~</div>
			<div id="phoneNumberAlert" class="alert alert-warning"
				style="display: none">
				<a class="close" onclick="closeAlert()">&times;</a> <strong>提示：</strong>手机号码有误，请重新输入。
			</div>
			<div id="codeNumberAlert" class="alert alert-warning"
				style="display: none">
				<a class="close" onclick="closeAlert()">&times;</a> <strong>提示：</strong>验证码不正确，请检查。
			</div>
			<div id="userIdAlert" class="alert alert-warning"
				style="display: none">
				<a class="close" onclick="closeAlert()">&times;</a> <strong>提示：</strong>该用户名已被使用。
			</div>
			<div id="userIdcheck" class="alert alert-warning"
				style="display: none">
				<a class="close" onclick="closeAlert()">&times;</a> <strong>提示：</strong>用户名不能为空，且大于6位。
			</div>
			<div id="userIdCanUseAlert" class="alert alert-success"
				style="display: none">
				<a class="close" onclick="closeAlert()">&times;</a> <strong>提示：</strong>该用户名可以使用。
			</div>
			<div id="checkPassWordLength" class="alert alert-warning"
				style="display: none">
				<a class="close" onclick="closeAlert()">&times;</a> <strong>提示：</strong>密码长度六位以上。
			</div>
			<div id="codeSendSuccessAlert" class="alert alert-success"
				style="display: none">
				<a class="close" onclick="closeAlert()">&times;</a> <strong>成功：</strong>发送成功，请注意查收验证码。
			</div>
			<div id="passWordAlert" class="alert alert-warning"
				style="display: none">
				<a class="close" onclick="closeAlert()">&times;</a> <strong>提示：</strong>两次密码不一致，请重新输入。
			</div>
			<div id="myAlert" class="alert alert-warning" style="display: none">
				<a class="close" onclick="closeAlert()">&times;</a> <strong>提示：</strong>请全部填写后再注册。
			</div>
			<div class="login_form">
				<form id="regiseter_form" action="${path}/Login/register/"
					method="POST">
					<font color="red">${requestScope.isExistFlag}</font>
					<ul>
						<li class="login-item">
							<!-- 				 enctype="multipart/form-data" --> <span>用户名：</span> <input
							type="text" id="userId" name="userId" class="login_input">
							<span id="count-msg" class="error"></span>
						</li>
						<li class="login-item"><span>密 &nbsp 码：</span> <input
							type="password" id="userPassword" name="userPassword"
							class="login_input"> <span id="password-msg"
							class="error"></span></li>

						<li class="login-item"><span>再次输入：</span> <input
							type="password" id="userPasswordReplay" name="userPasswordReplay"
							class="login_input"> <span id="password-msg"
							class="error"></span></li>

						<li class="login-item"><span>手机号：</span> <input type="text"
							id="phoneNum" name="phoneNum" class="login_input"> <span
							id="password-msg" class="error"></span></li>

						<li class="login-item" style="width: 50%; float: left"><span>验证码：</span>
							<input type="text" style="width: 40%" id="checkCode"
							name="checkCode" class="login_input"></li>
						<input id="sendCodeBtn"
							style="width: 45%; float: right; margin-top: 5%"
							class="btn btn-default" type="button" value="获取验证码"
							onclick="sendCode()" />
						<li class="login-sub"><input type="submit" value="注册"
							onclick="return checkFrom()" />
					</ul>
				</form>
			</div>

		</div>
	</div>
</body>
</html>