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
	<select style="display:none" id="color">
		<c:forEach items="${color}" var ="list">
			<option value="${list.id}">${list.dictionaryName}</option>
		</c:forEach>
	</select>
	<select style="display:none" id="carStates">
		<c:forEach items="${carState}" var ="list">
			<option value="${list.id}">${list.dictionaryName}</option>
		</c:forEach>
	</select>
	<!-- PAGE -->
	<section id="page">
		<div class="frame-content">
			<!-- 添加模态框2（Modal） -->
			<div class="modal fade" id="carUploadModal" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">
						   附件信息
						</h4>
					 </div>
					 <div class="modal-body">
					 	<form id="carUpForm" enctype="multipart/form-data" method="post">
						<table id="example10" cellpadding="0" cellspacing="0" border="0" width="100%" class="display datatable table table-striped table-bordered table-hover">
					        <input type="hidden" id="carEntityId" name="entityId"/>
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
					 				<td id="tranOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('8',this)"></td>
					 				<td>道路运输证</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="tranlicenceDate" name="tranlicenceDate" placeholder="请选择有效期" class="validity"></td>
					 				<td>
					 					<input id="tranLicence" type="file" name="tranLicence" style="display:none">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=tranLicence]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td id="carOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('9',this)"></td>
					 				<td>机动车行驶证</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" id="carlicenceDate" name="carlicenceDate" type="text" placeholder="请选择有效期" class="validity"></td>
					 				<td>
					 					<input id="carLicence" type="file" name="carLicence" style="display:none">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=carLicence]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td id="carRegOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('10',this)"></td>
					 				<td>机动车登记证书</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="carRegDate" name="carRegDate" placeholder="请选择有效期" class="validity"></td>
					 				<td>
					 					<input id="carRegLicence" type="file" name="carRegLicence" style="display:none">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=carRegLicence]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td id="insuranceOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('11',this)"></td>
					 				<td>承运人责任险</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="insuranceDate" name="insuranceDate" placeholder="请选择有效期" class="validity"></td>
					 				<td>
					 					<input id="insurance" type="file" name="insurance" style="display:none">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=insurance]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td id="environmentOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('12',this)"></td>
					 				<td>环保标志</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="environTagDate" name="environTagDate" placeholder="请选择有效期" class="validity"></td>
					 				<td>
					 					<input id="environmentTag" type="file" name="environmentTag" style="display:none">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=environmentTag]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td id="GPSOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('13',this)"></td>
					 				<td>GPS接入证明</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="GPSDate" name="GPSDate" placeholder="请选择有效期" class="validity"></td>
					 				<td>
					 					<input id="GPS" type="file" name="GPS" style="display:none">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=GPS]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
								<tr>
									<td id="GPSInstallOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('18',this)"></td>
									<td>GPS安装证明</td>
									<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="GPSInstallDate" name="GPSInstallDate" placeholder="有效期（可选择）" class="validity"></td>
									<td>
										<input id="GPSInstall" type="file" name="GPSInstall" style="display:none" class="emptyFile">
										<div class="input-append" >
											<a class="label label-primary" onclick="$('input[id=GPSInstall]').click();">上传</a>
										</div>
									</td>
								</tr>
								<tr>
									<td id="specialReportOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('19',this)"></td>
									<td>专项检验报告</td>
									<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="specialReportDate" name="specialReportDate" placeholder="有效期（可选择）" class="validity"></td>
									<td>
										<input id="specialReport" type="file" name="specialReport" style="display:none" class="emptyFile">
										<div class="input-append" >
											<a class="label label-primary" onclick="$('input[id=specialReport]').click();">上传</a>
										</div>
									</td>
								</tr>
								<tr>
									<td id="oilCastListOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('20',this)"></td>
									<td>燃油消耗表</td>
									<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="oilCastListDate" name="oilCastListDate" placeholder="有效期（可选择）" class="validity"></td>
									<td>
										<input id="oilCastList" type="file" name="oilCastList" style="display:none" class="emptyFile">
										<div class="input-append" >
											<a class="label label-primary" onclick="$('input[id=oilCastList]').click();">上传</a>
										</div>
									</td>
								</tr>
					 		</tbody>
					    </table>
					    </form>
					 </div>
					 <div class="modal-footer">
						<button type="button" class="btn btn-primary" 
						   onclick="uploadCarLicence()">保存
						</button>
						<button type="button" class="btn btn-default" 
						   onclick="closeCarUpload()">关闭
						</button>
					 </div>
				  </div><!-- /.modal-content -->
				</div>
			</div>
			<!-- 添加模态框2（Modal） -->
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
											<a href="###" >车辆详情页</a>
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
								<div class="box border green">
									<div class="box-title">
										<h4><i class="fa fa-external-link"></i><span class="hidden-inline-mobile">车辆详情页</span></h4>
									</div>
									<div class="box-body">
										<div class="tabbable header-tabs">
										  <ul>													
											 <li class="car"><a href="#box_tab2" data-toggle="tab"><i class="fa fa-truck"></i></a></li>
										  </ul>
										  <div class="tab-content">
											 <div class="tab-pane fade in active" id="box_tab1">
											 	<div class="col-sm-12">
											 		<form class="form-horizontal" role="form">
														<div class="form-group">
															<div class="col-md-12">																
																<a href="#" class="btn btn-info" id="carExport"><i class="fa fa-share"></i>导出</a>
																<a href="${ctx}/sys/homeview" class="btn btn-danger"><i class="fa fa-share"></i>返回</a>
															</div>
														</div>
													</form>
											 	</div>
												<table id="carTable" cellpadding="0" cellspacing="0" border="0" width="100%" class="display datatable table table-striped table-bordered table-hover">
											        <thead>
											            <tr>
											            	<th class="text-center"><input type="checkbox" class="checkAll3" onchange="checkAll3()"></th>
											                <th>序号</th>
											                <th>车牌号</th>
											                <th class="hidden-xs">车牌颜色</th>
											                <th class="hidden-xs">业户名称</th>
											                <th class="hidden-xs">道路运输证号</th>
											                <th>车辆附件信息</th>												                
											            </tr>
											        </thead>
											 		<tbody id="carList">
											 			
											 		</tbody>
											    </table>
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
			getCarColor();
			getCarState();
			carTableFn();
			function iniDate(){
				$("#tranlicenceDate").datepicker({dateFormat:'yy-mm-dd'});
				$("#carlicenceDate").datepicker({dateFormat:'yy-mm-dd'});
				$("#carRegDate").datepicker({dateFormat:'yy-mm-dd'});
				$("#insuranceDate").datepicker({dateFormat:'yy-mm-dd'});
				$("#environTagDate").datepicker({dateFormat:'yy-mm-dd'});
				$("#GPSDate").datepicker({dateFormat:'yy-mm-dd'});
				$("#GPSInstallDate").datepicker({dateFormat:'yy-mm-dd'});
				$("#specialReportDate").datepicker({dateFormat:'yy-mm-dd'});
				$("#oilCastListDate").datepicker({dateFormat:'yy-mm-dd'});
			}
	});

