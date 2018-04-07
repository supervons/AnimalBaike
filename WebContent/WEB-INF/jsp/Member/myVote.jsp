<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<c:set value="${pageContext.request.contextPath}" var="path" scope="page" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	</head>
	<title>我的投票</title>
	</head>

	<body>

		<div class="container">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
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
						<a class="nav-link" href="#"  onclick="window.open('${path}/Login/changePassword/','_blank','location=no,scrollbars=0,resizable=0,width=450px,height=300px,left=450,top=200;');">修改密码</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${path}/Login/logOut/">退出登录</a>
					</li>
				</ul>
			</nav>

			<div class="container-fluid">
				<h2>历史投票记录</h2>
			</div>
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th>投票项目编号</th>
						<th>标题</th>
						<th>我的选择</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${userchoiceList}" var="userchoice" varStatus="v">

						<tr>
							<td>${userchoice.voteId}</td>
							<td>${userchoice.vote.voteTitle}</td>
							<td>${userchoice.userChoice}</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>

</html>