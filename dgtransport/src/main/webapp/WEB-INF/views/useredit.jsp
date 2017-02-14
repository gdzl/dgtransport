<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>主要内容区main</title>
	<link href="<c:url value='/resources/css/background/css.css'/>" rel="stylesheet" />
	<link href="<c:url value='/resources/css/background/main.css'/>"  type="text/css" rel="stylesheet" />
	<script src="<c:url value='/resources/js/jquery/jquery-2.0.3.min.js'/>"></script>
	</head>
	<body>
	<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
		<tr>
			<td width="99%" align="left" valign="top">您的位置：用户管理&nbsp;&nbsp;>&nbsp;&nbsp;添加用户</td>
		</tr>
		<tr>
			<td align="left" valign="top" id="addinfo">
			<a href="###"  onFocus="this.blur()" class="add">新增管理员</a>
			</td>
		</tr>
		<tr>
			<td align="left" valign="top">
				<form id="userForm">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
						<tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
							<td align="right" valign="middle" class="borderright borderbottom bggray">用户名</td>
							<td align="left" valign="middle" class="borderright borderbottom main-for">
							<input type="hidden" name="id" value="${user.id}" id="userId" class="text-word">
							<input type="text" name="userName" value="" class="text-word">
							</td>
						</tr>
						<tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
							<td align="right" valign="middle" class="borderright borderbottom bggray">密码:</td>
							<td align="left" valign="middle" class="borderright borderbottom main-for">
							<input type="text" name="password" value="" class="text-word">
							</td>
						</tr>
						<tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
							<td align="right" valign="middle" class="borderright borderbottom bggray">角色：</td>
							<td align="left" valign="middle" class="borderright borderbottom main-for">
							<select name="roleId" id="roleId">
								<option value="0" >&nbsp;&nbsp;请选择</option>
						        <c:forEach items="${role}" var ="list">
						        	<option value="${list.id}" >&nbsp;&nbsp;${list.roleName}</option>
						        </c:forEach>
						        <script type="text/javascript">
						        	//var modelId = "${model.id}";
						        	//$("#systemNo option[value='"+modelId+"']").attr("selected",true);
						        </script>
							</select>
							</td>
						</tr>
						<tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
							<td align="right" valign="middle" class="borderright borderbottom bggray">&nbsp;</td>
							<td align="left" valign="middle" class="borderright borderbottom main-for">
							<input name="" type="button" value="保存" class="text-but" onclick="subUser()">
							<input name="" type="reset" value="重置" class="text-but">
							<a href="${ctx}/user" target="mainFrame" onFocus="this.blur()" class="text-btn">返回</a></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
<script type="text/javascript">
	function subUser(){
		var url = "";
		var data = $("#userForm").serialize();
		var id = $("#userId").val();
		if(id!=""){
			url = "${ctx}/userUpd";
		}else{
			url = "${ctx}/userSave";
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