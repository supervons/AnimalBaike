<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.animal.model.Login" %>
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
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
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
						<li class="active"><a href="${path}" class="scroll-link">首页</a></li>
						<li><a href="${path}/Navigation/goToDiscoverAnimal" class="scroll-link">发现动物</a></li>
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
	<section id="home">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class=""></li>
				<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="2" class=""></li>
			</ol>
			<div class="carousel-inner">
				<div class="item">
					<img data-src="${path}/images/chess-2.jpg" alt="First slide"
						src="${path}/images/chess-2.jpg" />
					<div class="container">
						<div class="carousel-caption">
							<h1>梅 花 鹿</h1>
							<h3>森林中的精灵.</h3>
							<!--<p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>-->
						</div>
					</div>
				</div>
				<div class="item active">
					<img data-src="${path}/images/apple.jpg" alt="Second slide"
						src="${path}/images/apple.jpg">
					<div class="container">
						<div class="carousel-caption">
							<h1>猎 豹</h1>
							<h3>草原上的追风者.</h3>
							<!--<p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>-->
						</div>
					</div>
				</div>
				<div class="item">
					<img data-src="${path}/images/windmills.jpg" alt="Third slide"
						src="${path}/images/windmills.jpg">
					<div class="container">
						<div class="carousel-caption">
							<h1>考 拉</h1>
							<h3>静静的享受树上时光.</h3>
							<!--<p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>-->
						</div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
				class="glyphicon glyphicon-chevron-left"></span></a> <a
				class="right carousel-control" href="#myCarousel" data-slide="next"><span
				class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
	</section>
	<section id="portfolio" class="page-section section appear clearfix">
		<div class="container">

			<div class="heading text-center">
				<!-- Heading -->
				<h2>Portfolio</h2>
				<p>At lorem Ipsum available, but the majority have suffered
					alteration in some form by injected humour.</p>
			</div>

			<div class="row">
				<nav id="filter" class="col-md-12 text-center">
					<ul>
						<li><a href="#" class="current btn-theme btn-small"
							data-filter="*">All</a></li>
						<li><a href="#" class="btn-theme btn-small"
							data-filter=".webdesign">Web Design</a></li>
						<li><a href="#" class="btn-theme btn-small"
							data-filter=".photography">Photography</a></li>
						<li><a href="#" class="btn-theme btn-small"
							data-filter=".print">Print</a></li>
					</ul>
				</nav>
				<div class="col-md-12">
					<div class="row">
						<div class="portfolio-items isotopeWrapper clearfix" id="3">

							<article class="col-md-4 isotopeItem webdesign">
								<div class="portfolio-item">
									<img src="images/portfolio/img1.jpg" alt="" />
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<a href="images/portfolio/img1.jpg" class="fancybox"><h5>Project
													Name</h5> <i class="fa fa-plus-circle fa-2x"></i></a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem photography">
								<div class="portfolio-item">
									<img src="images/portfolio/img2.jpg" alt="" />
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<a href="images/portfolio/img2.jpg" class="fancybox"><h5>Project
													Name</h5> <i class="fa fa-plus-circle fa-2x"></i></a>
										</div>
									</div>
								</div>
							</article>


							<article class="col-md-4 isotopeItem photography">
								<div class="portfolio-item">
									<img src="images/portfolio/img3.jpg" alt="" />
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<a href="images/portfolio/img3.jpg" class="fancybox"><h5>Project
													Name</h5> <i class="fa fa-plus-circle fa-2x"></i></a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem print">
								<div class="portfolio-item">
									<img src="images/portfolio/img4.jpg" alt="" />
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<a href="images/portfolio/img4.jpg" class="fancybox"><h5>Project
													Name</h5> <i class="fa fa-plus-circle fa-2x"></i></a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem photography">
								<div class="portfolio-item">
									<img src="images/portfolio/img5.jpg" alt="" />
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<a href="images/portfolio/img5.jpg" class="fancybox"><h5>Project
													Name</h5> <i class="fa fa-plus-circle fa-2x"></i></a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem webdesign">
								<div class="portfolio-item">
									<img src="images/portfolio/img6.jpg" alt="" />
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<a href="images/portfolio/img6.jpg" class="fancybox"><h5>Project
													Name</h5> <i class="fa fa-plus-circle fa-2x"></i></a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem print">
								<div class="portfolio-item">
									<img src="images/portfolio/img7.jpg" alt="" />
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<a href="images/portfolio/img7.jpg" class="fancybox"><h5>Project
													Name</h5> <i class="fa fa-plus-circle fa-2x"></i></a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem photography">
								<div class="portfolio-item">
									<img src="images/portfolio/img8.jpg" alt="" />
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<a href="images/portfolio/img8.jpg" class="fancybox"><h5>Project
													Name</h5> <i class="fa fa-plus-circle fa-2x"></i></a>
										</div>
									</div>
								</div>
							</article>

							<article class="col-md-4 isotopeItem print">
								<div class="portfolio-item">
									<img src="images/portfolio/img9.jpg" alt="" />
									<div class="portfolio-desc align-center">
										<div class="folio-info">
											<a href="images/portfolio/img9.jpg" class="fancybox"><h5>Project
													Name</h5> <i class="fa fa-plus-circle fa-2x"></i></a>
										</div>
									</div>
								</div>
							</article>
						</div>

					</div>


				</div>
			</div>

		</div>
	</section>

	<section id="team" class="page-section">
		<div class="container">
			<div class="heading text-center">
				<!-- Heading -->
				<h2>Our Team</h2>
				<p>At variations of passages of Lorem Ipsum available, but the
					majority have suffered alteration..</p>
			</div>
			<!-- Team Member's Details -->
			<div class="team-content">
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-6">
						<!-- Team Member -->
						<div class="team-member pDark">
							<!-- Image Hover Block -->
							<div class="member-img">
								<!-- Image  -->
								<img class="img-responsive" src="images/photo-1.jpg" alt="">
							</div>
							<!-- Member Details -->
							<h3>John Doe</h3>
							<!-- Designation -->
							<span class="pos">CEO</span>
							<div class="team-socials">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-google-plus"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<!-- Team Member -->
						<div class="team-member pDark">
							<!-- Image Hover Block -->
							<div class="member-img">
								<!-- Image  -->
								<img class="img-responsive" src="images/photo-2.jpg" alt="">
							</div>
							<!-- Member Details -->
							<h3>Larry Doe</h3>
							<!-- Designation -->
							<span class="pos">Art Director</span>
							<div class="team-socials">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-google-plus"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<!-- Team Member -->
						<div class="team-member pDark">
							<!-- Image Hover Block -->
							<div class="member-img">
								<!-- Image  -->
								<img class="img-responsive" src="images/photo-3.jpg" alt="">
							</div>
							<!-- Member Details -->
							<h3>Ranith Kays</h3>
							<!-- Designation -->
							<span class="pos">Manager</span>
							<div class="team-socials">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-google-plus"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<!-- Team Member -->
						<div class="team-member pDark">
							<!-- Image Hover Block -->
							<div class="member-img">
								<!-- Image  -->
								<img class="img-responsive" src="images/photo-4.jpg" alt="">
							</div>
							<!-- Member Details -->
							<h3>Joan Ray</h3>
							<!-- Designation -->
							<span class="pos">Creative</span>
							<div class="team-socials">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-google-plus"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a>
							</div>
						</div>
					</div>
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
							libero.<br>
						<span>2 minutes ago</span></li>
						<li><a href="#">@John Doe</a> Lorem ipsum dolor amet,
							consectetur adipiscing elit. Aenean leo lectus sollicitudin eget
							libero.<br>
						<span>About an hour ago</span></li>
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
	<script src="${path}/js/jquery.cslider.js" type="text/javascript"></script
	<script src="${path}/js/custom.js" type="text/javascript"></script>>
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