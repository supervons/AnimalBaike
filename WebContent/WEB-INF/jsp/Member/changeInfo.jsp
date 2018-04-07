<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<c:set value="${pageContext.request.contextPath}" var="path" scope="page" />
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
		<script src="${path}/js/cityselect.js"></script>
		<link href="${path}/css/cityLayout.css" type="text/css" rel="stylesheet">
		<script>
			function checkUpdate() { //检测用户是否已经投过票，如未投票则检测是否勾选投票信息
				var userName = $('input[name="userName"]').val();
				var userAge = $('input[name="userAge"]').val();
				var userEmail = $('input[name="userEmail"]').val();
				//邮箱正则表达式
				var regEmail = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g; 
				var regAge = /^([0-9]{1,2})$/; 
				if(userName == "" || userAge == "" || userEmail == ""){
					alert('您还有选项没有填哦！');
					return false;
				}else if(!regEmail.test(userEmail)){
					alert('邮箱格式不对哟！！');
					return false;
				}else if(!regAge.test(userAge)){
					alert('年龄不对哦！！');
					return false;
				}else{
					alert('修改成功！！');
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
	<title>投票详情</title>
	</head>

	<body>
		<div class="container">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<!-- Brand/logo -->
				<!-- Brand/logo -->
				<a class="navbar-brand" href="#">Vote</a>
				<!-- Links -->
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="${path}/Login/goIndex/">投票主页</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${path}/Login/myVote/">我的投票</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${path}/Login/changeInfo/">修改个人信息</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#" onclick="window.open('${path}/Login/changePassword/','_blank','location=no,scrollbars=0,resizable=0,width=450px,height=300px,left=450,top=200;');">修改密码</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${path}/Login/logOut/">退出登录</a>
					</li>
				</ul>
			</nav>

			<div class="w-50 center-block mx-auto" style="margin-top: 15px;">
				<form action="${path}/User/updateUserInfo/" method="post" onsubmit="return checkUpdate();"> 
					<div class="center-block">

						<table class="table table-bordered col-sm-8">
							<thead>
								<tr>
									<th  class="text-right">用户账号：</th>
									<td><input type="text" name="userId" value="${usersession.userId}" class="form-control"  readonly></td>
								</tr>
								<tr>
									<th class="text-right">用户名：</th>
									<td><input type="text" name="userName" value="${usersession.userName}" class="form-control"/></td>
								</tr>
								<tr>
									<th class="text-right">年龄：</th>
									<td><input type="text" name="userAge" value="${usersession.userAge}" class="form-control"/></td>
								</tr>
								<tr>
									<th class="text-right ">性别：</th>
									<td><input type="text" name="userSex" value="${usersession.userSex}" class="form-control"  readonly></td>
								</tr>
								<tr>
									<th class="text-right">邮箱：</th>
									<td><input type="text" name="userEmail" value="${usersession.userEmail}" class="form-control"/></td>
								</tr>
								<tr>
									<th class="text-right">地址：</th>
									<td><input type="text" id="userAddress" name="userAddress" value="${usersession.userAddress}" class="form-control"/></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2" class="text-center" ><input type="submit" value="保存" class="form-control"/></td>
								</tr>

							</tbody>
						</table>
				</form>
				</div>
			</div>

	</body>

</html>