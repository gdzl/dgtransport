<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<html>
<head>
<title>展开合闭按钮</title>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
<link href="<c:url value='/resources/css/background/css.css'/>"  type="text/css" rel="stylesheet" />
<script language="javascript">
function switchSysBar(){
 if (parent.document.getElementById('attachucp').cols=="194,12,*"){
 document.getElementById('leftbar').style.display="";
 parent.document.getElementById('attachucp').cols="0,12,*";
 }
 else{
 parent.document.getElementById('attachucp').cols="194,12,*";
 document.getElementById('leftbar').style.display="none"
 }
}
function load(){
 if (parent.document.getElementById('attachucp').cols=="0,12,*"){
 document.getElementById('leftbar').style.display="";
 }
}
</script>
</head>
	<body> 
		<center>
			<table height="100%" cellspacing="0" cellpadding="0" border="0" width="100%">
				<tbody>
					<tr>
						<td bgcolor="#ededb1" width="1">
						</td>
						<td id="leftbar" style="display: none; background:url(<c:url value='/resources/img/main/switchbg.jpg'/>) repeat-y #d2d2d0 0px 0">
						<a onClick="switchSysBar()" href="javascript:void(0);">
						<img src="<c:url value='/resources/img/main/pic24.jpg'/>"  width="12" height="72" border="0" alt="隐藏左侧菜单" >
						</a>
						</td>
						<td id="rightbar"style="background:url(<c:url value='/resources/img/main/switchbg.jpg'/>) repeat-y #f2f0f5 0px 0">
						<a onClick="switchSysBar()" href="javascript:void(0);">
						<img src="<c:url value='/resources/img/main/pic23.jpg'/>"  width="12" height="72" border="0" alt="隐藏左侧菜单" >
						</a>
						</td>
					</tr>
				</tbody>
			</table>
		</center>
	</body>
</html>