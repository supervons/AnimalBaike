<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

	<head>
		<meta charset="utf-8">

		<title>即时投票页面</title>
		<c:set value="${pageContext.request.contextPath}" var="path" scope="page" />
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${path}/js/Calendar.js">
		</script>
		<!-- Bootstrap CSS -->
		<link href="${path}/css/bootstrap-theme.css" rel="stylesheet">
		<link href="${path}/css/elegant-icons-style.css" rel="stylesheet" />
		<link href="${path}/css/style.css" rel="stylesheet">
		<style>
			.text-right {
				color: #000000;
			}
		</style>
		<script>
			function checkTempPk(result) {
				var choice = {};
				choice.choiceId = result;
				var res = get_cookie("statis");
				if(res == "" || res == null) {
					if(confirm('确实要投票给' + result + '吗?')) {
						$.ajax({
							async: false,
							type: "POST",
							url: "${path}/Userchoice/addTempChoice", //注意路径  
							data: choice,
							dataType: "json"
						});
						var exp  = new Date();
						exp.setHours(exp.getTime() + 60 * 5000); //投票cookie保存五分钟
						document.cookie = "statis="+ escape(result) + ";expires=" + exp.toGMTString();  
						alert('投票成功！');
					}
				} else {
					alert("你已经投过票了哦，请关闭网页，等待结果！");
				}
			}

			function get_cookie(Name) {
				var search = Name + "=" //查询检索的值
				var returnvalue = ""; //返回值
				if(document.cookie.length > 0) {
					sd = document.cookie.indexOf(search);
					if(sd != -1) {
						sd += search.length;
						end = document.cookie.indexOf(";", sd);
						if(end == -1)
							end = document.cookie.length;
						//unescape() 函数可对通过 escape() 编码的字符串进行解码。
						returnvalue = unescape(document.cookie.substring(sd, end))
					}
				}
				return returnvalue;
			}
		</script>
	</head>

	<body>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th colspan="2" class="text-center" style="font-size: 100px;">${tempPk.voteTitle}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="text-center"><input type="button" value="红方" class="form-control" style="height: 400px; background-color: red; color: white; font-size: 200px;" onclick="checkTempPk('${tempPk.voteResultA}')" /></td>

				</tr>
				<tr>
					<td class="text-center"><input type="button" value="蓝方" class="form-control" style="height: 400px; background-color: blue; color: white; font-size: 200px;" onclick="checkTempPk('${tempPk.voteResultB}')" /></td>

				</tr>
			</tbody>
		</table>

	</body>

</html>