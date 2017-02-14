<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
	<script src="<c:url value='/resources/js/jquery/jquery-2.0.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/ajaxfileupload.js'/>"></script>
	</head>
	<body>
		<div>
		 	<input id="initExcel" type="file" name="initExcel" style="display:none">
			<label>选择导入文件：</label><a href="#" onclick="$('input[id=initExcel]').click();">导入</a>
		 </div>
		 <div>
			<button type="button" onclick="init()">保存</button>
		 </div>
	</body>
</html>
<script type="text/javascript">
	function init(){
		$.ajaxFileUpload({  
	        url : "${ctx}/initImport",   
	        secureuri : false,  
	        fileElementId : 'initExcel', 
	        dataType : 'JSON', //or json xml whatever you like~  
	        success : function(data, status) {
	        	var json = eval("("+data+")");
	        	if(json.msg=="success"){
	        		alert("导入成功");
	        		searchByKey("searchForm");
	        	}else{
	        		alert(json.detail);
	        	}
	        } 
	    });
	}
</script>