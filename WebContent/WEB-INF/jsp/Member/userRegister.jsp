<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>网上投票系统</title>
		<c:set value="${pageContext.request.contextPath}" var="path" scope="page" />
		<link rel="stylesheet" href="${path}/css/reset.css" />
		<link rel="stylesheet" href="${path}/css/login.css" />
		<link rel="stylesheet" href="${path}/css/bootstrap-theme.css" />
		<link rel="stylesheet" href="${path}/css/bootstrap-theme.min.css" />
		<link rel="stylesheet" href="${path}/css/bootstrap.css" />
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/js/login.js"></script>
		<script src="${path}/js/cityselect.js"></script>
		<link href="${path}/css/cityLayout.css" type="text/css" rel="stylesheet">
		<script>
			function checkUpdate() { //检测用户是否已经投过票，如未投票则检测是否勾选投票信息
				var userName = $('input[name="userName"]').val();
				var userAge = $('input[name="userAge"]').val();
				var userEmail = $('input[name="userEmail"]').val();
				var userPassword = $('input[name="userPassword"]').val();
				var userPassword1 = $('input[name="userPassword1"]').val();
				//邮箱正则表达式
				var regEmail = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
				var regAge = /^([0-9]{1,2})$/;
				if(userName == "" || userAge == "" || userEmail == "") {
					alert('您还有选项没有填哦！');
					return false;
				} else if(!regEmail.test(userEmail)) {
					alert('邮箱格式不对哟！！');
					return false;
				} else if(!regAge.test(userAge)) {
					alert('年龄不对哦！！');
					return false;
				} else if(userPassword != userPassword1){					
					alert('两次输入的密码不一致！！');
					return false;
				} else {
					return true;
				}

			}
			$(function() {
				init_city_select($("#userAddress, #sel2"));
			});

			function getValue() {
				alert($('#userAddress').val());
			}
		</script>
	</head>

	<body>
		<div class="page" style="margin-top: -180px; font-size: 18px;">
			<div class="loginwarrp">
			<font color="red">${requestScope.addFlag}</font>
				<div class="logo">网上投票系统用户注册</div>
				<div class="login_form">
					<form action="${path}/User/addUser/" method="POST" onsubmit="return checkUpdate();">

						<table class="table table-bordered ">
							<thead>
								<tr>
									<th class="text-right">用户账号：</th>
									<td><input type="text" name="userId" class="form-control"></td>
								</tr>
								<tr>
									<th class="text-right">用户密码：</th>
									<td><input type="password" name="userPassword" class="form-control" /></td>
								</tr>
								<tr>
									<th class="text-right">再次输入密码：</th>
									<td><input type="password" name="userPassword1" class="form-control" /></td>
								</tr>
								<tr>
									<th class="text-right">姓名：</th>
									<td><input type="text" name="userName" class="form-control" /></td>
								</tr>

								<tr>
									<th class="text-right">年龄：</th>
									<td><input type="text" name="userAge" class="form-control" /></td>
								</tr>
								<tr>
									<th class="text-right ">性别：</th>
									<td>
										<select name="userSex" class="form-control">
											<option value="男">男</option>
											<option value="女">女</option>
										</select>
									</td>
								</tr>
								<tr>
									<th class="text-right">邮箱：</th>
									<td><input type="text" name="userEmail" class="form-control" /></td>
								</tr>
								<tr>
									<th class="text-right">地址：</th>
									<td><input type="text" id="userAddress" name="userAddress" class="form-control" /></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2" class="text-center"><input type="submit" value="保存" class="form-control" /></td>
								</tr>

							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			window.onload = function() {
				var config = {
					vx: 4,
					vy: 4,
					height: 2,
					width: 2,
					count: 100,
					color: "121, 162, 185",
					stroke: "100, 200, 180",
					dist: 6000,
					e_dist: 20000,
					max_conn: 10
				}
				CanvasParticle(config);
			}
		</script>
		<script type="text/javascript" src="${path}/js/canvas-particle.js"></script>
	</body>

</html>