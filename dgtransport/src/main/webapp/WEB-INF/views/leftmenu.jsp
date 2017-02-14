<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>左侧导航menu</title>
<link href="<c:url value='/resources/css/background/css.css'/>"  type="text/css" rel="stylesheet" />
<script type="text/javascript">
</script>
<style type=text/css>
html{ SCROLLBAR-FACE-COLOR: #538ec6; SCROLLBAR-HIGHLIGHT-COLOR: #dce5f0; SCROLLBAR-SHADOW-COLOR: #2c6daa; SCROLLBAR-3DLIGHT-COLOR: #dce5f0; SCROLLBAR-ARROW-COLOR: #2c6daa;  SCROLLBAR-TRACK-COLOR: #dce5f0;  SCROLLBAR-DARKSHADOW-COLOR: #dce5f0; overflow-x:hidden;}
body{overflow-x:hidden; background:url("<c:url value='/resources/img/main/leftbg.jpg'/>") left top repeat-y #f2f0f5; width:194px;}
</style>
</head>
<body>
<div id="left-top">
  <a href="main.html" target="mainFrame">
  
    <div><img src="<c:url value='/resources/img/main/member.gif'/>" width="44" height="44" /></div>
    <span style="color:white;">用户：admin<br>角色：超级管理员</span>
  </a>
	
</div>
    <div style="float: left" id="my_menu" class="sdmenu">
      <div class="collapsed">
        <a href="${ctx}/user" target="mainFrame" onfocus="this.blur()" style="background:#DEF;color: #548fc7;font-weight:bold;">用户管理</a>
      </div>
      <div class="collapsed">
        <a href="${ctx}/province" target="mainFrame" onfocus="this.blur()" style="background:#DEF;color: #548fc7;font-weight:bold;">省市管理</a>
      </div>
      <div class="collapsed">
        <a href="${ctx}/role" target="mainFrame" onfocus="this.blur()" style="background:#DEF;color: #548fc7;font-weight:bold;">角色管理</a>
      </div>
      <div class="collapsed">
        <a href="${ctx}/model" target="mainFrame" onfocus="this.blur()" style="background:#DEF;color: #548fc7;font-weight:bold;">模块管理</a>
      </div>
    </div>
</body>
</html>