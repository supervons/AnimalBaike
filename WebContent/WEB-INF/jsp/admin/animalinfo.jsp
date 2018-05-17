<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.animal.model.Login,com.animal.model.AnimalInfo,java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>动物百科-登陆</title>
<c:set value="${pageContext.request.contextPath}" var="path"
	scope="page" />
<link rel="stylesheet" href="${path}/css/reset.css" />
<link rel="stylesheet" href="${path}/css/login.css" />
<link rel="stylesheet" href="${path}/css/bootstrap-theme.css" />
<link rel="stylesheet" href="${path}/css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="${path}/css/bootstrap.css" />
<!-- Bootstrap Styles-->
<link href="${path}/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="${path}/assets/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="${path}/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="${path}/assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
</head>

<body>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"><strong>动物百科-动物管理</strong></a>
				
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side text-center" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a  href="${path}/Navigation/goApprovalAnimal">动物审批</a>
                    </li>

<!--                     <li> -->
<%--                         <a class="active-menu" href="${path}/Navigation/goAnimalInfoManage">动物信息管理</a> --%>
<!--                     </li> -->

                    <li>
                        <a href="${path}/Navigation/goUserManage">用户管理</a>
                    </li>

                    <li>
                        <a href="${path}/Navigation/goSendMsg">发送公告</a>
                    </li>
                    

                    <li>
                        <a href="${path}/Navigation/goSignOut">修改密码</a>
                    </li>

                    <li>
                        <a href="${path}/Navigation/goSignOut">退出登陆</a>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
      
		<div id="page-wrapper">
		 <div class="header"> 
                        <h1 class="page-header">
                        	动物数据
                        </h1>
									
		</div>
		<%

AnimalInfo animalInfo = new AnimalInfo();
ArrayList<AnimalInfo> animalListInfoAdmin =  (ArrayList<AnimalInfo>) session.getAttribute("animalListInfoAdmin");
if(animalListInfoAdmin != null){
%>
				<table align="center" id="animalTable" class="table table-hover text-center" style="width:90%;background-color: #ffffff;margin-left:5%;">
					<thead>
						<tr>
							<th>动物类别</th>
							<th>动物名称</th>
							<th>英文名</th>
							<th>所属地区</th>
							<th>上传用户</th>
							<th>描述</th>
							<th>图片</th>
							<th>音频</th>
							<th>视频</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<%for(int i =0;i<animalListInfoAdmin.size();i++){ %>
						<tr>
							<td><%=animalListInfoAdmin.get(i).getAnimalType()%></td>
							<td><%=animalListInfoAdmin.get(i).getAnimalName()%></td>
							<td><%=animalListInfoAdmin.get(i).getAnimalEnglishName()%></td>
							<td><%=animalListInfoAdmin.get(i).getAnimalRegion()%></td>
							<td><%=animalListInfoAdmin.get(i).getAnimalUploadUser()%></td>
							<td><input type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal<%=i%>" value="查看描述"></td>
							<td><input type="button" class="btn btn-default" data-toggle="modal" data-target="#imagModel<%=i%>" value="查看图片"></td>
							<td><audio controls="controls" height="100" width="60">
									<source src="${path}/upload/<%=animalListInfoAdmin.get(i).getAnimalSoundId()%>.mp3"  type="audio/mp3" />
									<source src="${path}/upload/<%=animalListInfoAdmin.get(i).getAnimalSoundId()%>.ogg" type="audio/ogg" />
									<source src="${path}/upload/<%=animalListInfoAdmin.get(i).getAnimalSoundId()%>.flac" type="audio/flac" />
									<embed height="100" width="100" src="${path}/upload/<%=animalInfo.getAnimalSoundId()%>.mp3" />
								</audio></td>
							<td>
							<input type="button" class="btn btn-default" onclick="Agree('<%=animalListInfoAdmin.get(i).getAnimalId()%>')" value="同意">
							<input type="button" class="btn btn-default" onclick="DisAgree('<%=animalListInfoAdmin.get(i).getAnimalId()%>')" value="否决">
							</td>
						</tr>
				<div class="modal fade" id="myModal<%=i%>"  tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" style="margin-right:88%">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">动物【<%=animalListInfoAdmin.get(i).getAnimalName()%>】描述</h4>
								</div>
								<div class="modal-body"><%=animalListInfoAdmin.get(i).getAnimalDetails()==""?"用户没有添加描述":animalListInfoAdmin.get(i).getAnimalDetails()%></div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					
					<div class="modal fade text-center " style="padding-top:15%" id="imagModel<%=i%>"  tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<img data-src="${path}/upload/<%=animalListInfoAdmin.get(i).getAnimalFileId()%>.jpg" style="width:600px" alt="First slide"
						src="${path}/upload/<%=animalListInfoAdmin.get(i).getAnimalFileId()%>.jpg" />
					</div>
					<!-- /.modal -->	
					<%}} %>
					</tbody>
				</table></section>
            <div id="page-inner">
	
		<div class="row">

				</div>
		</div>
        </div>
    </div>
    <script src="${path}/assets/js/jquery-1.10.2.js"></script>
    <!-- Bootstrap Js -->
    <script src="${path}/assets/js/bootstrap.min.js"></script>
	 
    <!-- Metis Menu Js -->
    <script src="${path}/assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="${path}/assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="${path}/assets/js/morris/morris.js"></script>
	
	
	<script src="${path}/assets/js/easypiechart.js"></script>
	<script src="${path}/assets/js/easypiechart-data.js"></script>
	
	 <script src="${path}/assets/js/Lightweight-Chart/jquery.chart.js"></script>
	
    <!-- Custom Js -->
    <script src="${path}/assets/js/custom-scripts.js"></script>

      <script>
    
      </script>

</body>

</html>