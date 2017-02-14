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
	<select style="display:none" id="streetList">
		<c:forEach items="${streetList}" var ="list">
			<option value="${list.id}">${list.streetName}</option>
		</c:forEach>
	</select>
	<select style="display:none" id="epState">
		<c:forEach items="${epState}" var ="list">
			<option value="${list.id}">${list.dictionaryName}</option>
		</c:forEach>
	</select>
	<!-- PAGE -->
	<section id="page">
		<div class="frame-content">
			<!-- 添加模态框1（Modal） -->
			<div class="modal fade" id="CompanyaddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
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
					 	<form id="epUpForm" enctype="multipart/form-data" method="post">
						<table id="example11" cellpadding="0" cellspacing="0" border="0" width="100%" class="display datatable table table-striped table-bordered table-hover">
					        <input type="hidden" id="epEntityId" name="entityId"/>
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
					 				<td id="tpLicenceOpt" class="zhankai col-sm-1 col-md-1" onclick="getLicenceFile('1',this)"></td>
					 				<td>道路运输经营许可证</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="tpDeadLine" name="tpDeadLine" placeholder="请选择有效期" class="validity"></td>
					 				<td>
					 					<input id="tpLicenceFile" type="file" name="tpLicenceFile" class="eplicence" style="display:none">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=tpLicenceFile]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td id="icLicenceOpt" class="zhankai col-sm-1 col-md-1" onclick="getLicenceFile('2',this)"></td>
					 				<td>工商营业执照</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="icDeadLine" name="icDeadLine" placeholder="请选择有效期" class="validity"></td>
					 				<td>
					 					<input id="icLicenceFile" type="file" name="icLicenceFile" class="eplicence" style="display:none">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=icLicenceFile]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td id="saveLicenceOpt" class="zhankai col-sm-1 col-md-1" onclick="getLicenceFile('3',this)"></td>
					 				<td>安全生产管理制度</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="saveDeadLine" name="saveDeadLine" placeholder="请选择有效期" class="validity"></td>
					 				<td>
					 					<input id="saveLicence" type="file" name="saveLicence" class="eplicence" style="display:none">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=saveLicence]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td id="emergencyOpt" class="zhankai col-sm-1 col-md-1" onclick="getLicenceFile('4',this)"></td>
					 				<td>安全应急制度</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="emergencyDeadLine" name="emergencyDeadLine" placeholder="请选择有效期" class="validity"></td>
					 				<td>
					 					<input id="emergencyLicence" type="file" name="emergencyLicence" class="eplicence" style="display:none">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=emergencyLicence]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 		</tbody>
					    </table>
					    </form>
					 </div>
					 <div class="modal-footer">
						<button type="button" class="btn btn-primary" 
						  onclick="uploadLicence()">保存
						</button>
						<button type="button" class="btn btn-default" onclick="hideLicence()">关闭
						</button>
					 </div>
				  </div><!-- /.modal-content -->
				</div>
			</div>
			
			<!-- 添加模态框1（Modal） -->
			<!-- 企业监管信息 -->
			<div class="modal fade" id="epRegulatoryInfo" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
						<button type="button" class="close" 
						   data-dismiss="modal" aria-hidden="true">
							  &times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
						   企业监管信息
						</h4>
					 </div>
					 <div class="modal-body">
					 	<form id="regularForm" method="post" enctype="multipart/form-data">
					 		<input type="hidden" id="regulateObjId" name="regulateObjId"/>
					 		<table id="RegulatoryInfoTable" cellpadding="0" cellspacing="0" border="0" width="100%" class="display datatable table table-striped table-bordered table-hover">
						        <thead>
						            <tr>
						            	<th></th>
						            	<th>附件名称</th>
						            	<th>文件上传</th>
						            </tr>
						        </thead>
						 		<tbody>
						 			<tr>
						 				<td id="monthYL" class="zhankai col-sm-1 col-md-1" onclick="getRecordInfo('5',this)"></td>
						 				<td>月度安全生产演练记录</td>
						 				<td>
						 					<input type="hidden" id="regulateObjId" name="regulateObjId"/>
						 					<input id="monthYLRecoder" type="file" name="recorder" style="display:none">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=monthYLRecoder]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 			<tr>
						 				<td id="monthXC" class="zhankai col-sm-1 col-md-1" onclick="getRecordInfo('6',this)"></td>
						 				<td>月度安全生产巡查记录</td>
						 				<td>
						 					<input id="monthXCRecoder" type="file" name="recorder" style="display:none">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=monthXCRecoder]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 			<tr>
						 				<td id="seasonXC" class="zhankai col-sm-1 col-md-1" onclick="getRecordInfo('7',this)"></td>
						 				<td>季度安全生产巡查记录</td>
						 				<td>
						 					<input id="seasonXCRecorder" type="file" name="recorder" style="display:none">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=seasonXCRecorder]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 		</tbody>
						    </table>
					 	</form>
					 </div>
					 <div class="modal-footer">
						<button type="button" class="btn btn-primary" 
						   onclick="uploadEnterpriseRecorder()">保存
						</button>
						<button type="button" class="btn btn-default" 
						    onclick="closeEpRec()">关闭
						</button>
					 </div>
				  </div><!-- /.modal-content -->
				</div>
			</div>
			<!-- 企业监管信息 -->
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
											<a href="###" >企业附件详情页</a>
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
								<div class="box border purple">
									<div class="box-title">
										<h4><i class="fa fa-external-link"></i><span class="hidden-inline-mobile">企业详情页</span></h4>
									</div>
									<div class="box-body">
										<div class="tabbable header-tabs">
										  <ul>										 
											 <li class="company active"><a href="#box_tab1" data-toggle="tab"><i class="fa fa-building-o"></i></a></li>
										  </ul>
										  <div class="tab-content">
											 <div class="tab-pane fade in active" id="box_tab1">
											 	<div class="col-sm-12">
											 		<form class="form-horizontal" role="form">
														<div class="form-group">
															<div class="col-md-12">																
																<a href="###" class="btn btn-info" id="enterpriseExport"><i class="fa fa-share"></i>导出</a>
																<a href="${ctx}/sys/homeview" class="btn btn-danger"><i class="fa fa-share"></i>返回</a>
															</div>
														</div>
													</form>
											 	</div>
												<table id="enterpriseTable" cellpadding="0" cellspacing="0" border="0" width="100%" class="display datatable table table-striped table-bordered table-hover">
											        <thead>
											            <tr>
											            	<th class="text-center"><input type="checkbox" class="checkAll2" onchange="checkAll2()"></th>
											                <th>序号</th>
											                <th class="col-sm-3">业户名称</th>
											                <th class="hidden-xs col-sm-3">经营地址</th>
											                <th class="hidden-xs">所属镇街</th>
											                <th>企业状态</th>
											                <th>企业附件信息</th>
											            	<th>企业监管信息</th>				                
											            </tr>
											        </thead>
											 		<tbody id="bodyList">
											 			
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
			getEpState();
			enTableFn();
			function iniDate(){
				$("#tpDeadLine").datepicker({dateFormat:'yy-mm-dd'});
				$("#icDeadLine").datepicker({dateFormat:'yy-mm-dd'});
				$("#saveDeadLine").datepicker({dateFormat:'yy-mm-dd'});
				$("#emergencyDeadLine").datepicker({dateFormat:'yy-mm-dd'});
			}
	});

