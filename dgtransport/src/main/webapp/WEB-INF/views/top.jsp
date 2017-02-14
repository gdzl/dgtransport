<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台页面头部</title>

<link href="<c:url value='/resources/css/background/css.css'/>" type="text/css" rel="stylesheet" />
</head>
<body >

<table width="100%" border="0" cellspacing="0" cellpadding="0" id="header">
  <tr>
    <td rowspan="2" align="left" valign="top" id="logo"></td>
    <td align="left" valign="bottom">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="bottom" id="header-name">后台管理系统</td>
        <td align="right" valign="top" id="header-right">
        	<a href="index.html"  target="topFrame" onFocus="this.blur()" class="admin-out">注销</a>
            <a href="index.html" target="top" onFocus="this.blur()" class="admin-home">管理首页</a>
        	<a href="index.html" target="_blank" onFocus="this.blur()" class="admin-index">网站首页</a>       	
            <span>
              <!-- 日历 
              <SCRIPT type=text/javascript src="js/clock.js"></SCRIPT>
              <SCRIPT type=text/javascript>showcal();</SCRIPT>-->
            </span>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="left" valign="bottom">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="top" id="header-admin">决策指挥</td>
        <td align="left" valign="bottom" id="header-menu">
        <a href="###" onFocus="this.blur()" id="menuon">后台首页</a>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>