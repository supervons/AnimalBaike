<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="${path}/font/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>
	<header class="header">
		<div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="navbar-header">
					<button type="button" id="nav-toggle" class="navbar-toggle"
						data-toggle="collapse" data-target="#main-nav">
						<span class="sr-only">导航</span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a href="#" class="navbar-brand scroll-top logo"><b>动物百科</b>Animal BaiKe</a>
				</div>
				<!--/.navbar-header-->
				<div id="main-nav" class="collapse navbar-collapse">
					<ul class="nav navbar-nav" id="mainNav">
						<li><a href="${path}" class="scroll-link">首页</a></li>
						<li><a href="${path}/Navigation/goToDiscoverAnimal" class="scroll-link">发现动物</a></li>
						<li><a href="${path}/Navigation/goToShareAnimal" class="scroll-link">分享动物</a></li>
						<li><a href="#team" class="scroll-link">论坛</a></li>
						<li><a href="${path}/Navigation/goToContactNature" class="scroll-link">亲近自然</a></li>
						<li><a href="${path}/Navigation/goToSeachRank" class="scroll-link">搜索排行</a></li>
						<li class="active"><a href="${path}/Navigation/goToAboutUs" class="scroll-link">关于我们</a></li>
						<li><a href="${path}/Navigation/goToLogin" class="scroll-link">登陆</a></li>
					</ul>
				</div>
				<!--/.navbar-collapse-->
			</nav>
			<!--/.navbar-->
		</div>
		<!--/.container-->
	</header>
	<!--/.header-->
	<section id="aboutUs" class="page-section darkBg pDark pdingBtm30">
		<div class="container">

			<div class="row">
				<div class="col-md-4 col-sm-4">
					<h3>
						<i class="fa fa-desktop color"></i> &nbsp; What we do?
					</h3>
					<!-- Paragraph -->
					<p>Duis aute irure dolor in reprehenderit in voluptate velit
						esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
						occaecat cupidatat non proident, sunt in culpa qui officia
						deserunt mollit occaecat cupidatat non id est laborum.</p>
				</div>
				<div class="col-md-4 col-sm-4">
					<!-- Heading -->
					<h3>
						<i class="fa fa-cloud color"></i> &nbsp;Why choose us?
					</h3>
					<!-- Paragraph -->
					<p>Duis aute irure dolor in reprehenderit in voluptate velit
						esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
						occaecat cupidatat non proident, sunt in culpa qui officia
						deserunt mollit occaecat cupidatat non id est laborum.</p>
				</div>
				<div class="col-md-4 col-sm-4">
					<!-- Heading -->
					<h3>
						<i class="fa fa-home color"></i> &nbsp;Where are we?
					</h3>
					<!-- Paragraph -->
					<p>Duis aute irure dolor in reprehenderit in voluptate velit
						esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
						occaecat cupidatat non proident, sunt in culpa qui officia
						deserunt mollit occaecat cupidatat non id est laborum.</p>
				</div>
			</div>
		</div>
		<!--/.container-->
	</section>
<section id="aboutUs" class="page-section darkBg pDark pdingBtm30">
		<div class="container">

			<div class="row">
				<div class="col-md-4 col-sm-4">
					<h3>
						<i class="fa fa-desktop color"></i> &nbsp; What we do?
					</h3>
					<!-- Paragraph -->
					<p>Duis aute irure dolor in reprehenderit in voluptate velit
						esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
						occaecat cupidatat non proident, sunt in culpa qui officia
						deserunt mollit occaecat cupidatat non id est laborum.</p>
				</div>
				<div class="col-md-4 col-sm-4">
					<!-- Heading -->
					<h3>
						<i class="fa fa-cloud color"></i> &nbsp;Why choose us?
					</h3>
					<!-- Paragraph -->
					<p>Duis aute irure dolor in reprehenderit in voluptate velit
						esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
						occaecat cupidatat non proident, sunt in culpa qui officia
						deserunt mollit occaecat cupidatat non id est laborum.</p>
				</div>
				<div class="col-md-4 col-sm-4">
					<!-- Heading -->
					<h3>
						<i class="fa fa-home color"></i> &nbsp;Where are we?
					</h3>
					<!-- Paragraph -->
					<p>Duis aute irure dolor in reprehenderit in voluptate velit
						esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
						occaecat cupidatat non proident, sunt in culpa qui officia
						deserunt mollit occaecat cupidatat non id est laborum.</p>
				</div>
			</div>
		</div>
		<!--/.container-->
	</section>
	<footer class="page-section">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-6 about">
					<a href="#" class="logoDark"><h4>WebThemez</h4></a>
					<p>Lorem ipsum dolor amet, consectetur adipiscing elit. Aenean
						leo lectus sollicitudin convallis eget libero. Aliquam laoreet
						tellus ut libero semper, egestas velit malesuada. Sed non risus
						eget dolor amet vestibulum ullamcorper. Integer feugiat molestie.</p>
					<ul class="socialIcons">
						<li><a href="#" class="fbIcon" target="_blank"><i
								class="fa fa-facebook-square fa-lg"></i></a></li>
						<li><a href="#" class="twitterIcon" target="_blank"><i
								class="fa fa-twitter-square fa-lg"></i></a></li>
						<li><a href="#" class="googleIcon" target="_blank"><i
								class="fa fa-google-plus-square fa-lg"></i></a></li>
						<li><a href="#" class="pinterest" target="_blank"><i
								class="fa fa-pinterest-square fa-lg"></i></a></li>
					</ul>
				</div>
				<div class="col-md-4 col-sm-6 twitter">
					<h4>Latest Tweets</h4>
					<ul>
						<li><a href="#">@John Doe</a> Lorem ipsum dolor amet,
							consectetur adipiscing elit. Aenean leo lectus sollicitudin eget
							libero.<br> <span>2 minutes ago</span></li>
						<li><a href="#">@John Doe</a> Lorem ipsum dolor amet,
							consectetur adipiscing elit. Aenean leo lectus sollicitudin eget
							libero.<br> <span>About an hour ago</span></li>
					</ul>
				</div>
				<div class="col-md-4 contact">
					<h4>Contact Info</h4>
					<p>Lorem ipsum dolor amet, consectetur adipiscing ipsum dolor.</p>
					<ul>
						<li><i class="fa fa-phone"></i>1-123-345-6789</li>
						<li><a href="#"><i class="fa fa-envelope-o"></i>
								contact@webthemez.com</a></li>
						<li><i class="fa fa-flag"></i>123 Smith Drive, Baltimore, MD
							21212</li>
					</ul>
				</div>
			</div>
			<!-- END Row -->
		</div>
	</footer>
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
	<script src="${path}/contact/jqBootstrapValidation.js"></script>
	<script src="${path}/contact/contact_me.js"></script>
	<script src="${path}/js/custom.js" type="text/javascript"></script>
</body>
</html>