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
		<script>
			function checkUpdate() { 
				var oldPassword = $('input[name="oldPassword"]').val();
				var newPassword = $('input[name="newPassword"]').val();
				var renewPassword = $('input[name="renewPassword"]').val();
				//取出session中的用户密码来比较
				var userLoginInfo = "<%=session.getAttribute("loginsession")%>";
				var strs = userLoginInfo.split("userPassword=");
				var userPassword = strs[1].split(",");
				if(oldPassword == "" || newPassword == "" || renewPassword == "") {
					alert("任何一项都不能为空哦~");
					return false;
				} else if(oldPassword != userPassword[0]) {
					alert("原密码错误，再好好想想~");
					return false;
				} else if(newPassword != renewPassword) {
					alert("两次输入的不一样哟~");
					return false;
				} else {
					alert("修改密码成功~");
					return true;
				}

			}
		</script>
	</head>
	<title>修改密码</title>

	<body>

		<div class="container">
			<div class="container-fluid">
			</div>
			<form action="${path}/Login/updatePassword/" method="POST" onsubmit="return checkUpdate();">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th style="width: 170px;">现在的密码</th>
							<th><input type="password" name="oldPassword" /></th>
						</tr>
						<tr>
							<th style="width: 170px;">新密码</th>
							<th><input type="password" name="newPassword" /></th>
						</tr>
						<tr>
							<th style="width: 170px;">再一次输入新密码</th>
							<th><input type="password" name="renewPassword" /></th>
						</tr>
						<tr>
							<th colspan="2" class="text-center"><input type="submit" value="提交" /></th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</form>
		</div>
	</body>

</html>