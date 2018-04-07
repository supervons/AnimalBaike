<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

	<head>
		<meta charset="utf-8">

		<title>网上投票系统管理员后台</title>
		<c:set value="${pageContext.request.contextPath}" var="path" scope="page" />
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${path}/js/Calendar.js">
		</script>
		<!-- Bootstrap CSS -->
		<link href="${path}/css/bootstrap-theme.css" rel="stylesheet">
		<link href="${path}/css/elegant-icons-style.css" rel="stylesheet" />
		<link href="${path}/css/style.css" rel="stylesheet">
		<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
		<style>
			.text-right {
				color: #000000;
			}
		</style>

	</head>

	<body>
		<section id="container" class="">

			<header class="header dark-bg text-center">
				<h1>网上投票系统管理后台</h1>
			</header>

			<aside>
				<div id="sidebar" class="nav-collapse ">
					<!-- sidebar menu start-->
					<ul class="sidebar-menu">
						<li class="active">
							<a class="" href="${path}/Login/adminIndex">
								<i class="icon_house_alt"></i>
								<span>主页</span>
							</a>
						</li>
						<li class="sub-menu">
							<a href="javascript:;" class="">
								<i class="icon_document_alt"></i>
								<span>用户管理</span>
								<span class="menu-arrow arrow_carrot-right"></span>
							</a>
							<ul class="sub">
								<li>
									<a class="" href="${path}/Login/manageUser">查看用户信息</a>
								</li>
							</ul>
						</li>
						<li class="sub-menu">
							<a href="javascript:;" class="">
								<i class="icon_desktop"></i>
								<span>投票项目管理</span>
								<span class="menu-arrow arrow_carrot-right"></span>
							</a>
							<ul class="sub">
								<li>
									<a class="" href="${path}/Vote/goAddVote">添加新项目</a>
								</li>
								<li>
									<a class="" href="${path}/Vote/manageVote">查看项目信息</a>
								</li>							
								<li>
									<a class="" href="${path}/Vote/tempPK">即时PK</a>
								</li>
							</ul>
							<li>
								<a class="" href="#" onclick="window.open('${path}/Login/changePassword/','_blank','location=no,scrollbars=0,resizable=0,width=450px,height=300px,left=450,top=200;');">
									<i class="icon_genius"></i>
									<span>修改密码</span>

								</a>

							</li>

							<li>
								<a class="nav-link" href="${path}/Login/logOut/">
									<i class="icon_close"></i>
									<span>退出系统</span>

								</a>

							</li>

					</ul>
				</div>
			</aside>
			<section id="main-content" style="font-size: 18px;">
				<section class="wrapper">
					<div class="w-50 center-block mx-auto">
						<form action="${path}/Userchoice/addUserchoice/" method="post" onsubmit="return checkUser();">
							<input type="hidden" name="voteId" value="${vote.voteId}" /> <input type="hidden" name="userId" value="${usersession.userId}" />
							<div class="center-block">

								<table class="table table-bordered col-sm-8">
									<thead>
										<tr>
											<tr>
												<th>投票项目标题：</th>
												<td>${vote.voteTitle}<text></text></td>
											</tr>
											<tr>
												<th>详细说明：</th>
												<td>${vote.voteExplain}</td>
											</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2">所有选项：
											</td>
										</tr>
										<tr>
											<td>
												A:${vote.voteResultA}
											</td>
											<td>B:${vote.voteResultB}
											</td>
										</tr>
										<tr>
											<td>
												C:${vote.voteResultC}
											</td>
											<td>D:${vote.voteResultD}
											</td>
										</tr>
										<tr>
											<td id="sex" style="height:400px; width: 400px;" colspan="2">
											</td>
										</tr>
										<tr>
											<td id="result" style="height:400px; width: 400px;" colspan="2">
											</td>
										</tr>
									</tbody>
								</table>
						</form>
						</div>
					</div>
				</section>
			</section>
		</section>
		<script src="${path}/js/jquery.js"></script>
		<script src="${path}/js/jquery-1.8.3.min.js"></script>
		<script src="${path}/js/bootstrap.min.js"></script>
		<script src="${path}/js/jquery.nicescroll.js" type="text/javascript"></script>
		<script src="${path}/js/scripts.js"></script>
		<script type="text/javascript">
			// 路径配置
			require.config({
				paths: {
					echarts: 'http://echarts.baidu.com/build/dist'
				}
			});

			// 使用
			require(
				[
					'echarts',
					'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载,这里使用饼状图
				],
				function(ec) {
					// 基于准备好的dom，初始化echarts图表
					var myChart = ec.init(document.getElementById('sex'));
					//获取项目id
					var voteId = "<%=session.getAttribute("voteId")%>";
					//获取项目标题
					var voteTitle = "<%=session.getAttribute("voteTitle")%>";
					//获取男生人数
					var mans = "<%=session.getAttribute("mans")%>";
					//获取女生人数
					var women = "<%=session.getAttribute("women")%>";

					var option = {
						title: {
							text: voteId + '男女比例',
							subtext: '项目标题：' + voteTitle,
							x: 'center'
						},
						tooltip: {
							trigger: 'item',
							formatter: "{a} <br/>{b} : {c} ({d}%)"
						},
						legend: {
							orient: 'vertical',
							x: 'left',
							data: ['男', '女']
						},
						toolbox: {
							show: true,
							feature: {
								mark: {
									show: true
								},
								dataView: {
									show: true,
									readOnly: false
								},
								magicType: {
									show: true,
									type: ['pie', 'funnel'],
									option: {
										funnel: {
											x: '25%',
											width: '50%',
											funnelAlign: 'left',
											max: mans + women
										}
									}
								},
								restore: {
									show: true
								},
								saveAsImage: {
									show: true
								}
							}
						},
						calculable: true,
						series: [{
							name: '性别',
							type: 'pie',
							radius: '55%',
							center: ['50%', '60%'],
							data: [{
									value: mans,
									name: '男'
								},
								{
									value: women,
									name: '女'
								}
							]
						}]
					};

					// 为echarts对象加载数据 
					myChart.setOption(option);
				}
			);
		</script>
		<script type="text/javascript">
			// 路径配置
			require.config({
				paths: {
					echarts: 'http://echarts.baidu.com/build/dist'
				}
			});

			// 使用
			require(
				[
					'echarts',
					'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
				],
				function(ec) {
					// 基于准备好的dom，初始化echarts图表
					var myChart = ec.init(document.getElementById('result'));
					//获取项目id
					var voteId = "<%=session.getAttribute("voteId")%>";
					//获取项目标题
					var voteTitle = "<%=session.getAttribute("voteTitle")%>";
					
					//获取各项选择答案
					var resultA = "<%=session.getAttribute("resultA")%>";
					var resultB = "<%=session.getAttribute("resultB")%>";
					var resultC = "<%=session.getAttribute("resultC")%>";
					var resultD = "<%=session.getAttribute("resultD")%>";
					
					//获取各项选择的投票人数
					var choiceA = "<%=session.getAttribute("choiceA")%>";
					var choiceB = "<%=session.getAttribute("choiceB")%>";
					var choiceC = "<%=session.getAttribute("choiceC")%>";
					var choiceD = "<%=session.getAttribute("choiceD")%>";
					
					//获取男生人数
					var mans = "<%=session.getAttribute("mans")%>";
					//获取女生人数
					var women = "<%=session.getAttribute("women")%>";

					var option = {
						title: {
							text: voteId + '各选项比例',
							subtext: '项目标题：' + voteTitle,
							x: 'center'
						},
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient : 'vertical',
        x : 'left',
        data:[resultA,resultB,resultC,resultD]
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true, 
                type: ['pie', 'funnel'],
                option: {
                    funnel: {
                        x: '25%',
                        width: '50%',
                        funnelAlign: 'center',
                        max: 1548
                    }
                }
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [
        {
            name:'访问来源',
            type:'pie',
            radius : ['50%', '70%'],
            itemStyle : {
                normal : {
                    label : {
                        show : false
                    },
                    labelLine : {
                        show : false
                    }
                },
                emphasis : {
                    label : {
                        show : true,
                        position : 'center',
                        textStyle : {
                            fontSize : '30',
                            fontWeight : 'bold'
                        }
                    }
                }
            },
            data:[
                {value:choiceA, name:resultA},
                {value:choiceB, name:resultB},
                {value:choiceC, name:resultC},
                {value:choiceD, name:resultD}
            ]
        }
    ]
};

					// 为echarts对象加载数据 
					myChart.setOption(option);
				}
			);
		</script>
	</body>

</html>