</script>
<script>
//全选
function checkAll3() {
        if ($(".checkAll3").is(':checked')) {
            $(".checkbox3").prop("checked", true);
        } else {
            $(".checkbox3").removeAttr("checked");
        }
    }
//车辆附件信息
function carAdjunctFormat(h,typeId) {
	var deadLine = new Date(h.deadLine);//20170105
	var regYear = deadLine.getFullYear();
	var regMonth = deadLine.getMonth();
	var regDay = deadLine.getDate();

	deadLine = "";
	if(!(regYear == 1970 && regMonth == 0 && regDay == 1 )) {
		deadLine = toDate(regYear,regMonth,regDay);
	}
	var str ='<tr>' +
        	'<td>'+h.fileName+'</td>' +
            '<td>'+deadLine+'</td>' +
            '<td>'+h.uploadTime+'</td>' +
            '<td><a href="#" class="label label-primary colorbox-button" onclick="downloadEpLicene('+h.id+')"  style="margin-right:5px;margin-bottom:5px;">查看</a><a href="#" class="label label-danger" style="margin-bottom:5px;" onclick="deleteAnnux('+h.id+','+typeId+',\'car\')" >删除</a></td>' +
        '</tr>';
    return str;    
}
//导出
$("#carExport").click(function(){
	var ids = "";
	$(".checkbox3").each(function (index){
		if(this.checked==true){
			ids +=this.value+",";
		}
	});
	var data ="&taskState="+$("#taskState").val()+"&taskName="+$("#taskName").val();
	var url = "${ctx}/sys/carTaskXls?carIds="+ids+data;
	window.location.href=url;
});
function carTableFn(){
	var url="${ctx}/sys/taskCarList";
	var formatDate = {"taskState":$("#taskState").val(),"taskName":$("#taskName").val()};
	$("#carTable").dataTable({
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
				"success" : function(resp) {
					fnCallback(resp);
				}
			});

		},
		"aoColumns":[
		    {"mData":"checkbox", 
		    	"mRender": function (data, type, full) {
		    		return "<input type='checkbox' class='checkbox3' value="+data+">";
		    	},
		    	"sClass": "text-center"
		    },
		    {"mData":"idx"},
		    {"mData":"carNo"},
		    {"mData":"carColor","sClass": "hidden-xs",
		    	"mRender": function (data, type, full) {
		    		var msg = "";
		    		$("#color option").each(function(){
		    			if($(this).val()==data){
		    				msg += $(this).text();
		    			}
		    		});
    				return msg;
    			}
		    },
		    {"mData":"epName","sClass": "hidden-xs"},
		    {"mData":"transportNo","sClass": "hidden-xs"},
		    {"mData":"upd",
	    		"mRender": function (data, type, full) {
    				return '<label class="label label-primary" data-toggle="modal" onclick="carUpload('+data+')">查看</label>';
    			}
		    }
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
//打开车辆上传页面
function carUpload(id){
	$("#carEntityId").attr("value",id);
	$('#carUploadModal').modal({backdrop: 'static', keyboard: false});
}
//上传车辆附件
function uploadCarLicence(){
	var options = {
        url: '${ctx}/sys/carUpload',
        type: 'POST',
        success: function (data) {
        	var json = eval("("+data+")");
        	if(json.msg=="success"){
        		alert("上传成功");
        	}else{
        		alert("上传失败，请联系管理员");
        	}
        	iniCarUpload();
        }
    }
	var tranState = true;
	var carLinState = true;
	var carRegState = true;
	var insuranState = true;
	var environState = true;
	var GPSState = true;
	var GPSInstallState = true;
	var specialReportState = true;
	var oilCastListState = true;
	var allState = true;
	var tranLicence = $("#tranLicence").val();
	var carLicence = $("#carLicence").val();
	var carRegLicence = $("#carRegLicence").val();
	var insurance = $("#insurance").val();
	var environmentTag = $("#environmentTag").val();
	var GPS = $("#GPS").val();
	var GPSInstall = $("#GPSInstall").val();
	var specialReport = $("#specialReport").val();
	var oilCastList = $("#oilCastList").val();
	if(tranLicence!=""&&$("#tranlicenceDate").val()==""){
		alert("请选择道路运输证有效期");
		tranState = false;
		return;
	}
	if(tranLicence!=""&&checkName(tranLicence,"道路运输证")){
		alert("上传文件名不是道路运输证");
		tranState = false;
		return;
	}
	if(tranLicence!=""&&checkSuffix(tranLicence,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		tranState = false;
		return;
	}
	if(carLicence!=""&&$("#carlicenceDate").val()==""){
		alert("请选择机动车行驶证有效期");
		carLinState = false;
		return;
	}
	if(carLicence!=""&&checkName(carLicence,"机动车行驶证")){
		alert("上传文件名不是机动车行驶证");
		carLinState = false;
		return;
	}
	if(carLicence!=""&&checkSuffix(carLicence,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		carLinState = false;
		return;
	}
	if(carRegLicence!=""&&$("#carRegDate").val()==""){
		alert("请选择机动车登记证书有效期");
		carRegState = false;
		return;
	}
	if(carRegLicence!=""&&checkName(carRegLicence,"机动车登记证书")){
		alert("上传文件名不是机动车登记证书");
		carRegState = false;
		return;
	}
	if(carRegLicence!=""&&checkSuffix(carRegLicence,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		carRegState = false;
		return;
	}
	if(insurance!=""&&$("#insuranceDate").val()==""){
		alert("请选择承运人责任险有效期");
		insuranState = false;
		return;
	}
	if(insurance!=""&&checkName(insurance,"承运人责任险")){
		alert("上传文件名不是承运人责任险");
		insuranState = false;
		return;
	}
	if(insurance!=""&&checkSuffix(insurance,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		insuranState = false;
		return;
	}
	if(environmentTag!=""&&$("#environTagDate").val()==""){
		alert("请选择环保标志有效期");
		environState = false;
		return;
	}
	if(environmentTag!=""&&checkName(environmentTag,"环保标志")){
		alert("上传文件名不是环保标志");
		environState = false;
		return;
	}
	if(environmentTag!=""&&checkSuffix(environmentTag,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		environState = false;
		return;
	}
	if(GPS!=""&&$("#GPSDate").val()==""){
		alert("请选择GPS接入证明有效期");
		GPSState = false;
		return;
	}
	if(GPS!=""&&checkName(GPS,"GPS接入证明")){
		alert("上传文件名不是GPS接入证明");
		GPSState = false;
		return;
	}
	if(GPSInstall!=""&&$("#GPSInstallDate").val()==""){
		alert("请选择GPS安装证明有效期");
		GPSState = false;
		return;
	}
	if(specialReport!=""&&$("#GPSInstallDate").val()==""){
		alert("请选择专项检测报告有效期");
		specialReportState = false;
		return;
	}
	if(oilCastList!=""&&$("#oilCastListDate").val()==""){
		alert("请选择GPS安装证明有效期");
		oilCastListState = false;
		return;
	}
	if(GPSInstall!=""&&checkName(GPSInstall,"GPS安装证明")){
		alert("上传文件名不是GPS安装证明");
		GPSInstallState = false;
		return;
	}
	if(specialReport!=""&&checkSuffix(specialReport,"jpg,png,pdf,JPG,PDF,PNG")){
			alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
			specialReportState = false;
			return;
	}
	if(oilCastList!=""&&checkSuffix(oilCastList,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		oilCastListState = false;
		return;
	}

	if(GPS!=""&&checkSuffix(GPS,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		GPSState = false;
		return;
	}
	if(GPSInstall!=""&&checkSuffix(GPSInstall,"jpg,png,pdf,JPG,PDF,PNG")){
		alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
		GPSInstallState = false;
		return;
	}
	if(tranLicence==""&&carLicence==""&&carRegLicence==""&&insurance==""&&environmentTag==""&&GPS==""&&GPSInstall==""&&specialReport==""&&oilCastList==""){
		allState = false;
		alert("请选择上传文件");
		return;
	}
	if(oilCastListState&&specialReportState&&GPSInstallState&&GPSState&&environState&&insuranState&&carRegState&&carLinState&&tranState&&allState){
		$('#carUpForm').ajaxSubmit(options);
	}

}
//获取车辆附件信息
var carAnnux;
function getCarUpload(typeId,obj){
	carAnnux = obj ;
	var url = "${ctx}/sys/getEpUpload";
	var data = {"entityId":$("#carEntityId").val(),"typeId":typeId};
	$.get(url,data,function(data){
		if(typeof(data)!="undefined"){
			if(typeof($("#carUp_"+typeId).html())=="undefined"||$("#carUpShow_"+typeId)==""){
				var html =  '<tr id="carUpShow_'+typeId+'"><td colspan="4">'+
							'<table  cellspacing="0" border="0"  class="table datatable table-striped table-bordered table-hover dataTables-example dataTable">'+
							'<tr id="carUp_'+typeId+'">' +
				 			'<td>附件名称</td>' +
				 			'<td>有效期:</td>' +
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
		    			var deadLine = new Date(data[i].deadLine);
		    			data[i].uploadTime = toDate(uploadTime.getFullYear(),uploadTime.getMonth(),uploadTime.getDate());
		    			data[i].deadLine = toDate(deadLine.getFullYear(),deadLine.getMonth(),deadLine.getDate());
		    			html2 +=carAdjunctFormat(data[i],typeId);
		    		}
	    		}else{
	    			html2 +='<tr><td colspan="4" style="text-align:center;"><span>没有相关记录</span></td></tr>';
	    		}	
	    		$("#carUp_"+typeId).after(html2);
			}else{
    			$("#carUpShow_"+typeId).toggle();
    		}
			if($("#carUp_"+typeId).is(":visible")){
				$(obj).attr("class","shouqi col-sm-1 col-md-1");
			}else{
				$(obj).attr("class","zhankai col-sm-1 col-md-1");
			}
		}
	});
}
//关闭车辆附件
function closeCarUpload(){
	$("#carUploadModal").modal('hide');
	iniCarUpload();
}
//初始化车辆附件页面
function iniCarUpload(){
	$("#carUpShow_8").html("");
	$("#carUpShow_9").html("");
	$("#carUpShow_10").html("");
	$("#carUpShow_11").html("");
	$("#carUpShow_12").html("");
	$("#carUpShow_13").html("");
	$("#carUpShow_14").html("");
	$("#carUpShow_18").html("");
	$("#carUpShow_19").html("");
	$("#carUpShow_20").html("");
	$(".validity").val("");
	$("#GPSInstallOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#oilCastListOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#specialReportOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#GPSOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#environmentOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#insuranceOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#carRegOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#carOpt").attr("class","zhankai col-sm-1 col-md-1");
	$("#tranOpt").attr("class","zhankai col-sm-1 col-md-1");
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
//获取车辆颜色
function getCarColor(){
	var html = getSelectHtml($("#color option"));
	$("#car_carColor").html(html);
	$("#carAddColor").html(html);
	$("#carColor").html(html);
}

//获取车辆状态
function getCarState(){
	var html = getSelectHtml($("#carStates option"));
	$("#carAddState").html(html);
	$("#car_carState").html(html);
	$("#carState").html(html);
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
			$("#carUp_"+typeId).html("");
			$("#carUpShow_"+typeId).html("");
			getCarUpload(typeId,carAnnux);	
		}else{
			alert("删除失败，请联系管理员");
		}
	});
}
</script>
</html>