<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.animal.model.Login,com.animal.model.AnimalInfo,java.util.*" %>
<%@ page import="com.animal.serviceimpl.AnimalInfoServiceImpl" %>
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
<title>亲近自然，热爱动物！欢迎访问动物百科</title>
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
						<li class="active"><a href="${path}/Navigation/goToDiscoverAnimal" class="scroll-link">发现动物</a></li>
						<li><a href="${path}/Navigation/goToShareAnimal" class="scroll-link">分享动物</a></li>
						<li><a href="${path}/Navigation/goToContactNature" class="scroll-link">亲近自然</a></li>
						<li><a href="${path}/Navigation/goToSeachRank" class="scroll-link">搜索排行</a></li>
						<li><a href="${path}/Navigation/goToUserInfo" class="scroll-link">个人中心</a></li>
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
	<div id="#top"></div>
		<div class="actionPanel">
			<div class="container">
				<div class="row">
					<div class="col-sm-9 ">
					</div>
					<div class="col-sm-3 ">
					</div>
				</div>
			</div>
		</div>
		<section id="services" class="page-section">
		<div id="animalBaseInfo" class="" style="background-color: #8B8B7A;padding:15px">
		<div class="container center"  style="width:60%; height:500px;background:url(${path}/images/BG/animalBG.jpg);box-shadow: 10px 10px 5px #000000;">
		<%
		AnimalInfo animalInfo = (AnimalInfo)session.getAttribute("animalDetailsInfo");
		%>
<%-- 		<%=animalInfo.toString()%> --%>
				<table class="table " style="color:#ffffff;">
					<thead>
						<tr>
							<th class="text-center" colspan="2" style="font-size: 25px;" >
							<%=animalInfo.getAnimalName()%>
							<%=animalInfo.getAnimalEnglishName()==null?"":animalInfo.getAnimalEnglishName()%>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="10" style="background-color: red">Bangalore</td>
							<td class="text-left" style="width:30%">动物学名 ： <%=animalInfo.getAnimalName()==null?"":animalInfo.getAnimalName()%></td>
						</tr>
						<tr>
							<td class="text-left" style="width:30%">动物类别 ： <%=animalInfo.getAnimalType()==null?"":animalInfo.getAnimalType()%></td>
						</tr>
						<tr>
							<td class="text-left" style="width:30%">所属地区 ： <%=animalInfo.getAnimalRegion()==null?"":animalInfo.getAnimalRegion()%></td>
						</tr>
						<tr>
							<td class="text-left" style="width:30%">上传用户 ： <%=animalInfo.getAnimalUploadUser()==null?"":animalInfo.getAnimalUploadUser()%></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div id="animalBaseInfo" class="" style="padding:15px">
		<div class="container center"  style="width:60%; height:500px;">
				<table class="table " style="color:#000000;">
					<thead>
						<tr>
							<th class="text-center" colspan="2" style="font-size: 25px;" >
							物种描述 Animal Summary
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>
						 		<%=animalInfo.getAnimalDetails()==null?"暂无物种描述":animalInfo.getAnimalDetails()%>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
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
	var pathName = document.location.pathname;
	var index = pathName.substr(1).indexOf("/");
	var result = pathName.substr(0, index + 1);
    
    function goToSeach(seach_content){
    	console.log("----"+seach_content + "----");
		$.ajax({
			url : result + "/AnimalController/seachAnimal/",
			data : {
				seachWord:seach_content,
			},
			type : "POST",
			success : function(re) {
				window.location.href=result + "/Navigation/goToDiscoverAnimal?rank=yes";
			}
		});      	
    }
</script>
</body>
</html>