<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主要内容区main</title>
<link href="<c:url value='/resources/css/background/css.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/background/main.css'/>" type="text/css" rel="stylesheet" />
<script src="<c:url value='/resources/js/jquery/jquery-2.0.3.min.js'/>"></script>
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}

</style>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：模块管理</td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="search">
  		<tr>
   		 <td width="50%" align="left" valign="middle">
	         <form method="post" action="">
	         <span>管理员：</span>
	         <input type="text" name="" value="" class="text-word">
	         <input name="" type="button" value="查询" class="text-but">
	         </form>
         </td>
  		  <td width="10%" align="center" valign="middle" style="text-align:right; width:150px;"><a href="${ctx}/modeledit"  target="mainFrame" onFocus="this.blur()" class="add">新增管理员</a></td>
  		</tr>
	</table>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr>
        <th align="center" valign="middle" class="borderright">模块名</th>
        <th align="center" valign="middle" class="borderright">模块路径</th>
        <th align="center" valign="middle">操作</th>
      </tr>
      <c:forEach items="${page.datas}" var ="list">
		<tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="center" valign="middle" class="borderright borderbottom">${list.systemName}</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${list.systemUrl}</td>
	        <td align="center" valign="middle" class="borderbottom">
	        	<a href="#" target="mainFrame" onFocus="this.blur()" class="add" onclick="editModel(${list.id})">修改</a>
	        	<span class="gray">&nbsp;|&nbsp;</span>
	        	<a href="#" target="mainFrame" onFocus="this.blur()" class="add" onclick="delModel(${list.id})">删除</a>
	        </td>
      	</tr>
	  </c:forEach>
    </table></td>
    </tr>
  <tr>
    <td align="left" valign="top" class="fenye">
	    ${page.totalCount} 条数据 ${page.currentPage}/ ${page.totalPage} 页&nbsp;&nbsp;
	    <a href="#" target="mainFrame" onFocus="this.blur()">首页</a>&nbsp;&nbsp;
	    <a href="#" target="mainFrame" onFocus="this.blur()">上一页</a>&nbsp;&nbsp;
	    <a href="#" target="mainFrame" onFocus="this.blur()">下一页</a>&nbsp;&nbsp;
	    <a href="#" target="mainFrame" onFocus="this.blur()">尾页</a>
    </td>
  </tr>
</table>
</body>
</html>
<script type="text/javascript">
	function editModel(id){
		window.location.href="${ctx}/modelToEdit?id="+id;
	}
	
	function delModel(id){
		var url = "${ctx}/modelDel";
		var data = {"id":id};
		$.post(url,data,function (data){
			if(data.msg=="success"){
				alert("删除成功");
			}else{
				alert("删除失败，请联系管理员");
			}
			window.location.href = "${ctx}/model";
		});
	}
</script>