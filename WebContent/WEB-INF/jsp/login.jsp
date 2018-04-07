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

			<div class="logo">网上投票系统登陆</div>
			<div class="login_form">
				<form action="${path}/Login/login/" method="POST">
					<font color="red">${requestScope.message}${requestScope.addFlag}</font>
					<ul>
					<li class="login-item">
						<!-- 				 enctype="multipart/form-data" --> <span>用户名：</span> <input
						type="text" id="userId" name="userId"
						class="login_input"> <span id="count-msg" class="error"></span>
					</li>
					<li class="login-item"><span>密 码：</span> <input
						type="password" id="userPassword" name="userPassword"
						class="login_input"> <span id="password-msg" class="error"></span></li>

					<li class="login-sub"><input type="submit" value="登录" />
					<input type="reset" name="Register" value="注册" onclick="window.location.href='${path}/Login/userRegister/'"/></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		window.onload = function() {
			var config = {
				vx : 4,
				vy : 4,
				height : 2,
				width : 2,
				count : 100,
				color : "121, 162, 185",
				stroke : "100, 200, 180",
				dist : 6000,
				e_dist : 20000,
				max_conn : 10
			}
			CanvasParticle(config);
		}
	</script>
	<script type="text/javascript"
		src="${path}/js/canvas-particle.js"></script>
</body>
</html>