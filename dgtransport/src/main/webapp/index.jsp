<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="addr" value="${pageContext.request.localAddr}"/>
<c:set var="port" value="${pageContext.request.localPort}"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<title>系统登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/cloud-admin.css'/>" />
	<link href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet"/>
	<!-- UNIFORM -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/uniform/css/uniform.default.min.css'/>" />
	<!-- ANIMATE -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/animatecss/animate.min.css'/>" />
	<!-- FONTS -->
	<script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery-2.0.3.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/bootstrap-dist/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/uniform/jquery.uniform.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-Cookie/jquery.cookie.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/backstretch/jquery.backstretch.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/script.js'/>"></script>
	<style>
		 i{
			color: #CCCCCC;
		    display: block !important;
		    font-size: 16px;
		    height: 16px;
		    margin: 9px 2px 4px 10px;
		    position: absolute !important;
		    text-align: center;
		    width: 16px;
		    z-index: 1;
		}
	</style>
</head>
<body class="login">	
	<section id="page">
			<header>
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div id="logo">
							</div>
						</div>
					</div>
				</div>
			</header>
			<section id="login_bg" class="visible">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<form id="loginForm" method="post" action="${ctx}/sys/login">
								<div class="login-box">
									<h2 class="bigintro">登录</h2>
									<div class="divide-40"></div>
									  <div class="form-group">
										<label for="exampleInputEmail1">用户名</label>
										<i class="fa fa-envelope"></i>
										<input type="text" class="form-control" id="userName" name="userName" >
										
									  </div>
									  <div class="form-group"> 
										<label for="exampleInputPassword1">密码</label>
										<i class="fa fa-lock"></i>
										<input type="password" class="form-control" id="password" name="password" >
									  </div>
									  <div>
										<button type="submit" class="btn btn-danger" id="keySubmit" onkeydown="keyDown()" onclick="login()" >提交</button>
									  </div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
	</section>
	<script type="text/javascript">
		jQuery(document).ready(function() {		
			App.setPage("login_bg");  
			App.init(); 
		});
		function swapScreen(id) {
			jQuery('.visible').removeClass('visible animated fadeInUp');
			jQuery('#'+id).addClass('visible animated fadeInUp');
		}
		function login(){
			var form = $("#loginForm");
			var $userName = $("#userName");
			var $password = $("#password");
			if ($userName.val()=="" || $password.val()=="") {
				alert("账号或密码不能为空")
			}else{
				form.submit();
			}
		}
		function keyDown(){
			if(event.keyCode == 13){
				$("#keySubmit").on("click",function(){
					login()
				});
			}
		} 
	</script>
</body>
</html>
