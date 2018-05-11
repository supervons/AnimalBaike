<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.animal.model.Login,java.util.*,com.animal.model.AnimalInfo"%>
<!doctype html>
<!--[if IE 7 ]>    <html lang="en-gb" class="isie ie7 oldie no-js"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en-gb" class="isie ie8 oldie no-js"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en-gb" class="isie ie9 no-js"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en-gb" class="no-js">
<!--<![endif]-->
<head>
<meta charset="UTF-8">
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
						<li><a href="${path}/Navigation/goToDiscoverAnimal" class="scroll-link">发现动物</a></li>
						<li class="active"><a href="${path}/Navigation/goToShareAnimal" class="scroll-link">分享动物</a></li>
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
	<section id="contactNature" class="page-section">
	</section>
	
	<section class="">
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
		<!-- /.modal -->
		<div id="animalBaseInfo" class="" style="padding:15px;background:url(${path}/images/BG/shareBG1.jpg);">
		<div class="container center"  style="width:60%; height:520px;background:url(${path}/images/BG/shareBG2.jpg);box-shadow: 10px 10px 5px #000000;">
		<%
		%>
<%-- 		<%=animalInfo.toString()%> --%>
		<form action="${path}/AnimalController/addNewAnimalInfo"  method="post" enctype="multipart/form-data">
				<table class="table " style="color:#ffffff;">
					<thead>
						<tr>
							<th class="text-center" colspan="2" style="font-size: 25px;" >
							分享动物
							</th>
						</tr>
					</thead>
					<tbody>
							<tr >
								<th class="text-right" style="font-size: 20px;">动物类别</th>
								<th class="text-left" style="font-size: 20px;">
								<input type="text" id="animalType" name="animalType"/></th>
							</tr>
							<tr >
								<th class="text-right" style="font-size: 20px;">动物名称</th>
								<th class="text-left" style="font-size: 20px;">
								<input type="text" id="animalName" name="animalName"/></th>
							</tr>
							<tr >
								<th class="text-right" style="font-size: 20px;">英文名</th>
								<th class="text-left" style="font-size: 20px;">
								<input type="text" id="animalEnglishName" name="animalEnglishName"/></th>
							</tr>
							<tr >
								<th class="text-right" style="font-size: 20px;">所属地区</th>
								<th class="text-left" style="font-size: 20px;">
								<input type="text" id="animalRegion" name="animalRegion"/></th>
							</tr>
							<tr >
								<th class="text-right" style="font-size: 20px;">物种描述</th>
								<th class="text-left" style="font-size: 20px;">
								<textarea class="form-control" rows="2" id="animalDetails" name="animalDetails"></textarea></th>
							</tr>
							<tr >
								<th class="text-right" style="font-size: 20px;">上传图片</th>
								<th class="text-left" style="font-size: 20px;">
								<input type="file" id="animalFileId" name="animalFileId"/></th>
							</tr>
							<tr >
								<th class="text-center" colspan="3" style="font-size: 20px;">
								<button type="submit" class="btn btn-default">提交</button>
								</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
		<section class="blank" id="blank" style="display:none">
		</section>
	<div id="animalBaseInfo" class="" style="padding:15px">
		<div class="container center"  style="width:60%; height:500px;">
				<table class="table " style="color:#000000;">
					<thead>
						<tr>
							<th class="text-center" colspan="5" style="font-size: 25px;" >
							我的分享列表
							</th>
						</tr>
						<tr>
							<th>动物类别</th>
							<th>动物名称</th>
							<th>英文名</th>
							<th>所属地区</th>
							<th>审核状态</th>
						</tr>
					</thead>
					
	<%
	ArrayList<AnimalInfo> animalInfoList = (ArrayList<AnimalInfo>) session.getAttribute("animalInfoList");
	if(animalInfoList != null){
	%>
					<tbody>
					
						<%for(int i =0;i<animalInfoList.size();i++){
							String status = animalInfoList.get(i).getAnimalStatus();
							String statusValue = "sss";
							if(status.equals("animalstatus01"))
								statusValue = "通过";
							else if(status.equals("animalstatus02"))
								statusValue = "待审核";
							else if(status.equals("animalstatus03"))
								statusValue = "未通过";
							else if(status.equals("animalstatus04"))
								statusValue = "作废";
							%>
						<tr onclick="goToAnimalInfo('<%=animalInfoList.get(i).getAnimalId()%>')">
							<td><%=animalInfoList.get(i).getAnimalType()%></td>
							<td><%=animalInfoList.get(i).getAnimalName()%></td>
							<td><%=animalInfoList.get(i).getAnimalEnglishName()%></td>
							<td><%=animalInfoList.get(i).getAnimalRegion()%></td>
							<td><%=statusValue%></td>
						</tr>
						<%}} %>
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
    $(function(){
        var userId = '<%=userId%>';
        if(userId == null || userId =="" || userId == undefined){
    		$("#signOut").hide();
        	$("#loginIn").show();
        }else{
        	$("#signOut").show();
        	$("#loginIn").hide();
        }
        var loginSession = '<%=loginSession%>';
        if(loginSession == null || loginSession =="" || loginSession == undefined || loginSession == 'null' ){
            $("#mymodal").modal("toggle");         	
        }
        });
</script>
</body>
</html>