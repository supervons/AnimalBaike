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
<script>
function goToAnimalInfo(animalId){
	window.location.href=result + "/Navigation/goToDiscoverAnimalInfo?animalId="+animalId;
}
</script>
</head>

<body >
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
				<h2 style="color:#ffffff">请输入想要查询的动物</h2>
				<form action="${path}/AnimalController/seachAnimal/" method="POST">
					<input type="text" id="seachWord" name="seachWord"  class="seachWord" style="font-size:25px;height:45px">
					<input class="btn btn-default" style="font-size:25px; height:40px;margin-bottom:10px" type="submit" id="seachBtn" name="seachBtn" value="搜一下" /></li>
					</ul>
				</form>
			</div>
			<div class="row">
<%

AnimalInfo animalInfo = new AnimalInfo();
ArrayList<AnimalInfo> listAnimalInfo =  (ArrayList<AnimalInfo>) session.getAttribute("listAnimalInfo");
if(listAnimalInfo != null){
%>
				<table id="animalTable" class="table table-hover" style="background-color: #ffffff">
					<thead>
						<tr>
							<th>动物类别</th>
							<th>动物名称</th>
							<th>英文名</th>
							<th>所属地区</th>
						</tr>
					</thead>
					<tbody>
					<%for(int i =0;i<listAnimalInfo.size();i++){ %>
						<tr onclick="goToAnimalInfo('<%=listAnimalInfo.get(i).getAnimalId()%>')">
							<td><%=listAnimalInfo.get(i).getAnimalType()%></td>
							<td><%=listAnimalInfo.get(i).getAnimalName()%></td>
							<td><%=listAnimalInfo.get(i).getAnimalEnglishName()%></td>
							<td><%=listAnimalInfo.get(i).getAnimalRegion()%></td>
						</tr>
						<%}} %>
					</tbody>
				</table></section>
	<section class="blankOfDiscoverAnimal" style="margin-left:5%;margin-right:5%;" >
					<h3 id="guessYouLike" style="display:none">您可能还喜欢</h3>
					<table class="table table-bordered text-center text-justify">
					<tbody>
					<%
					Map<String,Integer> randomAnimalList = (Map<String,Integer>)session.getAttribute("randomAnimalList");
					if(randomAnimalList!=null && randomAnimalList.size()>0){%>
						<tr>
						<%if(randomAnimalList.size()<=5){%>
						<%for(String s:randomAnimalList.keySet()){ 	%>
							<td><a class = "btn btn-default" onclick="goToSeach('<%=s%>')"><%=s%></a></td>
						<%}%>
						</tr>
					<%}else{
						List<String> animalList = new ArrayList<String>();
						for(String s:randomAnimalList.keySet()){
							animalList.add(s);
						}
						for(int n = 0;n<2;n++){%>
							<tr>
							<% if(n==0){
								for(int i = 0;i<5;i++){%>
									<td><a class = "btn btn-default" onclick="goToSeach('<%=animalList.get(i)%>')"><%=animalList.get(i)%></a></td>
							<%
								}}
								else{
									for(int i = 5;i<animalList.size();i++){%>
									<td><a class = "btn btn-default" onclick="goToSeach('<%=animalList.get(i)%>')"><%=animalList.get(i)%></a></td>
										<%
									}
								}%>
								</tr>
							<%
							}}}%>
					
					</tbody>
					</table>
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
	
    $(function(){
        var userId = '<%=userId%>';
        if(userId == null || userId =="" || userId == undefined){
    		$("#signOut").hide();
        	$("#loginIn").show();
        }else{
        	$("#signOut").show();
        	$("#loginIn").hide();
        }
        
        var listAnimal = '<%=listAnimalInfo%>';
        if(listAnimal == null || listAnimal == undefined || listAnimal == "")
        	$("#animalTable").hide();
        //判断推荐session中是否有值，有的话，则显示您可能还喜欢
        var randomAnimalList = '<%=randomAnimalList%>';
        if(randomAnimalList != 'null')
            $("#guessYouLike").show();
    });
    
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