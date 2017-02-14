<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<title>危运行业档案管理</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/cloud-admin.css'/>" >
<link rel="stylesheet" type="text/css"  href="<c:url value='/resources/css/themes/default.css" id="skin-switcher'/>" >
<link rel="stylesheet" type="text/css"  href="<c:url value='/resources/css/responsive.css'/>" >
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/datatables/media/css/jquery.dataTables.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/datatables/media/assets/css/datatables.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/bootstrap-daterangepicker/daterangepicker-bs3.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/bootstrap-dist/css/bootstrap.min.css'/>">
<style>
		.pagination{
	 		width:550px;
	 	}
	 	.ui-button{
	 		border:none;
			margin-right:0;
	 	}
	 	h1,h2,h3,h4,h5,h6{
	 		font-family: "微软雅黑" !important;
	 	}
       .zhankai {
            background: url('<c:url value='/resources/img/details_open.png'/>') no-repeat center center;
            cursor: pointer;
        }
        .shouqi{
        	background: url('<c:url value='/resources/img/details_close.png'/>') no-repeat center center;
        }
        body{
		font-family: "微软雅黑";
	}
</style>
</head>
<body>
	<input id="taskState" type="hidden" value="${taskState}"/>
	<input id="taskName" type="hidden" value="${taskName}"/>
	<select style="display:none" id="empStates">
		<c:forEach items="${empState}" var ="list">
			<option value="${list.id}">${list.dictionaryName}</option>
		</c:forEach>
	</select>
	<select style="display:none" id="provinceList">
		<c:forEach items="${provinceList}" var ="list">
			<option value="${list.id}">${list.provinceName}</option>
		</c:forEach>
	</select>
	<select style="display:none" id="cityList">
		<c:forEach items="${cityList}" var ="list">
			<option value="${list.id}_${list.provinceNo}">${list.cityName}</option>
		</c:forEach>
	</select>
	<select style="display:none" id="streetList">
		<c:forEach items="${streetList}" var ="list">
			<option value="${list.id}">${list.streetName}</option>
		</c:forEach>
	</select>
	<!-- PAGE -->
	<section id="page">
		<div class="frame-content">
			<!-- 添加模态框3（Modal） -->
			<div class="modal fade" id="empUploadModel" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
						<button type="button" class="close" 
						   data-dismiss="modal" aria-hidden="true">
							  &times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
						   附件信息
						</h4>
					 </div>
					 <div class="modal-body">
					 	<form id="empUpForm" enctype="multipart/form-data" method="post">
							<input type="hidden" id="empEntityId" name="entityId"/>
							<table id="example12" cellpadding="0" cellspacing="0" border="0" width="100%" class="display datatable table table-striped table-bordered table-hover">
						        <thead>
						            <tr>
						            	<th></th>
						            	<th>附件名称</th>
						            	<th>有效期</th>
						            	<th>文件上传</th>
						            </tr>
						        </thead>
						 		<tbody>
						 			<tr>
						 				<td id="identityOpt" class="zhankai col-sm-1 col-md-1" onclick="getEmpUpload('14',this)"></td>
						 				<td>身份证</td>
						 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="identityDate" name="identityDate" placeholder="请选择有效期" class="validity"></td>
						 				<td>
						 					<input id="identity" type="file" name="identity" style="display:none">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=identity]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 			<tr>
						 				<td id="certificateNoOpt" class="zhankai col-sm-1 col-md-1" onclick="getEmpUpload('15',this)"></td>
						 				<td>从业资格证</td>
						 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="certificateDate" name="certificateDate" placeholder="请选择有效期" class="validity"></td>
						 				<td>
						 					<input id="certificateNo" type="file" name="certificateNo" style="display:none">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=certificateNo]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 			<tr>
						 				<td id="driverLinceneOpt" class="zhankai col-sm-1 col-md-1" onclick="getEmpUpload('16',this)"></td>
						 				<td>驾驶证</td>
						 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="driverDate" name="driverDate" placeholder="请选择有效期" class="validity"></td>
						 				<td>
						 					<input id="driverLincene" type="file" name="driverLincene" style="display:none">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=driverLincene]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 			<tr>
						 				<td id="contractOpt" class="zhankai col-sm-1 col-md-1" onclick="getEmpUpload('17',this)"></td>
						 				<td>劳动合同</td>
						 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="contractDate" name="contractDate" placeholder="请选择有效期" class="validity"></td>
						 				<td>
						 					<input id="contract" type="file" name="contract" style="display:none">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=contract]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 		</tbody>
						    </table>
					    </form>
					 </div>
					 <div class="modal-footer">
					 	<button type="button" class="btn btn-primary" 
						   onclick="uploadEmpLincene()">保存
						</button>
						<button type="button" class="btn btn-default" 
						   onclick="closeEmpUpload()">关闭
						</button>
					 </div>
				  </div><!-- /.modal-content -->
				</div>
			</div>
			<!-- 添加模态框3（Modal） -->
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<!-- PAGE HEADER-->
						<div class="row">
							<div class="col-sm-12">
								<div class="page-header">
									<!-- STYLER -->
									
									<!-- /STYLER -->
									<!-- BREADCRUMBS -->
									<ul class="breadcrumb">
										<li>
											<i class="fa fa-home"></i>
											<a href="###">首页</a>
										</li>
										<li>
											<a href="#" >危运行业档案管理</a>
										</li>
										<li>
											<a href="###" >人员详情页</a>
										</li>
									</ul>
									<!-- /BREADCRUMBS -->
									<div class="clearfix">
										<h3 class="content-title pull-left">危运行业档案管理</h3>
									</div>
									<!-- <div class="description">Tabs and Accordions</div> -->
								</div>
							</div>
						</div>
						<!-- /PAGE HEADER -->
						<div class="row" id="dangan">
							<div class="col-md-12">
								<!-- BOX -->
								<div class="box border orange">
									<div class="box-title">
										<h4><i class="fa fa-external-link"></i><span class="hidden-inline-mobile">人员详情页</span></h4>
									</div>
									<div class="box-body">
										<div class="tabbable header-tabs">
										  <ul>
											 <li class="people"><a href="#box_tab3" data-toggle="tab"><i class="fa fa-users"></i></a></li>
										  </ul>
										  <div class="tab-content">
											 <div class="tab-pane fade in active" id="box_tab1">
												 	<div class="col-sm-12">
												 		<form class="form-horizontal" role="form">
															<div class="form-group">
																<div class="col-md-12">																
																	<a href="#" class="btn btn-info" id="empExport"><i class="fa fa-share"></i>导出</a>
																	<a href="${ctx}/sys/homeview" class="btn btn-danger"><i class="fa fa-share"></i>返回</a>
																</div>
															</div>
														</form>
												 	</div>
													<table id="emoloyeeTable" cellpadding="0" cellspacing="0" border="0" width="100%" class="display datatable table table-striped table-bordered table-hover">
												        <thead>
												            <tr>
												            	<th class="text-center"><input type="checkbox" class="checkAll4" onclick="checkAll4()"></th>
												                <th>序号</th>
												                <th>姓名</th>
												                <th>人员属性</th>
												                <th class="hidden-xs">身份证号</th>
												                <th class="hidden-xs">联系电话</th>
												                <th class="hidden-xs">户籍所在省</th>
												                <th>户籍所在市</th>
												                <th>所属镇街</th>
												                <th>人员附件信息</th>		                
												            </tr>
												        </thead>
												 		<tbody id="empList">
												 			
												 		</tbody>
												    </table>
												</div>
													<!-- /POPOVERS -->
												</div>
											 	</div>
											 </div>
										  </div>
									   </div>
									</div>
								</div>
								<!-- /BOX -->
							</div>
						</div>
						<!-- BOX TABS -->

						<div class="footer-tools">
							<span class="go-top">
								<i class="fa fa-chevron-up"></i> Top
							</span>
						</div>
					</div><!-- /CONTENT-->
				</div>
			</div>
		</div>
	</section>
	<!--/PAGE -->