</script>
<script>
//全选
function checkAll2() {
    if ($(".checkAll2").is(':checked')) {
        $(".checkbox2").prop("checked", true);
    } else {
        $(".checkbox2").removeAttr("checked");
    }
}
//企业附件信息 
function format11(g,typeId) {
	var deadLine = new Date(g.deadLine);//20170105
	var regYear = deadLine.getFullYear();
	var regMonth = deadLine.getMonth();
	var regDay = deadLine.getDate();

	deadLine = "";
	if(!(regYear == 1970 && regMonth == 0 && regDay == 1 )) {
		deadLine = toDate(regYear,regMonth,regDay);
	}
	var str ='<tr>' +
        	'<td>'+g.fileName+'</td>' +
            '<td>'+deadLine+'</td>' +
            '<td>'+g.uploadTime+'</td>' +
            '<td><a href="#" class="label label-primary colorbox-button" onclick="downloadEpLicene('+g.id+')"  style="margin-right:5px;margin-bottom:5px;">查看</a><a href="#" class="label label-danger" style="margin-bottom:5px;" onclick="deleteAnnux('+g.id+','+typeId+',\'ep\')" >删除</a></td>' +
        	'</tr>' ;
        return str;
}

//企业监管信息
function format12(f) {
	var str ='<tr>' +
        	'<td>'+f.fileName+'</td>' +
            '<td>'+f.uploadTime+'</td>' +
            '<td><a href="<c:url value="resources'+f.fileUrl+'"/>" class="label label-success" style="margin-bottom:5px;">下载</a></td>' +
        '</tr>';
	return str;
}
//导出
$("#enterpriseExport").click(function(){
	var ids = "";
	$(".checkbox2").each(function (index){
		if(this.checked==true){
			ids +=this.value+",";
		}
	});
	var data ="&taskState="+$("#taskState").val()+"&taskName="+$("#taskName").val();
	var url = "${ctx}/sys/enterpriseTaskXls?enterpriceIds="+ids+data;
	window.location.href=url;
});
function enTableFn(){
	 var url="${ctx}/sys/taskEpList";
	 var formatDate = {"taskState":$("#taskState").val(),"taskName":$("#taskName").val()};
	$("#enterpriseTable").dataTable({//企业列表
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
				"data" : formatDate,
				"async" : false,
				"success" : function(resp) {
					fnCallback(resp);
				}
			});

		},
		"aoColumns":[
		    {"mData":"checkbox", 
		    	"mRender": function (data, type, full) {
		    		epId = data;
		    		return "<input type='checkbox' class='checkbox2' value="+data+">";
		    	},
		    	"sClass": "text-center"
		    },
		    {"mData":"idx"},
		    {"mData":"epName"},
		    {"mData":"address","sClass": "hidden-xs"},
		    {"mData":"cityNo","sClass": "hidden-xs",
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
		    {"mData":"epState",
		    	"mRender": function (data, type, full) {
		    		var msg =""
	    			$("#epState option").each(function(){
		    			if($(this).val()==data){
		    				msg +=$(this).text();
		    			}
		    		});
	    			return msg;
	    		}
		    },
		    {"mData":"upd",
		    	"mRender": function (data, type, full) {
	    			return '<label class="label label-primary" data-toggle="modal" onclick="enterpriseAnnex('+data+')">查看</label>';
	    		}
		    },
		    {"mData":"show",
		    	"mRender": function (data, type, full) {
	    			return '<label href="#" class="label label-danger" data-toggle="modal" onclick="enterpriseRegulate('+data+')">查看</a>';
	    		}
		    }
			]
		 
	});
}

