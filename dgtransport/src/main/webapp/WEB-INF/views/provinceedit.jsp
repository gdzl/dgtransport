<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主要内容区main</title>
<link href="<c:url value='/resources/css/background/css.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/background/main.css'/>"  type="text/css" rel="stylesheet" />
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：省市管理&nbsp;&nbsp;>&nbsp;&nbsp;添加用户</td>
  </tr>
  <tr>
    <td align="left" valign="top" id="addinfo">
    <a href="###"  onFocus="this.blur()" class="add">新增管理员</a>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form method="post" action="">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">省份：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="" value="" class="text-word">
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">所属市：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="" value="" class="text-word">
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">&nbsp;</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input name="" type="submit" value="提交" class="text-but">
        <input name="" type="reset" value="重置" class="text-but">
        <a href="city_list.html" target="mainFrame" onFocus="this.blur()" class="text-btn">返回</a></td>
        </tr>
    </table>
    </form>
    </td>
    </tr>
</table>
</body>
</html>