</body>
<script src="<c:url value='/resources/js/jquery/jquery-2.0.3.min.js'/>"></script>
	<!-- JQUERY UI-->
	<script src="<c:url value='/resources/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js'/>"></script>
	<!-- BOOTSTRAP -->
	<script src="<c:url value='/resources/bootstrap-dist/js/bootstrap.min.js'/>"></script>
	
	<script src="<c:url value='/resources/js/jquery.form.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.MultiFile.js'/>"></script>
	<script src="<c:url value='/resources/js/ajaxfileupload.js'/>"></script>	
	<!-- DATE RANGE PICKER -->
	<script src="<c:url value='/resources/js/bootstrap-daterangepicker/moment.min.js'/>"></script>
	
	<script src="<c:url value='/resources/js/bootstrap-daterangepicker/daterangepicker.min.js'/>"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js'/>"></script>
	<!-- BLOCK UI -->
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-BlockUI/jquery.blockUI.min.js'/>"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-Cookie/jquery.cookie.min.js'/>"></script>
	<!-- DATA TABLES -->
	<script type="text/javascript" language="javascript" src="<c:url value='/resources/js/datatables2/js/jquery.dataTables.min.js'/>"></script>
	<script type="text/javascript" language="javascript" src="<c:url value='/resources/js/datatables2/js/dataTables.bootstrap.js'/>"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="<c:url value='/resources/js/script3.js'/>"></script>
	<script>
		jQuery(document).ready(function() {		
			App.setPage("tabs_accordions");  //Set current page
			App.init(); //Initialise plugins and elements
			iniDate();
			getStreet();
			empTableFn();
			function iniDate(){
				$("#contractDate").datepicker({dateFormat:'yy-mm-dd'});
				$("#driverDate").datepicker({dateFormat:'yy-mm-dd'});
				$("#certificateDate").datepicker({dateFormat:'yy-mm-dd'});
				$("#identityDate").datepicker({dateFormat:'yy-mm-dd'});
			}
	});

