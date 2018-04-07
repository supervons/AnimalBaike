<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
//			function updateVote(voteId) { //根据传过来的参数修改项目
//				var vote = {};
//				vote.voteId = voteId;
//				if(confirm('确实要删除该用户吗?')) {
//					$.ajax({
//						async: false,
//						type: "POST",
//						url: "${path}/User/deleteUserById", //注意路径  
//						data: user,
//						dataType: "json",
//						success: function(data) {
//							if(data.result == 'SUCCESS') {
//								alert("修改成功");
//							} else {
//								alert("修改失败，失败原因【" + data + "】");
//							}
//						}
//					});
//					alert("删除成功");
//					window.location.reload();
//					//					window.location.href="${path}/Login/manageUser";
//				}
//			}

			function deleteVote(voteId) { //根据传过来的参数删除项目
				var vote = {};
				vote.voteId = voteId;
				if(confirm('确定删除项目吗？')) {
					$.ajax({
						async: false,
						type: "POST",
						url: "${path}/Vote/deleteVoteById", //注意路径  
						data: vote,
						dataType: "json",
						success: function(data) {
							if(data.result == 'SUCCESS') {
								alert("删除成功");
							} else {
								alert("删除失败，失败原因【" + data + "】");
							}
						}
					});
					alert("删除项目成功！");
					window.location.reload();
					//					window.location.href="${path}/Login/manageUser";
				}
			}
		</script>
	</head>

	<body>
		<section id="container" class="">
			<header class="header dark-bg text-center">
			<a href="#" class="logo">Vote<span class="lite">投票项目管理</span></a>
			<div class="nav search-row" id="top_menu">
                <!--  search form start -->
                <ul class="nav top-menu">                    
                    <li>
                        <form class="navbar-form" method = "POST" action = "${path}/Vote/getVagueVote">
                            <input class="form-control" name="vague" placeholder="输入内容搜索" type="text">
                        </form>
                    </li>                    
                </ul>
                <!--  search form end -->     
            </div> 
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
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
								<th>编号</th>
								<th>项目标题</th>
								<th>项目说明</th>
								<th>A</th>
								<th>B</th>
								<th>C</th>
								<th>D</th>
								<th>开始时间</th>
								<th>结束时间</th>
								<th colspan="3" class="text-center">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${voteList}" var="vote" varStatus="v">

								<tr>
									<td>${vote.voteId}</td>
									<td>${vote.voteTitle}</td>
									<td>${vote.voteExplain}</td>
									<td>${vote.voteResultA}</td>
									<td>${vote.voteResultB}</td>
									<td>${vote.voteResultC}</td>
									<td>${vote.voteResultD}</td>
									<td>
										<fmt:formatDate value="${vote.voteBeginTime}" pattern="yyyy-MM-dd" />
									</td>
									<td>
										<fmt:formatDate value="${vote.voteEndTime}" pattern="yyyy-MM-dd" />
									</td>
									<td><button type="button" class="btn btn-primary" onclick="window.location.href='${path}/Vote/goUpdateVote?voteId=${vote.voteId}'">修改</button></td>
									<td><button type="button" class="btn btn-primary" style="margin-left:15px;" onclick="deleteVote('${vote.voteId}')">删除</button></td>
									<td><button type="button" class="btn btn-primary" style="margin-left:15px;" onclick="window.location.href='${path}/Login/goAnalysisVote?voteId=${vote.voteId}'">统计</button></td>
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