//上传企业附件信息
function uploadLicence(){
	var options = {
        url: '${ctx}/sys/enterpriseLicence',
        type: 'POST',
        success: function (data) {
        	var json = eval("("+data+")");
        	if(json.msg=="success"){
        		alert("上传成功");
        	}else{
        		alert("上传失败，请联系管理员");
        	}
        	iniEpUpload();
        }
    }
	var tpLicenceFile = $("#tpLicenceFile").val();
	var icLicenceFile = $("#icLicenceFile").val();
	var saveLicence = $("#saveLicence").val();
	var emergencyLicence = $("#emergencyLicence").val();
	var tpState = true;
	var icState = true;
	var saveState = true;
	var emerState = true;
	var allState = true;	
	if(tpLicenceFile!=""&&$("#tpDeadLine").val()==""){
		alert("请选择道路运输经营许可证有效期");
		tpState = false;
		return;
	}
	if(tpLicenceFile!=""&&checkName(tpLicenceFile,"道路运输经营许可证")){
		alert("上传文件名不是道路运输经营许可证");
		tpState = false;
		return;
	}
	if(tpLicenceFile!=""&&checkSuffix(tpLicenceFile,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		tpState = false;
		return;
	}
	if(icLicenceFile!=""&&$("#icDeadLine").val()==""){
		alert("请选择工商营业执照有效期");
		icState = false;
		return;
	}	
	if(icLicenceFile!=""&&checkName(icLicenceFile,"工商营业执照")){
		alert("上传文件名不是工商营业执照");
		icState = false;
		return;
	}
	if(icLicenceFile!=""&&checkSuffix(icLicenceFile,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		icState = false;
		return;
	}
	
	if(saveLicence!=""&&$("#saveDeadLine").val()==""){
		alert("请选择安全生产管理制度有效期");
		saveState = false;
		return;
	}
	if(saveLicence!=""&&checkName(saveLicence,"安全生产管理制度")){
		alert("上传文件名不是安全生产管理制度");
		saveState = false;
		return;
	}
	if(saveLicence!=""&&checkSuffix(saveLicence,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		saveState = false;
		return;
	}
	if(emergencyLicence!=""&&$("#emergencyDeadLine").val()==""){
		alert("请选择安全应急制度有效期");
		emerState = false;
		return;
	}
	if(emergencyLicence!=""&&checkName(emergencyLicence,"安全应急制度")){
		alert("上传文件名不是安全应急制度");
		emerState = false;
		return;
	}
	if(emergencyLicence!=""&&checkSuffix(emergencyLicence,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		emerState = false;
		return;
	}
	if(emergencyLicence==""&&saveLicence==""&&icLicenceFile==""&&tpLicenceFile==""){
		allState = false;
		alert("请选择上传文件");
		return;
	}
	if(tpState&&icState&&saveState&&emerState&&allState){
		$('#epUpForm').ajaxSubmit(options);	
	}
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
//关闭企业上传页面
function hideLicence(obj){
	$("#CompanyaddModal").modal('hide');
	iniEpUpload();
}
//初始化企业上传页面
function iniEpUpload(){
	$("#epUpShow_1").html("");
	$("#epUpShow_2").html("");
	$("#epUpShow_3").html("");
	$("#epUpShow_4").html("");
	$(".validity").val("");
	$("#emergencyOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#saveLicenceOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#icLicenceOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#tpLicenceOpt").attr("class","zhankai col-sm-1 col-md-1");
}
//打开企业上传页面
function enterpriseAnnex(id){
	$("#epEntityId").attr("value",id);
	$('#CompanyaddModal').modal({backdrop: 'static', keyboard: false});
}
//获取企业附件信息
var epLicence;
function getLicenceFile(typeId,obj){
	epLicence = obj;
	var url = "${ctx}/sys/getEpUpload";
	var data = {"entityId":$("#epEntityId").val(),"typeId":typeId};
	$.get(url,data,function(data){
		if(typeof(data)!="undefined"){
			if(typeof($("#epUp_"+typeId).html())=="undefined"||$("#epUpShow_"+typeId).html()==""){
				var html = '<tr id="epUpShow_'+typeId+'"><td colspan="5"><table  cellspacing="0" border="0" '
				+' class="table datatable table-striped table-bordered table-hover dataTables-example dataTable">'
				+'<tr id="epUp_'+typeId+'">'
				+'<td>附件名称</td>'
				+'<td>有效期:</td>'
				+'<td>上传时间:</td>'
				+'<td>操作:</td>'
				+'</tr>' ;
	    		html +='</table></td></tr>';
	    		var tr = $(obj).closest('tr');
	    		$(obj).attr("class","shouqi col-sm-1 col-md-1");
	    		$(tr).after(html);
	    		var html2 = '';
	    		if(data.length>0){
	    			for(var i=0;i<data.length;i++){
		    			var uploadTime = new Date(data[i].uploadTime);
		    			var deadLine = new Date(data[i].deadLine);
		    			data[i].uploadTime = toDate(uploadTime.getFullYear(),uploadTime.getMonth(),uploadTime.getDate());
		    			data[i].deadLine = toDate(deadLine.getFullYear(),deadLine.getMonth(),deadLine.getDate());
		    			html2 +=format11(data[i],typeId,obj);
		    		}	
	    		}else{
	    			html2 +='<tr><td colspan="5" style="text-align:center;"><span>没有相关记录</span></td></tr>';
	    		}
	    		
	    		$("#epUp_"+typeId).after(html2);
			}else{
    			$("#epUpShow_"+typeId).toggle();
    		}
			if($("#epUp_"+typeId).is(":visible")){
				$(obj).attr("class","shouqi col-sm-1 col-md-1");
			}else{
				$(obj).attr("class","zhankai col-sm-1 col-md-1");
			}
		}
	});
	
}
//打开企业监管页面
function enterpriseRegulate(id){
	$("#regulateObjId").attr("value",id);
	$("#epRegulatoryInfo").modal('show');
}
//上传企业监管信息
function uploadEnterpriseRecorder(){
	var options = {
        url: '${ctx}/sys/enterpriseRecorder',
        type: 'POST',
        success: function (data) {
        	var json = eval("("+data+")");
        	if(json.msg=="success"){
        		alert("上传成功");
        	}else{
        		alert("上传失败，请联系管理员");
        	}
        	iniEpRec();
        }
    }
	var state = true;
	var ylState = true;
	var xcState = true;
	var seasonXCState = true;
	var monthYLRecoder = $("#monthYLRecoder").val();
	var monthXCRecoder = $("#monthXCRecoder").val();
	var seasonXCRecorder = $("#seasonXCRecorder").val();
	if(monthYLRecoder!=""&&checkSuffix(monthYLRecoder,"zip")){
		alert("请选择zip上传");
		ylState = false;
		return;
	}
	if(monthXCRecoder!=""&&checkSuffix(monthXCRecoder,"zip")){
		alert("请选择zip上传");
		xcState = false;
		return;
	}
	if(seasonXCRecorder!=""&&checkSuffix(seasonXCRecorder,"zip")){
		alert("请选择zip上传");
		seasonXCState = false;
		return;
	}
	if(monthYLRecoder==""&&monthXCRecoder==""&&seasonXCRecorder==""){
		state = false;
		alert("请选择上传文件");
		return;
	}
	if(state&&seasonXCState&&xcState&&ylState){
		$('#regularForm').ajaxSubmit(options);	
	}
	
}
//关闭企业监管信息
function closeEpRec(){
	$("#epRegulatoryInfo").modal('hide');
	iniEpRec();
}
//初始化企业监管信息
function iniEpRec(){
	$("#epRcShow_5").html("");
	$("#epRcShow_6").html("");
	$("#epRcShow_7").html("");
	$("#seasonXC").attr("class","zhankai col-sm-1 col-md-1");
	$("#monthXC").attr("class","zhankai col-sm-1 col-md-1");
	$("#monthYL").attr("class","zhankai col-sm-1 col-md-1");
}
//获取企业监管信息
function getRecordInfo(typeId,obj){
	var url = "${ctx}/sys/getEpUpload";
	var data = {"entityId":$("#regulateObjId").val(),"typeId":typeId};
	$.get(url,data,function(data){
		if(typeof(data)!="undefined"){
			if(typeof($("#epRc_"+typeId).html())=="undefined"){
				var html =  '<tr id="epRcShow_'+typeId+'"><td colspan="5">'+
							'<table  cellspacing="0" border="0"  class="table datatable table-striped table-bordered table-hover dataTables-example dataTable">'+ 
					    	'<tr id="epRc_'+typeId+'">' +
					 			'<td>附件名称</td>' +
					 			'<td>上传时间:</td>' +
					 			'<td>操作:</td>' +
					        '</tr>' ;
	    		html +='</table></td></tr>';
	    		var tr = $(obj).closest('tr');
	    		$(obj).attr("class","shouqi col-sm-1 col-md-1");
	    		$(tr).after(html);
	    		var html2 = '';
	    		if(data.length>0){
	    			for(var i=0;i<data.length;i++){
		    			var uploadTime = new Date(data[i].uploadTime);
		    			data[i].uploadTime = toDate(uploadTime.getFullYear(),uploadTime.getMonth(),uploadTime.getDate());
		    			html2 +=format12(data[i]);
		    		}	
	    		}else{
	    			html2 +='<tr><td colspan="3" style="text-align:center;"><span>没有相关记录</span></td></tr>';
	    		}
	    		
	    		$("#epRc_"+typeId).after(html2);
			}else{
    			$("#epRcShow_"+typeId).toggle();
    		}
			if($("#epRc_"+typeId).is(":visible")){
				$(obj).attr("class","shouqi col-sm-1 col-md-1");
			}else{
				$(obj).attr("class","zhankai col-sm-1 col-md-1");
			}
		}
	});
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
//获取企业状态
function getEpState(){
	var url = "${ctx}/sys/getEpState?typeId=1";
	var data = "";
	var html = getSelectHtml($("#epState option"));
	$("#enState").html(html);
	$("#en_enState").html(html);
}
function enterpriseAdd(){
	var html = getSelectHtml($("#streetList option"));
	var html2 = getSelectHtml($("#epState option"));
	$("#epAddCity").html(html);
	$("#epAddState").html(html2);
	
	$("#epAddForm").modal('show');
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
			$("#epUpShow_"+typeId).html("");
			$("#epUp_"+typeId).html("");
			getLicenceFile(typeId,epLicence);	
		}else{
			alert("删除失败，请联系管理员");
		}
	});
}
</script>
</html>