<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主要内容区main</title>
<link href="<c:url value='/resources/css/background/css.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/background/main.css'/>"  type="text/css" rel="stylesheet" />
<!-- JQUERY -->
<script src="<c:url value='/resources/js/jquery/jquery-2.0.3.min.js'/>"></script>
</head>
<body>
<table width="99%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td width="99%" align="left" valign="top">您的位置：角色管理&nbsp;&nbsp;>&nbsp;&nbsp;模块编辑</td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form id="modelForm" method="post" action="${ctx}/modelSave">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="right" valign="middle" class="borderright borderbottom bggray">模块名：</td>
	        <td align="left" valign="middle" class="borderright borderbottom main-for">
	        	<input type="text" name="systemName" value="${model.systemName}" class="text-word">
	        </td>
	      </tr>
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="right" valign="middle" class="borderright borderbottom bggray">模块路径：</td>
	        <td align="left" valign="middle" class="borderright borderbottom main-for">
	        	<input type="hidden" name="id" value="${model.id}" id="modelId" class="text-word">
	        	<input type="text" name="systemUrl" value="${model.systemUrl}" class="text-word">
	        </td>
	      </tr>
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="right" valign="middle" class="borderright borderbottom bggray">&nbsp;</td>
	        <td align="left" valign="middle" class="borderright borderbottom main-for">
		        <input name="" type="button" value="提交" onclick="subModel()" class="text-but">
		        <input name="" type="button" value="重置" class="text-but">
		        <a href="${ctx}/model" target="mainFrame" onFocus="this.blur()" class="text-btn">返回</a>
		     </td>
	      </tr>
	    </table>
    </form>
    </td>
    </tr>
</table>
</body>
</html>
<script type="text/javascript">
	function subModel(){
		var url = "";
		var data = $("#modelForm").serialize();
		var id = $("#modelId").val();
		if(id!=""){
			url = "${ctx}/modelUpd";
		}else{
			url = "${ctx}/modelSave";
		}
		$.post(url,data,function(data){
			if(data.msg=="success"){
				alert("保存成功");
			}else{
				alert("保存失败，请联系管理员");
			}			
		})
	}
</script>