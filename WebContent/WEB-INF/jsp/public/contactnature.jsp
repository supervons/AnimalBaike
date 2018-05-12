<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="${path}/css/styles.css" />
<!-- Font Awesome -->
<link href="${path}/fonts/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
body, html {
	width: 100%;
	height: 100%;
	margin: 0;
	font-family: "微软雅黑";
}

#allmap {
	width: 60%;
	height: 500px;
}

p {
	margin-left: 5px;
	font-size: 14px;
}
</style>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=AFgrK3VlR809lb4pVACHIMHwGdI5I0vA"></script>
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
					<a href="#" class="navbar-brand scroll-top logo"><b>动物百科</b>Animal BaiKe</a>
				</div>
				<!--/.navbar-header-->
				<div id="main-nav" class="collapse navbar-collapse">
					<ul class="nav navbar-nav" id="mainNav">
						<li><a href="${path}" class="scroll-link">首页</a></li>
						<li><a href="${path}/Navigation/goToDiscoverAnimal" class="scroll-link">发现动物</a></li>
						<li><a href="${path}/Navigation/goToShareAnimal" class="scroll-link">分享动物</a></li>
						<li class="active"><a href="${path}/Navigation/goToContactNature" class="scroll-link">亲近自然</a></li>
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
	<section id="contactNature"  class="page-section center" >
		<div style="margin-top:5%"  class="text-center">
			<input type="text" id="seachWord"  placeholder="探索附件的美景"/>
			<input type="button" class="btn btn-default" value="搜索" onclick="seach()"/>
			<p>推荐搜索：<a id="park" class="btn btn-default" onclick="changeSeach('公园')">公园</a>
			<a id="scenic" class="btn btn-default"  onclick="changeSeach('动物园')">动物园</a>
			<a id="wetland" class="btn btn-default"  onclick="changeSeach('湿地')">湿地</a>
			<a id="forest" class="btn btn-default"  onclick="changeSeach('森林')">森林</a>
			<a id="mountain" class="btn btn-default" onclick="changeSeach('山峰')">山峰</a>
			<a id="lake" class="btn btn-default"  onclick="changeSeach('湖泊')">湖泊</a></p>
		</div>
		<div id="allmap" style="margin-left:20%">
		</div>
		<div id="animalBaseInfo" style="padding:15px">
		<div class="container center" id="contactNature1" style="width:60%; height:500px;">
				<table class="table " style="color:#000000;">
					<thead>
						<tr>
							<th class="text-center" colspan="2" style="font-size: 25px;" >
							在线直播 ONLINE SHOW
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>
						 		
							</th>
						</tr>
					</tbody>
				</table>
			<div class="contact text-center">
				<embed align="middle" allowfullscreen="true" allowscriptaccess="always" height="400px" mode="transparent" quality="high" src="http://yy.com/s/1345859273/1345859273/yyscene.swf" type="application/x-shockwave-flash" width="70%"></embed>
			</div>
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
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
	var rPoint = "";//横坐标
	var lPoint = "";//纵坐标
    $(function(){
    	var map = new BMap.Map("allmap");
    	var point = new BMap.Point(116.331398,39.897445);
    	map.centerAndZoom(point,12);
    	var geolocation = new BMap.Geolocation();
    	geolocation.getCurrentPosition(function(r){
    		if(this.getStatus() == BMAP_STATUS_SUCCESS){
    			var mk = new BMap.Marker(r.point);
    			map.addOverlay(mk);
    			map.panTo(r.point);
    			rPoint = r.point.lng;
    				lPoint = r.point.lat;
    		}
    		else {
    			alert('failed'+this.getStatus());
    		}        
    	},{enableHighAccuracy: true});
        var userId = '<%=userId%>';
        if(userId == null || userId =="" || userId == undefined){
    		$("#signOut").hide();
        	$("#loginIn").show();
        	$("#blank").show();
        	$("#contactNature").hide();
        }else{
        	$("#signOut").show();
        	$("#loginIn").hide();
        	$("#blank").hide();
        	$("#contactNature").show();
        }
        var loginSession = '<%=loginSession%>';
        if(loginSession == null || loginSession =="" || loginSession == undefined || loginSession == 'null' ){
            $("#mymodal").modal("toggle");         	
        }
        });
    function seach(){
    	// 百度地图API功能
    	var map = new BMap.Map("allmap");          
    	map.centerAndZoom(new BMap.Point(rPoint, lPoint), 22);
    	var local = new BMap.LocalSearch(map, {
    		renderOptions:{map: map}
    	});
    	local.search($("#seachWord").val());
    }
    function changeSeach(word){
    	$("#seachWord").val(word);
    	seach();
    }
</script>
</body>
</html>