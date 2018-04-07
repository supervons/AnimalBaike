<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

	<head>
		<meta charset="utf-8">

		<title>网上投票系统管理员后台</title>
		<c:set value="${pageContext.request.contextPath}" var="path" scope="page" />
		<!-- Bootstrap CSS -->
		<link href="${path}/css/bootstrap-theme.css" rel="stylesheet">
		<link href="${path}/css/elegant-icons-style.css" rel="stylesheet" />
		<link href="${path}/css/style.css" rel="stylesheet">
		<script>
			function deleteUser(userId) { //根据传过来的参数删除用户
				var user = {};
				user.userId = userId;
				if(confirm('确实要删除该用户吗?')) {
					$.ajax({
						async: false,
						type: "POST",
						url: "${path}/User/deleteUserById", //注意路径  
						data: user,
						dataType: "json",
						success: function(data) {
							if(data.result == 'SUCCESS') {
								alert("修改成功");
							} else {
								alert("修改失败，失败原因【" + data + "】");
							}
						}
					});
					alert("删除成功");
					window.location.reload();
					//					window.location.href="${path}/Login/manageUser";
				}
			}

			function updateUserPassword(userId) { //根据传过来的参数删除用户
				var user = {};
				user.userId = userId;
				if(confirm('确实要重置该用户密码为【123456】吗?')) {
					$.ajax({
						async: false,
						type: "POST",
						url: "${path}/Login/resetUserPassword", //注意路径  
						data: user,
						dataType: "json",
						success: function(data) {
							if(data.result == 'SUCCESS') {
								alert("修改成功");
							} else {
								alert("修改失败，失败原因【" + data + "】");
							}
						}
					});
					alert("重置密码成功");
					window.location.reload();
					//					window.location.href="${path}/Login/manageUser";
				}
			}
		</script>
	</head>

	<body>
		<section id="container" class="">

			<header class="header dark-bg text-center">
				<h1>网上投票系统管理后台</h1>
			</header>

			<aside>
				<div id="sidebar" class="nav-collapse ">
					<!-- sidebar menu start-->
					<ul class="sidebar-menu">
						<li class="active">
							<a class="" href="${path}/Login/adminIndex">
								<i class="icon_house_alt"></i>
								<span>主页</span>
							</a>
						</li>
						<li class="sub-menu">
							<a href="javascript:;" class="">
								<i class="icon_document_alt"></i>
								<span>用户管理</span>
								<span class="menu-arrow arrow_carrot-right"></span>
							</a>
							<ul class="sub">
								<li>
									<a class="" href="${path}/Login/manageUser">查看用户信息</a>
								</li>	
							</ul>
						</li>
						<li class="sub-menu">
							<a href="javascript:;" class="">
								<i class="icon_desktop"></i>
								<span>投票项目管理</span>
								<span class="menu-arrow arrow_carrot-right"></span>
							</a>
							<ul class="sub">
								<li>
									<li>
										<a class="" href="${path}/Vote/goAddVote">添加新项目</a>
									</li>
									<li>
										<a class="" href="${path}/Vote/manageVote">查看项目信息</a>
									</li>						
								<li>
									<a class="" href="${path}/Vote/tempPK">即时PK</a>
								</li>
							</ul>
							</li>
							<li>
								<a class="" href="#" onclick="window.open('${path}/Login/changePassword/','_blank','location=no,scrollbars=0,resizable=0,width=450px,height=300px,left=450,top=200;');">
									<i class="icon_genius"></i>
									<span>修改密码</span>

								</a>

							</li>

							<li>
								<a class="nav-link" href="${path}/Login/logOut/">
									<i class="icon_close"></i>
									<span>退出系统</span>

								</a>

							</li>

					</ul>
				</div>
			</aside>
			<section id="main-content">
				<section class="wrapper">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>用户编号</th>
								<th>用户姓名</th>
								<th>年龄</th>
								<th>性别</th>
								<th>邮箱</th>
								<th>地址</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList}" var="user" varStatus="v">

								<tr>
									<td>${user.userId}</td>
									<td>${user.userName}</td>
									<td>${user.userAge}</td>
									<td>${user.userSex}</td>
									<td>${user.userEmail}</td>
									<td>${user.userAddress}</td>
									<td><button type="button" class="btn btn-primary" onclick="updateUserPassword('${user.userId}')">重置密码</button><button type="button" class="btn btn-primary" style="margin-left:15px;" onclick="deleteUser('${user.userId}')">删除用户</button></td>
								</tr>

							</c:forEach>
							<!--</form>-->
						</tbody>
					</table>
				</section>
			</section>
		</section>
		<script src="${path}/js/jquery.js"></script>
		<script src="${path}/js/jquery-1.8.3.min.js"></script>
		<script src="${path}/js/bootstrap.min.js"></script>
		<script src="${path}/js/jquery.nicescroll.js" type="text/javascript"></script>
		<script src="${path}/js/scripts.js"></script>
	</body>

</html>