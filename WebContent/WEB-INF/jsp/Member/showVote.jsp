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

		<!--<style>
			.xm {
				/*width: 600px;*/
				margin-top: 10px;
				/*margin-left: 250px;*/
				background-color: darkgrey .center-block();
			}
		</style>-->
		<script>
			function checkUser() { //检测用户是否已经投过票，如未投票则检测是否勾选投票信息
				var val_payPlatform = $('input[name="UserChoice"]:checked ').val();
				var exsitFlag = "<%=session.getAttribute("exsitFlag")%>";
				if(exsitFlag == "已投票") {
					alert("你已经投过票了哦~");
					return false;
				} else if(val_payPlatform == "" || val_payPlatform == null) {
					alert("别调皮哦(*^▽^*)~你还没选择呢~~");
					return false;
				} else {
					alert("投票成功！感谢您宝贵的一票！");
					return true;
				}

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
						<a class="nav-link" href="#"  onclick="window.open('${path}/Login/changePassword/','_blank','location=no,scrollbars=0,resizable=0,width=450px,height=300px,left=450,top=200;');">修改密码</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${path}/Login/logOut/">退出登录</a>
					</li>
				</ul>
			</nav>

			<div class="w-50 center-block mx-auto">
				<form action="${path}/Userchoice/addUserchoice/" method="post" onsubmit="return checkUser();">
					<input type="hidden" name="voteId" value="${vote.voteId}" /> <input type="hidden" name="userId" value="${usersession.userId}" />
					<div class="center-block">

						<table class="table table-bordered col-sm-8">
							<thead>
								<tr>
									<h3>欢迎投票~<small class="alert-danger"><b>【投票不是儿戏，一经投票不能修改，请慎重！】</small></text></h4>
								</tr>
								<tr>
									<tr>
										<th >投票项目标题：</th>
										<td>${vote.voteTitle}<text></text></td>
									</tr>
									<tr>
										<th>当前状态：</th>
										<td style="color: green;">${exsitFlag}</td>
									</tr>
									<tr>
										<th>详细说明：</th>
										<td>${vote.voteExplain}</td>
									</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input type="radio" name="UserChoice" value="${vote.voteResultA}">${vote.voteResultA}</label>
									</td>
									<td> <input type="radio" name="UserChoice" value="${vote.voteResultB}">${vote.voteResultB}</label>
									</td>
								</tr>
								<tr>
									<td>
										<input type="radio" name="UserChoice" value="${vote.voteResultC}">${vote.voteResultC}</label>
									</td>
									<td> <input type="radio" name="UserChoice" value="${vote.voteResultD}">${vote.voteResultD}</label>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="text-center"><input type="submit" value="确定"></td>
								</tr>

							</tbody>
						</table>
				</form>
				</div>
			</div>

		</div>
	</body>

</html>