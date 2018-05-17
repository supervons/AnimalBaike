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
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
                <a class="navbar-brand" href="#"><strong>动物百科-动物审批</strong></a>
				
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side text-center" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu" href="${path}/Navigation/goApprovalAnimal">动物审批</a>
                    </li>

<!--                     <li> -->
<%--                         <a href="${path}/Navigation/goAnimalInfoManage">动物信息管理</a> --%>
<!--                     </li> -->

                    <li>
                        <a href="${path}/Navigation/goUserManage">用户管理</a>
                    </li>

                    <li>
                        <a href="${path}/Navigation/goSendMsg">发送公告</a>
                    </li>
                    

                    <li>
                        <a href="#" onclick="window.open('${path}/Login/changePassword/','_blank','location=no,scrollbars=0,resizable=0,width=450px,height=300px,left=450,top=200;');">修改密码</a>
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
                        	待您审核的动物数据
                        </h1>
									
		</div>
		<%

AnimalInfo animalInfo = new AnimalInfo();
ArrayList<AnimalInfo> animalListInfoStatus02 =  (ArrayList<AnimalInfo>) session.getAttribute("animalListInfoStatus02");
if(animalListInfoStatus02 != null){
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
					<%for(int i =0;i<animalListInfoStatus02.size();i++){ %>
						<tr>
							<td><%=animalListInfoStatus02.get(i).getAnimalType()%></td>
							<td><%=animalListInfoStatus02.get(i).getAnimalName()%></td>
							<td><%=animalListInfoStatus02.get(i).getAnimalEnglishName()%></td>
							<td><%=animalListInfoStatus02.get(i).getAnimalRegion()%></td>
							<td><%=animalListInfoStatus02.get(i).getAnimalUploadUser()%></td>
							<td><input type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal<%=i%>" value="查看描述"></td>
							<td><input type="button" class="btn btn-default" data-toggle="modal" data-target="#imagModel<%=i%>" value="查看图片"></td>
							<td><input type="button" class="btn btn-default" data-toggle="modal" data-target="#soundModel<%=i%>" value="查看音频"></td>
							<td><input type="button" class="btn btn-default" data-toggle="modal" data-target="#videoModel<%=i%>" value="查看视频"></td>
							<td>
							<input type="button" class="btn btn-default" onclick="Agree('<%=animalListInfoStatus02.get(i).getAnimalId()%>')" value="同意">
							<input type="button" class="btn btn-default" onclick="DisAgree('<%=animalListInfoStatus02.get(i).getAnimalId()%>')" value="否决">
							</td>
						</tr>
				<div class="modal fade  text-center" id="myModal<%=i%>" style="padding-top:15%" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
<!-- 						<div class="modal-dialog" style="margin-right:88%"> -->
<!-- 							<div class="modal-content"> -->
<!-- 								<div class="modal-header"> -->
<!-- 									<button type="button" class="close" data-dismiss="modal" -->
<!-- 										aria-hidden="true">×</button> -->
<%-- 									<h4 class="modal-title" id="myModalLabel">动物【<%=animalListInfoStatus02.get(i).getAnimalName()%>】描述</h4> --%>
<!-- 								</div> -->
<%-- 								<div class="modal-body"><%=animalListInfoStatus02.get(i).getAnimalDetails()==""?"用户没有添加描述":animalListInfoStatus02.get(i).getAnimalDetails()%></div> --%>
<!-- 								<div class="modal-footer"> -->
<!-- 									<button type="button" class="btn btn-default" -->
<!-- 										data-dismiss="modal">关闭</button> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- <!-- 							/.modal-content --> -->
<!-- 						</div> -->
							<div style="width:600px;height:300px;margin-left:30%;box-shadow: 10px 10px 5px #000000;background-color: #ffffff">
							<h4 class="modal-title text-left" id="myModalLabel">动物【<%=animalListInfoStatus02.get(i).getAnimalName()%>】描述:</h4>
							<div class="modal-body text-left"><%=animalListInfoStatus02.get(i).getAnimalDetails()==""?"用户没有添加描述":animalListInfoStatus02.get(i).getAnimalDetails()%></div> 
							</div>
						<!-- /.modal-dialog -->
					</div>
					
					<div class="modal fade text-center " style="padding-top:15%;" id="imagModel<%=i%>"  tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<img data-src="${path}/upload/<%=animalListInfoStatus02.get(i).getAnimalFileId()%>.jpg" style="box-shadow: 10px 10px 5px #000000;width:600px" alt="First slide"
						src="${path}/upload/<%=animalListInfoStatus02.get(i).getAnimalFileId()%>.jpg" />
					</div>
					
					<div class="modal fade text-center " style="padding-top:15%;" id="soundModel<%=i%>"  tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<audio controls="controls" width="30px">
									<source src="${path}/upload/<%=animalListInfoStatus02.get(i).getAnimalSoundId()%>.mp3"  type="audio/mp3" />
									<source src="${path}/upload/<%=animalListInfoStatus02.get(i).getAnimalSoundId()%>.ogg" type="audio/ogg" />
									<source src="${path}/upload/<%=animalListInfoStatus02.get(i).getAnimalSoundId()%>.flac" type="audio/flac" />
									<embed height="100" width="100" src="${path}/upload/<%=animalInfo.getAnimalSoundId()%>.mp3" />
								</audio>
					</div>
					<div class="modal fade text-center " style="padding-top:15%;" id="videoModel<%=i%>"  tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<video width="320" height="240" style="margin:0 auto" controls="controls">
							<source src="${path}/upload/<%=animalListInfoStatus02.get(i).getAnimalVideoId()%>.mp4" type="video/mp4" />
							<source src="${path}/upload/<%=animalListInfoStatus02.get(i).getAnimalVideoId()%>.ogg" type="video/ogg" />
							<source src="${path}/upload/<%=animalListInfoStatus02.get(i).getAnimalVideoId()%>.webm" type="video/webm" />
							<source src="${path}/upload/<%=animalListInfoStatus02.get(i).getAnimalVideoId()%>.wmv" type="video/wmv" />
							<object src="${path}/upload/<%=animalListInfoStatus02.get(i).getAnimalVideoId()%>.wmv" width="320" height="240">
								<embed src="movie.swf" width="320" height="240" />
							</object>
						</video>
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
	<script src="${path}/js/jquery.nav.js" type="text/javascript"></script>
	<script src="${path}/js/jquery.cslider.js" type="text/javascript"></script>
	<script src="${path}/js/Common.js" type="text/javascript"></script>
	
    <!-- Custom Js -->
    <script src="${path}/assets/js/custom-scripts.js"></script>

      <script>
	var pathName = document.location.pathname;
	var index = pathName.substr(1).indexOf("/");
	var result = pathName.substr(0, index + 1);
	 $(function(){
	            $("#mymodal").modal("toggle");      
	        });
      function Agree(animalId){
    	  if(confirm("确定通过吗？")){
    		  $.ajax({
    	  			url : result + "/AnimalController/agreeAnimal/",
    	  			data : {
    	  				animalId:animalId,
    	  			},
    	  			type : "POST",
    	  			success : function(re) {
    					alert("已同意!");
    					location.reload();
    	  			}
    	  		});      
    	  }
  			
      }
      function DisAgree(animalId){
    	  if(confirm("确定否决吗？")){
    		  $.ajax({
      			url : result + "/AnimalController/disAgreeAnimal/",
      			data : {
      				animalId:animalId,
      			},
      			type : "POST",
      			success : function(re) {
    				alert("已否决!");
    				location.reload();
      			}
      		});  
    	  }
    		    	
        }
      </script>

</body>

</html>