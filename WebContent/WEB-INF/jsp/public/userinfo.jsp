<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.animal.model.Login" %>
<%@ page import="com.animal.model.UserInfo" %>
<!doctype html>
<!--[if IE 7 ]>    <html lang="en-gb" class="isie ie7 oldie no-js"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en-gb" class="isie ie8 oldie no-js"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en-gb" class="isie ie9 no-js"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en-gb" class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!--[if lt IE 9]> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
<title>动物百科-个人中心</title>
<c:set value="${pageContext.request.contextPath}" var="path"
	scope="page" />
<meta name="description" content="">
<meta name="author" content="">
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<!--[if lte IE 8]>
		<script type="text/javascript" src="http://explorercanvas.googlecode.com/svn/trunk/excanvas.js"></script>
	<![endif]-->
<link rel="stylesheet" href="${path}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/isotope.css"
	media="screen" />
<link rel="stylesheet" href="${path}/js/fancybox/jquery.fancybox.css"
	type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="${path}/css/da-slider.css" />
<link rel="stylesheet" href="${path}/css/styles.css" />
<!-- Font Awesome -->
<link href="${path}/fonts/font-awesome.min.css" rel="stylesheet">
</head>

<body>
<%
Login loginSession =  (Login)session.getAttribute("loginsession");
String userId = loginSession==null?"":loginSession.getUserId();
UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
%>
	<header class="header">
		<div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="navbar-header">
					<button type="button" id="nav-toggle" class="navbar-toggle"
						data-toggle="collapse" data-target="#main-nav">
						<span class="sr-only">导航</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a href="#" class="navbar-brand scroll-top logo"><b>动物百科</b>Animal BaiKe</a>
				</div>
				<!--/.navbar-header-->
				<div id="main-nav" class="collapse navbar-collapse">
					<ul class="nav navbar-nav" id="mainNav">
						<li><a href="${path}" class="scroll-link">首页</a></li>
						<li><a href="${path}/Navigation/goToDiscoverAnimal" class="scroll-link">发现动物</a></li>
						<li><a href="${path}/Navigation/goToShareAnimal" class="scroll-link">分享动物</a></li>
						<li><a href="${path}/Navigation/goToContactNature" class="scroll-link">亲近自然</a></li>
						<li><a href="${path}/Navigation/goToSeachRank" class="scroll-link">搜索排行</a></li>
						<li class="active"><a href="${path}/Navigation/goToUserInfo" class="scroll-link">个人中心</a></li>
						<li><a href="${path}/Navigation/goToAboutUs" class="scroll-link">关于我们</a></li>
						<li id="loginIn" style="display: block"><a href="${path}/Navigation/goToLogin" class="scroll-link">登陆</a></li>
						<li id="signOut" style="display: none"><a href="${path}/Navigation/goSignOut" class="scroll-link">退出</a></li>
					</ul>
				</div>
				<!--/.navbar-collapse-->
			</nav>
			<!--/.navbar-->
		</div>
		<!--/.container-->
	</header>
	<!--/.header-->
	<section id="contactNature" class="page-section">
		<div id="animalBaseInfo" class="" style="padding:15px">
		<div class="container center"  style="width:40%;margin-top:2%;height:500px;">
				<table class="table text-center" style="color:#000000;">
					<thead>
						<tr>
							<th class="text-center" colspan="2" id="banner"style="font-size: 25px;" >
							个人信息  PERSONAL INFORMATION
							</th>
						</tr>
					</thead>
					<form action="${path}/UserInfo/updateUserInfo" method="post">
							<%
							if(userInfo !=null){
							%>
					<tbody>
						<tr>

							<th style="font-size: 20px; margin-top: 16px;">用户编号：</th>
							<th><input class="form-control" type="text" id="userId"
								name="userId" value="<%=userInfo.getUserId()%>" readonly="true"/></th>
						</tr>
						<tr>
							<th style="font-size: 20px; margin-top: 16px;">用户姓名：</th>
							<th><input class="form-control" type="text" id="userName"
								name="userName" value="<%=userInfo.getUserName()%>" readonly="true"/></th>
						</tr>
						<tr>
							<th style="font-size: 20px; margin-top: 16px;">用户年龄：</th>
							<th><input class="form-control" type="text" id="userAge"
								name="userAge" value="<%=userInfo.getUserAge()%>" readonly="true"/></th>
						</tr>
						<tr>
							<th style="font-size: 20px; margin-top: 16px;">用户性别：</th>
							<th><input class="form-control" type="text" id="userSex"
								name="userSex" value="<%=userInfo.getUserSex()%>" readonly="true"/></th>
						</tr>
						<tr>
							<th style="font-size: 20px; margin-top: 16px;">手机号码：</th>
							<th><input class="form-control" type="text" id="userTel"
								name="userTel" value="<%=userInfo.getUserTel()%>" readonly="true"/></th>
						</tr>
						<tr>
							<th style="font-size: 20px; margin-top: 16px;">地址：</th>
							<th><input class="form-control" type="text"
								id="userAddress" name="userAddress"
								value="<%=userInfo.getUserAddress()%>" readonly="true"/></th>
						</tr>
						<tr class="text-center">
							<th colspan="2">
							<input type="button" id="changeBtn" class="btn btn-default" value="修改" onclick="changeReadonly()">
							<input type="submit" id="saveBtn" class="btn btn-default" value="保存" onclick="return save()">
							</th>
							
						</tr>
					</tbody>
					<%} %>
					</form>
				</table>
			</div>
		</div>
	</section>
	<section class="blank" id="blank">
	<div class="modal fade" id="mymodal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h3 class="modal-title">系统提示</h3>
					</div>
					<div class="modal-body">
						<h4>该模块需要登陆后才可以查看哦~</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" ">关闭</button>
						<button type="button" class="btn btn-primary" onclick="goToLogin()">去登陆</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</section>
	<!--/.page-section-->
	<section class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="pull-left copyRights">
						Copyright &copy; 2018.动物百科网，部分图片来源于网络，若有侵权，请联系删除！
						<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=934235475&amp;site=qq&amp;menu=yes">联系我们</a>
					</div>
				</div>
			</div>
			<!-- / .row -->
		</div>
	</section>
	<a href="#top" class="topHome"><i class="fa fa-chevron-up fa-2x"></i></a>

	<!--[if lte IE 8]><script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script><![endif]-->
	<script src="${path}/js/modernizr-latest.js"></script>
	<script src="${path}/js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="${path}/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${path}/js/jquery.isotope.min.js" type="text/javascript"></script>
	<script src="${path}/js/fancybox/jquery.fancybox.pack.js"
		type="text/javascript"></script>
	<script src="${path}/js/jquery.nav.js" type="text/javascript"></script>
	<script src="${path}/js/jquery.cslider.js" type="text/javascript"></script>
	<script src="${path}/js/Common.js" type="text/javascript"></script>
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js">
</script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
    $(function(){
    	$("#saveBtn").hide();
        var userId = '<%=userId%>';
        if(userId == null || userId =="" || userId == undefined){
    		$("#signOut").hide();
        	$("#loginIn").show();
        	$("#blank").show();
        	$("#banner").hide();
        }else{
        	$("#signOut").show();
        	$("#loginIn").hide();
        	$("#blank").hide();
        	$("#banner").show();
        }
        var loginSession = '<%=loginSession%>';
        if(loginSession == null || loginSession =="" || loginSession == undefined || loginSession == 'null' ){
            $("#mymodal").modal("toggle");         	
        }
        });
    function changeReadonly(){
    	$("#changeBtn").hide();
    	$("#saveBtn").show();
    	var userName = document.getElementById("userName");
    	var userAge = document.getElementById("userAge");
    	var userSex = document.getElementById("userSex");
    	var userTel = document.getElementById("userTel");
    	var userAddress = document.getElementById("userAddress");
    	userName.removeAttribute("readonly");
    	userAge.removeAttribute("readonly");
    	userSex.removeAttribute("readonly");
    	userTel.removeAttribute("readonly");
    	userAddress.removeAttribute("readonly");
    }
    function save(){
    	$("#saveBtn").hide();
    	$("#changeBtn").show();
    	var userName = document.getElementById("userName");
    	var userAge = document.getElementById("userAge");
    	var userSex = document.getElementById("userSex");
    	var userTel = document.getElementById("userTel");
    	var userAddress = document.getElementById("userAddress");
    	userName.setAttribute("readonly", true);
    	userAge.setAttribute("readonly", true);
    	userSex.setAttribute("readonly", true);
    	userTel.setAttribute("readonly", true);
    	userAddress.setAttribute("readonly", true);
    }
</script>
</body>
</html>