<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.animal.model.Login,com.animal.model.AnimalInfo,java.util.*" %>
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
		<div class="container">
			<div class="heading text-center">
				<!-- Heading -->
				<h2>请输入想要查询的动物</h2>
				<form action="${path}/AnimalController/seachAnimal/" method="POST">
					<input type="text" id="seachWord" name="seachWord" class="seachWord" style="font-size:25px;height:45px">
					<input class="btn btn-default" style="font-size:25px; height:40px" type="submit" id="seachBtn" name="seachBtn" value="搜一下" /></li>
					</ul>
				</form>
			</div>
			<div class="row">
<%

AnimalInfo animalInfo = new AnimalInfo();
ArrayList<AnimalInfo> listAnimalInfo =  (ArrayList<AnimalInfo>) session.getAttribute("listAnimalInfo");
%>
<%=listAnimalInfo==null?"空":listAnimalInfo.toString()%>
				<!-- item -->
				<div class="col-md-4 text-center">
					<i class="fa fa-arrows fa-2x circle"></i>
					<h3>
						Responsive <span class="id-color">Design</span>
					</h3>
					<p>Nullam ac rhoncus sapien, non gravida purus. Alinon elit
						imperdiet congue. Integer elit imperdiet congue.</p>
				</div>
				<!-- end: -->

				<!-- item -->
				<div class="col-md-4 text-center">
					<i class="fa fa-css3 fa-2x circle"></i>
					<h3>
						HTML5/CSS3 <span class="id-color">Dev</span>
					</h3>
					<p>Nullam ac rhoncus sapien, non gravida purus. Alinon elit
						imperdiet congue. Integer elit imperdiet congue.</p>
				</div>
				<!-- end: -->

				<!-- item -->
				<div class="col-md-4 text-center">
					<i class="fa fa-lightbulb-o fa-2x circle"></i>
					<h3>
						JavaScript <span class="id-color">jQuery</span>
					</h3>
					<p>Nullam ac rhoncus sapien, non gravida purus. Alinon elit
						imperdiet congue. Integer ultricies sed elit impe.</p>
				</div>
				<!-- end: -->

				<!-- item -->
				<div class="col-md-4 text-center">
					<i class="fa fa-globe fa-2x circle"></i>
					<h3>
						Web <span class="id-color">Designing</span>
					</h3>
					<p>Nullam ac rhoncus sapien, non gravida purus. Alinon elit
						imperdiet congue. Integer elit imperdiet conempus.</p>
				</div>
				<!-- end:-->
				<!-- item -->
				<div class="col-md-4 text-center">
					<i class="fa fa-desktop fa-2x circle"></i>
					<h3>
						Wordpress <span class="id-color">Dev</span>
					</h3>
					<p>Nullam ac rhoncus sapien, non gravida purus. Alinon elit
						imperdiet congue. Integer ultricies sed elit imperdiet congue.
						Integer ultricies sed ligula eget tempus.</p>
				</div>
				<!-- end: -->

				<!-- item -->
				<div class="col-md-4 text-center">
					<i class="fa fa-tablet fa-2x circle"></i>
					<h3>
						Mobile <span class="id-color">Dev</span>
					</h3>
					<p>Nullam ac rhoncus sapien, non gravida purus. Alinon elit
						imperdiet congue. Integer elit imperdiet congue. Integer ultricies
						sed ultricies sed ligula eget tempus.</p>
				</div>
				<!-- end:-->

			</div>
		</div>
		<!--/.container-->
	</section>
	<!--/.page-section-->
	<section class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="pull-left copyRights">
						Copyright &copy; 2018.动物百科网，部分图片来源于网络，若有侵权，请联系删除！ <a
							href="http://www.cssmoban.com/" target="_blank" title="联系我们">联系我们</a>
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
        var userId = '<%=userId%>';
        if(userId == null || userId =="" || userId == undefined){
    		$("#signOut").hide();
        	$("#loginIn").show();
        }else{
        	$("#signOut").show();
        	$("#loginIn").hide();
        }
        });
</script>
</body>
</html>