<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<title>危运行业档案管理系统</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/cloud-admin.css'/>" >
	<link rel="stylesheet" type="text/css"  href="<c:url value='/resources/css/themes/default.css'/>" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="<c:url value='/resources/css/responsive.css'/>" >
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">
	
	<style type="text/css">
		h1,h2,h3,h4,h5,h6,a{
	 		font-family: "微软雅黑" !important;
	 	}
        td.zhankai {
            background: url("<c:url value='/resources/img/details_open.png'/>") no-repeat center center;
            cursor: pointer;
        }

        tr.shown td.zhankai {
            background: url("<c:url value='/resources/img/details_close.png'/>") no-repeat center center;
        }
        body{
			font-family: "微软雅黑";
		}
    </style>
</head>
<body>

	<header class="navbar clearfix" id="header">
		<div class="container">
			<div class="navbar-brand">
				<!-- COMPANY LOGO -->
				<a href="index.html">
					<span style="color:white;font-family:'微软雅黑';font-size:20px;margin-left:20%;">决策指挥</span>
				</a>
				<!-- /COMPANY LOGO -->
				<!-- TEAM STATUS FOR MOBILE -->
				<div class="visible-xs">
					<a href="#" class="team-status-toggle switcher btn dropdown-toggle">
						<i class="fa fa-users"></i>
					</a>
				</div>
				<!-- /TEAM STATUS FOR MOBILE -->
				<!-- SIDEBAR COLLAPSE -->
				<div id="sidebar-collapse" class="sidebar-collapse btn">
					<i class="fa fa-bars" 
						data-icon1="fa fa-bars" 
						data-icon2="fa fa-bars" ></i>
				</div>
				<!-- /SIDEBAR COLLAPSE -->
			</div>
				<!-- NAVBAR LEFT -->
			<ul class="nav navbar-nav pull-left hidden-xs" id="navbar-left">
				<li class="dropdown">
					<a href="#" class=" dropdown-toggle tip-bottom" data-toggle="tooltip" title="科室状态" >
						<i class="fa fa-users"></i>
						<span class="name">科室状态</span>
						<i class="fa fa-angle-down"></i>
					</a>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
						<span class="name">界面风格</span>
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu skins">
						<li class="dropdown-title">
							<span><i class="fa fa-leaf"></i> 风格</span>
						</li>
						<li><a href="#" data-skin="default">微妙（默认）</a></li>
						<li><a href="#" data-skin="night">夜色</a></li>
						<li><a href="#" data-skin="earth">纯谱</a></li>
						<li><a href="#" data-skin="utopia">乌托邦</a></li>
						<li><a href="#" data-skin="nature">自然</a></li>
						<li><a href="#" data-skin="graphite">墨黑</a></li>
					 </ul>
				</li>
			</ul>
				<!-- /NAVBAR LEFT -->
				<!-- BEGIN TOP NAVIGATION MENU -->					
			<ul class="nav navbar-nav pull-right">
				<!-- BEGIN NOTIFICATION DROPDOWN -->	
				<li class="dropdown" id="header-notification">
					<a href="#" class="dropdown-toggle" >
						<i class="fa fa-bell"></i>
						<!-- <span class="badge">7</span>	 -->					
					</a>
					<ul class="dropdown-menu notification">
						<li class="dropdown-title">
							<span><i class="fa fa-bell"></i>7条通知</span>
						</li>
						<li>
							<a href="#">
								<span class="label label-success"><i class="fa fa-user"></i></span>
								<span class="body">
									<span class="message">5 users online. </span>
									<span class="time">
										<i class="fa fa-clock-o"></i>
										<span>Just now</span>
									</span>
								</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="label label-primary"><i class="fa fa-comment"></i></span>
								<span class="body">
									<span class="message">Martin commented.</span>
									<span class="time">
										<i class="fa fa-clock-o"></i>
										<span>19 mins</span>
									</span>
								</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="label label-warning"><i class="fa fa-lock"></i></span>
								<span class="body">
									<span class="message">DW1 server locked.</span>
									<span class="time">
										<i class="fa fa-clock-o"></i>
										<span>32 mins</span>
									</span>
								</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="label label-info"><i class="fa fa-twitter"></i></span>
								<span class="body">
									<span class="message">Twitter connected.</span>
									<span class="time">
										<i class="fa fa-clock-o"></i>
										<span>55 mins</span>
									</span>
								</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="label label-danger"><i class="fa fa-heart"></i></span>
								<span class="body">
									<span class="message">Jane liked. </span>
									<span class="time">
										<i class="fa fa-clock-o"></i>
										<span>2 hrs</span>
									</span>
								</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="label label-warning"><i class="fa fa-exclamation-triangle"></i></span>
								<span class="body">
									<span class="message">Database overload.</span>
									<span class="time">
										<i class="fa fa-clock-o"></i>
										<span>6 hrs</span>
									</span>
								</span>
							</a>
						</li>
						<li class="footer">
							<a href="#">See all notifications <i class="fa fa-arrow-circle-right"></i></a>
						</li>
					</ul>
				</li>
				<!-- END NOTIFICATION DROPDOWN -->
				<!-- BEGIN INBOX DROPDOWN -->
				<li class="dropdown" id="header-message">
					<a href="#" class="dropdown-toggle">
					<i class="fa fa-envelope"></i>
					<!-- <span class="badge">3</span> -->
					</a>
					<ul class="dropdown-menu inbox">
						<li class="dropdown-title">
							<span><i class="fa fa-envelope-o"></i> 3 Messages</span>
							<span class="compose pull-right tip-right" title="Compose message"><i class="fa fa-pencil-square-o"></i></span>
						</li>
						<li>
							<a href="#">
								<img src="<c:url value='/resources/img/avatars/avatar2.png'/>" alt="" />
								<span class="body">
									<span class="from">Jane Doe</span>
									<span class="message">
									Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse mole ...
									</span> 
									<span class="time">
										<i class="fa fa-clock-o"></i>
										<span>Just Now</span>
									</span>
								</span>
								 
							</a>
						</li>
						<li>
							<a href="#">
								<img src="<c:url value='/resources/img/avatars/avatar1.png'/>" alt="" />
								<span class="body">
									<span class="from">Vince Pelt</span>
									<span class="message">
									Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse mole ...
									</span> 
									<span class="time">
										<i class="fa fa-clock-o"></i>
										<span>15 min ago</span>
									</span>
								</span>
								 
							</a>
						</li>
						<li>
							<a href="#">
								<img src="<c:url value='/resources/img/avatars/avatar8.png'/>" alt="" />
								<span class="body">
									<span class="from">宋宇</span>
									<span class="message">
									Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse mole ...
									</span> 
									<span class="time">
										<i class="fa fa-clock-o"></i>
										<span>2 hours ago</span>
									</span>
								</span>
								 
							</a>
						</li>
						<li class="footer">
							<a href="#">See all messages <i class="fa fa-arrow-circle-right"></i></a>
						</li>
					</ul>
				</li>
				<!-- END INBOX DROPDOWN -->
				<!-- BEGIN TODO DROPDOWN -->
				<li class="dropdown" id="header-tasks">
					<a href="#" class="dropdown-toggle" >
					<i class="fa fa-tasks"></i>
					<!-- <span class="badge">3</span> -->
					</a>
					<ul class="dropdown-menu tasks">
						<li class="dropdown-title">
							<span><i class="fa fa-check"></i> 6 tasks in progress</span>
						</li>
						<li>
							<a href="#">
								<span class="header clearfix">
									<span class="pull-left">Software Update</span>
									<span class="pull-right">60%</span>
								</span>
								<div class="progress">
								  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
									<span class="sr-only">60% Complete</span>
								  </div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="header clearfix">
									<span class="pull-left">Software Update</span>
									<span class="pull-right">25%</span>
								</span>
								<div class="progress">
								  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%;">
									<span class="sr-only">25% Complete</span>
								  </div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="header clearfix">
									<span class="pull-left">Software Update</span>
									<span class="pull-right">40%</span>
								</span>
								<div class="progress progress-striped">
								  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
									<span class="sr-only">40% Complete</span>
								  </div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="header clearfix">
									<span class="pull-left">Software Update</span>
									<span class="pull-right">70%</span>
								</span>
								<div class="progress progress-striped active">
								  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;">
									<span class="sr-only">70% Complete</span>
								  </div>
								</div>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="header clearfix">
									<span class="pull-left">Software Update</span>
									<span class="pull-right">65%</span>
								</span>
								<div class="progress">
								  <div class="progress-bar progress-bar-success" style="width: 35%">
									<span class="sr-only">35% Complete (success)</span>
								  </div>
								  <div class="progress-bar progress-bar-warning" style="width: 20%">
									<span class="sr-only">20% Complete (warning)</span>
								  </div>
								  <div class="progress-bar progress-bar-danger" style="width: 10%">
									<span class="sr-only">10% Complete (danger)</span>
								  </div>
								</div>
							</a>
						</li>
						<li class="footer">
							<a href="#">See all tasks <i class="fa fa-arrow-circle-right"></i></a>
						</li>
					</ul>
				</li>
				<!-- END TODO DROPDOWN -->
				<!-- BEGIN USER LOGIN DROPDOWN -->
				<li class="dropdown user" id="header-user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img alt="" src="<c:url value='/resources/img/avatars/avatar5.png'/>" />
						<span class="username">${sessionScope.userContext.cName}</span>
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
						<!-- <li><a href="#"><i class="fa fa-user"></i> 个人资料</a></li>
						<li><a href="#"><i class="fa fa-cog"></i> 修改密码</a></li>
						<li><a href="#"><i class="fa fa-eye"></i> 隐私设置</a></li> -->
						<li><a href="${ctx}/sys/login"><i class="fa fa-power-off"></i> 退出</a></li>
					</ul>
				</li>
				<!-- END USER LOGIN DROPDOWN -->
			</ul>
				<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- TEAM STATUS -->
		<div class="container team-status" id="team-status">
		  <div id="scrollbar">
			<div class="handle">
			</div>
		  </div>
		  <div id="teamslider">
			  <ul class="team-list">
				<li class="current">
				  <a href="javascript:void(0);">
				  <span class="image">
					  <img src="<c:url value='/resources/img/avatars/avatar5.png'/>" alt="" />
				  </span>
				  <span class="name">
					吴湛城
				  </span>
					<div class="progress">
					  <div class="progress-bar progress-bar-success" style="width: 35%">
						<span class="sr-only">35% Complete (success)</span>
					  </div>
					  <div class="progress-bar progress-bar-warning" style="width: 20%">
						<span class="sr-only">20% Complete (warning)</span>
					  </div>
					  <div class="progress-bar progress-bar-danger" style="width: 10%">
						<span class="sr-only">10% Complete (danger)</span>
					  </div>
					</div>
					<span class="status">
						<div class="field">
							<span class="badge badge-green">6</span> 任务已完成
							<span class="pull-right fa fa-check"></span>
						</div>
						<div class="field">
							<span class="badge badge-orange">3</span> 任务进行中
							<span class="pull-right fa fa-adjust"></span>
						</div>
						<div class="field">
							<span class="badge badge-red">1</span> 任务被挂起
							<span class="pull-right fa fa-list-ul"></span>
						</div>
				    </span>
				  </a>
				</li>
				<li>
				  <a href="javascript:void(0);">
				  <span class="image">
					  <img src="<c:url value='/resources/img/avatars/avatar4.png'/>" alt="" />
				  </span>
				  <span class="name">
					杨珺
				  </span>
					<div class="progress">
					  <div class="progress-bar progress-bar-success" style="width: 15%">
						<span class="sr-only">35% Complete (success)</span>
					  </div>
					  <div class="progress-bar progress-bar-warning" style="width: 40%">
						<span class="sr-only">20% Complete (warning)</span>
					  </div>
					  <div class="progress-bar progress-bar-danger" style="width: 20%">
						<span class="sr-only">10% Complete (danger)</span>
					  </div>
					</div>
					<span class="status">
						<div class="field">
							<span class="badge badge-green">2</span> 任务已完成
							<span class="pull-right fa fa-check"></span>
						</div>
						<div class="field">
							<span class="badge badge-orange">8</span> 任务进行中
							<span class="pull-right fa fa-adjust"></span>
						</div>
						<div class="field">
							<span class="badge badge-red">4</span> 任务被挂起
							<span class="pull-right fa fa-list-ul"></span>
						</div>
				    </span>
				  </a>
				</li>
				<li>
				  <a href="javascript:void(0);">
				  <span class="image">
					  <img src="<c:url value='/resources/img/avatars/avatar1.png'/>" alt="" />
				  </span>
				  <span class="name">
					柏成才
				  </span>
					<div class="progress">
					  <div class="progress-bar progress-bar-success" style="width: 65%">
						<span class="sr-only">35% Complete (success)</span>
					  </div>
					  <div class="progress-bar progress-bar-warning" style="width: 10%">
						<span class="sr-only">20% Complete (warning)</span>
					  </div>
					  <div class="progress-bar progress-bar-danger" style="width: 15%">
						<span class="sr-only">10% Complete (danger)</span>
					  </div>
					</div>
					<span class="status">
						<div class="field">
							<span class="badge badge-green">10</span> 任务已完成
							<span class="pull-right fa fa-check"></span>
						</div>
						<div class="field">
							<span class="badge badge-orange">3</span> 任务进行中
							<span class="pull-right fa fa-adjust"></span>
						</div>
						<div class="field">
							<span class="badge badge-red">4</span> 任务被挂起
							<span class="pull-right fa fa-list-ul"></span>
						</div>
				    </span>
				  </a>
				</li>
				<li>
				  <a href="javascript:void(0);">
				  <span class="image">
					  <img src="<c:url value='/resources/img/avatars/avatar3.png'/>" alt="" />
				  </span>
				  <span class="name">
					冯源生
				  </span>
					<div class="progress">
					  <div class="progress-bar progress-bar-success" style="width: 5%">
						<span class="sr-only">35% Complete (success)</span>
					  </div>
					  <div class="progress-bar progress-bar-warning" style="width: 48%">
						<span class="sr-only">20% Complete (warning)</span>
					  </div>
					  <div class="progress-bar progress-bar-danger" style="width: 27%">
						<span class="sr-only">10% Complete (danger)</span>
					  </div>
					</div>
					<span class="status">
						<div class="field">
							<span class="badge badge-green">1</span> 任务已完成
							<span class="pull-right fa fa-check"></span>
						</div>
						<div class="field">
							<span class="badge badge-orange">6</span> 任务进行中
							<span class="pull-right fa fa-adjust"></span>
						</div>
						<div class="field">
							<span class="badge badge-red">2</span> 任务被挂起
							<span class="pull-right fa fa-list-ul"></span>
						</div>
				    </span>
				  </a>
				</li>
				<li>
				  <a href="javascript:void(0);">
				  <span class="image">
					  <img src="<c:url value='/resources/img/avatars/avatar2.png'/>" alt="" />
				  </span>
				  <span class="name">
					冯燕梅
				  </span>
					<div class="progress">
					  <div class="progress-bar progress-bar-success" style="width: 21%">
						<span class="sr-only">35% Complete (success)</span>
					  </div>
					  <div class="progress-bar progress-bar-warning" style="width: 20%">
						<span class="sr-only">20% Complete (warning)</span>
					  </div>
					  <div class="progress-bar progress-bar-danger" style="width: 40%">
						<span class="sr-only">10% Complete (danger)</span>
					  </div>
					</div>
					<span class="status">
						<div class="field">
							<span class="badge badge-green">4</span> 任务已完成
							<span class="pull-right fa fa-check"></span>
						</div>
						<div class="field">
							<span class="badge badge-orange">5</span> 任务进行中
							<span class="pull-right fa fa-adjust"></span>
						</div>
						<div class="field">
							<span class="badge badge-red">9</span> 任务被挂起
							<span class="pull-right fa fa-list-ul"></span>
						</div>
				    </span>
				  </a>
				</li>
				<li>
				  <a href="javascript:void(0);">
				  <span class="image">
					  <img src="<c:url value='/resources/img/avatars/avatar6.png'/>" alt="" />
				  </span>
				  <span class="name">
					翁国铟
				  </span>
					<div class="progress">
					  <div class="progress-bar progress-bar-success" style="width: 45%">
						<span class="sr-only">35% Complete (success)</span>
					  </div>
					  <div class="progress-bar progress-bar-warning" style="width: 21%">
						<span class="sr-only">20% Complete (warning)</span>
					  </div>
					  <div class="progress-bar progress-bar-danger" style="width: 10%">
						<span class="sr-only">10% Complete (danger)</span>
					  </div>
					</div>
					<span class="status">
						<div class="field">
							<span class="badge badge-green">6</span> 任务已完成
							<span class="pull-right fa fa-check"></span>
						</div>
						<div class="field">
							<span class="badge badge-orange">3</span> 任务进行中
							<span class="pull-right fa fa-adjust"></span>
						</div>
						<div class="field">
							<span class="badge badge-red">1</span> 任务被挂起
							<span class="pull-right fa fa-list-ul"></span>
						</div>
				    </span>
				  </a>
				</li>
				<li>
				  <a href="javascript:void(0);">
				  <span class="image">
					  <img src="<c:url value='/resources/img/avatars/avatar7.png'/>" alt="" />
				  </span>
				  <span class="name">
					李亮
				  </span>
					<div class="progress">
					  <div class="progress-bar progress-bar-success" style="width: 7%">
						<span class="sr-only">35% Complete (success)</span>
					  </div>
					  <div class="progress-bar progress-bar-warning" style="width: 30%">
						<span class="sr-only">20% Complete (warning)</span>
					  </div>
					  <div class="progress-bar progress-bar-danger" style="width: 10%">
						<span class="sr-only">10% Complete (danger)</span>
					  </div>
					</div>
					<span class="status">
						<div class="field">
							<span class="badge badge-green">1</span> 任务已完成
							<span class="pull-right fa fa-check"></span>
						</div>
						<div class="field">
							<span class="badge badge-orange">6</span> 任务进行中
							<span class="pull-right fa fa-adjust"></span>
						</div>
						<div class="field">
							<span class="badge badge-red">2</span> 任务被挂起
							<span class="pull-right fa fa-list-ul"></span>
						</div>
				    </span>
				  </a>
				</li>
				<li>
				  <a href="javascript:void(0);">
				  <span class="image">
					  <img src="<c:url value='/resources/img/avatars/avatar8.png'/>" alt="" />
				  </span>
				  <span class="name">
					宋宇
				  </span>
					<div class="progress">
					  <div class="progress-bar progress-bar-success" style="width: 70%">
						<span class="sr-only">35% Complete (success)</span>
					  </div>
					  <div class="progress-bar progress-bar-warning" style="width: 20%">
						<span class="sr-only">20% Complete (warning)</span>
					  </div>
					  <div class="progress-bar progress-bar-danger" style="width: 5%">
						<span class="sr-only">10% Complete (danger)</span>
					  </div>
					</div>
					<span class="status">
						<div class="field">
							<span class="badge badge-green">13</span> 任务已完成
							<span class="pull-right fa fa-check"></span>
						</div>
						<div class="field">
							<span class="badge badge-orange">7</span> 任务进行中
							<span class="pull-right fa fa-adjust"></span>
						</div>
						<div class="field">
							<span class="badge badge-red">1</span> 任务被挂起
							<span class="pull-right fa fa-list-ul"></span>
						</div>
				    </span>
				  </a>
				</li>
			  </ul>
			</div>
		  </div>
		<!-- /TEAM STATUS -->
	</header>
	<section id="page">
		<!-- SIDEBAR -->
		<div id="sidebar" class="sidebar">
			<div class="sidebar-menu nav-collapse">
				<div class="divide-20"></div>
				<!-- SEARCH BAR -->
				<!-- <div id="search-bar">
					<input class="search" type="text" placeholder="搜索"><i class="fa fa-search search-icon"></i>
				</div> -->
				<ul>
					<li class="has-sub active">
						<a href="${ctx}/sys/mainview" class="">
						<i class="fa fa-bookmark-o fa-fw"></i> <span class="menu-text">危运行业档案管理系统</span>
						<span class="arrow open"></span>
						<span class="selected"></span>
						</a>
						<ul class="sub">
							<li><a class="" href="#" onclick="toReport()"><span class="sub-menu-text">统计分析</span></a></li>
							<li><a class="" href="#" onclick="toHistory()"><span class="sub-menu-text">办理流程记录</span></a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div id="main-content">
			<script type="text/javascript">
				function SetCwinHeight(){
					var ifm= document.getElementById("cwin");
					ifm.height = document.body.clientHeight - 50;
				}
			</script>
			<iframe src="${ctx}/sys/homeview" width="100%" align="center" height="200" id="cwin" name="cwin" onload="Javascript:SetCwinHeight()" frameborder="0" scrolling="auto"></iframe>
		</div>
	</section>
	<!-- JQUERY -->
	<script src="<c:url value='/resources/js/jquery/jquery-2.0.3.min.js'/>"></script>
	<!-- JQUERY UI-->
	<script src="<c:url value='/resources/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js'/>"></script>
	<!-- BOOTSTRAP -->
	<script src="<c:url value='/resources/bootstrap-dist/js/bootstrap.min.js'/>"></script>
	<!-- DATE RANGE PICKER -->
	<script src="<c:url value='/resources/js/bootstrap-daterangepicker/moment.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap-daterangepicker/daterangepicker.min.js'/>"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js'/>">
	</script><script type="text/javascript" src="<c:url value='/resources/js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js'/>"></script>
	<!-- BLOCK UI -->
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-BlockUI/jquery.blockUI.min.js'/>"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-Cookie/jquery.cookie.min.js'/>"></script>
	<!-- DATA TABLES -->
	<script type="text/javascript" language="javascript" src="<c:url value='/resources/js/datatables2/js/jquery.dataTables.min.js'/>"></script>
	<script type="text/javascript" language="javascript" src="<c:url value='/resources/js/datatables2/js/dataTables.bootstrap.js'/>"></script>
	<!-- CUSTOM SCRIPT -->
	<script type="text/javascript" language="javascript" src="<c:url value='/resources/js/script3.js'/>"></script>	
</body>
</html>
<script type="text/javascript">
	jQuery(document).ready(function() {
		App.setPage("tabs_accordions");  //Set current page
		App.init(); //Initialise plugins and elements
	})
	
	function toHistory(){
		$("#cwin").attr("src","${ctx}/history");
	}
	
	function toReport(){
		$("#cwin").attr("src","${ctx}/sys/totalview");
	}
</script>