</script>
<script>
//全选
    function checkAll4() {
        if ($(".checkAll4").is(':checked')) {
            $(".checkbox4").prop("checked", true);
        } else {
            $(".checkbox4").removeAttr("checked");
        }
    }
//人员附件信息
function peopleAdjunctFormat(i,typeId) {
	var deadLine = new Date(i.deadLine);//20170105
	var regYear = deadLine.getFullYear();
	var regMonth = deadLine.getMonth();
	var regDay = deadLine.getDate();

	deadLine = "";
	if(!(regYear == 1970 && regMonth == 0 && regDay == 1 )) {
		deadLine = toDate(regYear,regMonth,regDay);
	}
	var str =  '<tr>' +
        	'<td>'+i.fileName+'</td>' +
            '<td>'+deadLine+'</td>' +
            '<td>'+i.uploadTime+'</td>' +
            '<td><a href="#" class="label label-primary colorbox-button" onclick="downloadEpLicene('+i.id+')"  style="margin-right:5px;margin-bottom:5px;">查看</a><a href="#" class="label label-danger" style="margin-bottom:5px;" onclick="deleteAnnux('+i.id+','+typeId+',\'emp\')" >删除</a></td>' +
        '</tr>';
    return str;    
}
//导出
$("#empExport").click(function(){
	var ids = "";
	$(".checkbox4").each(function (index){
		if(this.checked==true){
			ids +=this.value+",";
		}
	});
	var data ="&taskState="+$("#taskState").val()+"&taskName="+$("#taskName").val();
	var url = "${ctx}/sys/employeeTaskXls?employeeIds="+ids+data;
	window.location.href=url;
});
function empTableFn(){
	var url="${ctx}/sys/taskEmpList";
	var formData = {"taskState":$("#taskState").val(),"taskName":$("#taskName").val()};
	$("#emoloyeeTable").dataTable({
		"oLanguage" : { // 汉化
			"sProcessing" : "正在加载数据...",
			"sLengthMenu" : "显示_MENU_条 ",
			"sZeroRecords" : "没有您要搜索的内容",
			"sInfo" : "从_START_ 到 _END_ 条记录——总记录数为 _TOTAL_ 条",
			"sInfoEmpty" : "记录数为0",
			"sInfoFiltered" : "(全部记录数 _MAX_  条)",
			"sInfoPostFix" : "",
			"sSearch" : "搜索",
			"sUrl" : "",
			"oPaginate" : {
				"sFirst" : "首页",
				"sPrevious" : " 上一页 ",
				"sNext" : " 下一页 ",
				"sLast" : " 尾页 "
			}
		},
		"bJQueryUI": true,
		"bPaginate" : true,// 分页按钮
		"bFilter" : false,// 搜索栏
		"bLengthChange" : true,// 每行显示记录数
		"iDisplayLength" : 10,// 每页显示行数
		"bSort" : false,// 排序
		"bInfo" : true,// Showing 1 to 10 of 23 entries 总记录数没也显示多少等信息
		"bWidth":true,
		"bScrollCollapse": true,
		"sPaginationType" : "full_numbers", // 分页，一共两种样式 另一种为two_button // 是datatables默认
		"bProcessing" : true,
		"bServerSide" : true,
		"bDestroy": true,
		"bSortCellsTop": true,	
		"sAjaxSource": url, 
		"fnServerData" : function(sSource, aoData, fnCallback) {
			sSource = sSource+"?iDisplayStart="+aoData[3].value+"&iDisplayLength="+aoData[4].value+"&sEcho="+aoData[0].value;
			$.ajax({
				"type" : 'post',
				"url" : sSource,
				"dataType" : "json",
				"data" : formData,
				"success" : function(resp) {
					fnCallback(resp);
				}
			});

		},
		"aoColumns":[
		    {"mData":"checkbox", 
		    	"mRender": function (data, type, full) {
		    		return "<input type='checkbox' class='checkbox4' value="+data+">";
		    	},
		    	"sClass": "text-center"
		    },
		    {"mData":"idx"},
		    {"mData":"name"},
		    {"mData":"properties",
		    	"mRender": function (data, type, full) {
		    		var html = "<label>";
		    		if(data=="1"){
		    			html += "驾驶员";
					}else if(data=="2"){
						html += "管理员";
					}else if(data=="3"){
						html += "押运员";
					}
		    		html +="</label>";
    				return html;
	    		}
	    	},
		    {"mData":"identityNo","sClass": "hidden-xs"},
		    {"mData":"phone","sClass": "hidden-xs"},
		    {"mData":"provinceNo","sClass": "hidden-xs",
		    	"mRender": function (data, type, full) {
		    		var html = "<label>";
		    		$("#provinceList option").each(function(){
		    			if($(this).val()==data){
		    				html += $(this).text();
		    			}
		    		});
		    		html +="</label>";
    				return html;
		    	}
		    },
		    {"mData":"cityNo","sClass": "hidden-xs",
		    	"mRender": function (data, type, full) {
		    		var html = "<label>";
		    		$("#cityList option").each(function(){
		    			var ids = $(this).val();
		    			var idArr = ids.split("_");
		    			if(idArr[0]==data){
		    				html += $(this).text();
		    			}
		    		});
		    		html +="</label>";
    				return html;
    			}
		    },
		    {"mData":"street",
		    	"mRender": function (data, type, full) {
		    		var html = "<label>";
		    		$("#streetList option").each(function(){
		    			if($(this).val()==data){
		    				html +=$(this).text();
		    			}
		    		});
		    		html +="</label>";
    				return html;
    			}
		    },
		    {"mData":"upd",
	    		"mRender": function (data, type, full) {
    				return '<alabel href="#" class="label label-primary" data-toggle="modal" onclick="empAnnexInfo('+data+')">查看</label>';
    			}
		    },
			]
		 
	});
}
//解析上传文件路径
function filterFile(obj){
	var tpsplit = obj.split("\\");
	var tpFile = tpsplit[tpsplit.length-1];
	var tpNameArr = tpFile.split("\.");
	return tpNameArr;
}
//检测上传文件名
function checkName(obj,name){
	var fileArr = filterFile(obj);
	if(fileArr[0]!=name){
		return true;
	}else{
		return false;
	}
}
//检测上传文件后缀名
function checkSuffix(obj,suffix){
	var fileArr = filterFile(obj);
	var suffixName = fileArr[1];
	var state = true;
	var suffixArr = suffix.split(",");
	for(var i=0;i<suffixArr.length;i++){
		if(suffixName==suffixArr[i]){
			state = false;
			break;
		}
	}
	return state;
}
//日期转换
function toDate(year,month,day){
	if(parseInt(month)<parseInt(10)){
		month = parseInt(month)+1;
		month = "0"+month;
	}
	return year+"-"+month+"-"+day;
};
//显示人员附件页面
function empAnnexInfo(id){
	$("#empEntityId").attr("value",id);
	$('#empUploadModel').modal({backdrop: 'static', keyboard: false});
}
//上传员工附件
function uploadEmpLincene(){
	var options = {
        url: '${ctx}/sys/empUpload',
        type: 'POST',
        success: function (data) {
        	var json = eval("("+data+")");
        	if(json.msg=="success"){
        		alert("上传成功");
        	}else{
        		alert("上传失败，请联系管理员");
        	}
        	iniEmpUpload();
        }
    }
	var identityState = true;
	var certificateNoState = true;
	var driverLinceneState = true;
	var contractState = true;
	var nullState = true;
	var identity = $("#identity").val();
	var certificateNo = $("#certificateNo").val();
	var driverLincene = $("#driverLincene").val();
	var contract = $("#contract").val();
	
	if(identity!=""&&$("#identityDate").val()==""){
		alert("请选择身份证有效期");
		identityState = false;
		return;
	}
	if(identity!=""&&checkName(identity,"身份证")){
		alert("上传文件名不是身份证");
		identityState = false;
		return;
	}
	if(identity!=""&&checkSuffix(identity,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		identityState = false;
		return;
	}
	if(certificateNo!=""&&$("#certificateDate").val()==""){
		alert("请选择从业资格证有效期");
		certificateNoState = false;
		return;
	}
	if(certificateNo!=""&&checkName(certificateNo,"从业资格证")){
		alert("上传文件名不是从业资格证");
		certificateNoState = false;
		return;
	}
	if(certificateNo!=""&&checkSuffix(certificateNo,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		certificateNoState = false;
		return;
	}
	if(driverLincene!=""&&$("#driverDate").val()==""){
		alert("请选择驾驶证有效期");
		driverLinceneState = false;
		return;
	}
	if(driverLincene!=""&&checkName(driverLincene,"驾驶证")){
		alert("上传文件名不是驾驶证");
		driverLinceneState = false;
		return;
	}
	if(driverLincene!=""&&checkSuffix(driverLincene,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		driverLinceneState = false;
		return;
	}
	if(contract!=""&&$("#contractDate").val()==""){
		alert("请选择劳动合同有效期");
		contractState = false;
		return;
	}
	if(contract!=""&&checkName(contract,"劳动合同")){
		alert("上传文件名不是劳动合同");
		contractState = false;
		return;
	}
	if(contract!=""&&checkSuffix(contract,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		contractState = false;
		return;
	}
	if(contract==""&&driverLincene==""&&certificateNo==""&&identity==""){
		alert("请选择上传文件");
		nullState = false;
	}
	if(contractState&&certificateNoState&&driverLinceneState&&identityState&&nullState){
		$('#empUpForm').ajaxSubmit(options);
	}
}
//获取员工附件
var empAnnux;
function getEmpUpload(typeId,obj){
	empAnnux = obj ;
	var url = "${ctx}/sys/getEpUpload";
	var data = {"entityId":$("#empEntityId").val(),"typeId":typeId};
	$.get(url,data,function(data){
		if(typeof(data)!="undefined"){
			if(typeof($("#empUp_"+typeId).html())=="undefined"||$("#empUpShow_"+typeId)==""){
				var html =  '<tr id="empUpShow_'+typeId+'"><td colspan="4">'+
							'<table  cellspacing="0" border="0"  class="table datatable table-striped table-bordered table-hover dataTables-example dataTable">'+
							'<tr id="empUp_'+typeId+'">' +
			     			'<td>附件名称</td>' +
			     			'<td>有效期:</td>' +
			     			'<td>上传时间:</td>' +
			     			'<td>操作:</td>' +
			            	'</tr>';
	    		html +='</table></td></tr>';
	    		var tr = $(obj).closest('tr');
	    		$(obj).attr("class","shouqi col-sm-1 col-md-1");
	    		$(tr).after(html);
	    		var html2 = '';
	    		if(data.length>0){
		    		for(var i=0;i<data.length;i++){
		    			var uploadTime = new Date(data[i].uploadTime);
		    			data[i].uploadTime = toDate(uploadTime.getFullYear(),uploadTime.getMonth(),uploadTime.getDate());
		    			var deadLine = new Date(data[i].deadLine);
		    			data[i].deadLine = toDate(deadLine.getFullYear(),deadLine.getMonth(),deadLine.getDate());
		    			html2 +=peopleAdjunctFormat(data[i],typeId);
		    		}
	    		}else{
	    			html2 +='<tr><td colspan="4" style="text-align:center;"><span>没有相关记录</span></td></tr>';
	    		}
	    		$("#empUp_"+typeId).after(html2);
			}else{
    			$("#empUpShow_"+typeId).toggle();
    		}
			if($("#empUp_"+typeId).is(":visible")){
				$(obj).attr("class","shouqi col-sm-1 col-md-1");
			}else{
				$(obj).attr("class","zhankai col-sm-1 col-md-1");
			}
		}
	});
}

//关闭员工上传页面
function closeEmpUpload(){
	$("#empUploadModel").modal('hide');
	iniEmpUpload();
}
//初始化员工页面
function iniEmpUpload(){
	$("#empUpShow_14").html("");
	$("#empUpShow_15").html("");
	$("#empUpShow_16").html("");
	$("#empUpShow_17").html("");
	$(".validity").val("");
	$("#identityOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#certificateNoOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#driverLinceneOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#contractOpt").attr("class","zhankai col-sm-1 col-md-1");
}

function getSelectHtml(selObj){
	var html = "<option value='0'>请选择</option>";
	$(selObj).each(function(){
		html +="<option value='"+$(this).val()+"'>"+$(this).text()+"</option>";
	});
	return html;
}
//获取镇街信息
function getStreet(){
	var url = "${ctx}/sys/getStreet";
	var data = "";
	var html = getSelectHtml($("#streetList option"));
	$("#cityNo").html(html);
	$("#empSearchCityNo").html(html);
	$("#ep_cityNo").html(html);
	
}
//获取人员状态
function getEmpState(){
	var html = getSelectHtml($("#empStates option"));
	$("#driverState").html(html);
	$("#managerState").html(html);
	$("#stevedorerState").html(html);
	$("#emp_empState").html(html);
	$("#manager_empState").html(html);
	$("#empState").html(html);
	$("#stevedorer_empState").html(html);
}
//下载附件
function downloadEpLicene(id){
	window.location.href="${ctx}/sys/download?id="+id;
}

function deleteAnnux(id,typeId,name){
	var url = "${ctx}/sys/deleteAnnux";
	var data = {"id":id};
	$.post(url,data,function(data){
		if(data.msg=="success"){
			alert("删除成功");
			$("#empUpShow_"+typeId).html("");
			$("#empUp_"+typeId).html("");
			getEmpUpload(typeId,empAnnux);	
		}else{
			alert("删除失败，请联系管理员");
		}
	});
}
</script>
</html>