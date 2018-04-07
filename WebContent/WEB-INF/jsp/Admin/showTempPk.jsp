<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

	<head>
		<meta charset="utf-8">

		<title>网上投票系统管理员后台</title>
		<c:set value="${pageContext.request.contextPath}" var="path" scope="page" />
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${path}/js/Calendar.js"> </script>
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
			function checkAddVote() { 
				//检测是否有未填项，四个答案中，c和d不是必须填，至少保证有两个选项。
				for(var i = 0; i < document.addForm.elements.length - 1; i++) {
					if(document.addForm.elements[i].value == "" && document.addForm.elements[i].name!="voteResultC" && document.addForm.elements[i].name!="voteResultD") {
						alert("您还有未填写的选项哦！");
						document.addForm.elements[i].focus();
						return false;
					}
				}
				
				return true;
			}
		</script>
	</head>

	<body>
		<section id="container" class="">

			<header class="header dark-bg text-center">
				<h1>即时PK<small>---扫描投票，方便快捷!</small></h1>
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
					<div class="w-50 center-block mx-auto" style="margin-top: 15px;">
							<div class="center-block">

								<table class="table table-bordered col-sm-8" style="font-size: 25px;">
									<thead>
										
									<input type="hidden" name="voteId" value="tempPK"  class="form-control">
										<tr>
											<td class="text-center ">${tempPk.voteTitle}</td>
										</tr>										
										<tr  style="background-color: red;">
											<td class="text-center " style="color: #000000">${tempPk.voteResultA}</td>
										</tr>
										<tr style="background-color: blue;"  >
											<td class="text-center " style="color: white;">${tempPk.voteResultB}</td>
										</tr>
										<tr >
											<td class="text-center " colspan="2">请扫描下方二维码进行投票</td>
										</tr>
										<tr >
											<td class="text-center " colspan="2"><img src="${path}/images/goTempPk.png"/></td>
										</tr>
										<tr >
											<td class="text-center " colspan="2" style="font-size: 17px;">也可以访问：www.godcat.top/Vote/User/goPublicTempPk进行投票哦</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2" class="text-center"><input type="submit" value="结束并查看投票结果" onclick="window.location.href='${path}/Vote/CloseTempPk'" class="form-control" /></td>
										</tr>

									</tbody>
								</table>
						</div>
					</div>
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