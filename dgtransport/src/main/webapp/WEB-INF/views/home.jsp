<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />

<title>危运行业档案管理系统</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/cloud-admin.css'/>" >
	<link rel="stylesheet" type="text/css"  href="<c:url value='/resources/css/themes/default.css" id="skin-switcher'/>" >
	<link rel="stylesheet" type="text/css"  href="<c:url value='/resources/css/responsive.css'/>" >
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/datatables/media/css/jquery.dataTables.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/datatables/media/assets/css/datatables.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/bootstrap-daterangepicker/daterangepicker-bs3.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/formvalidation-dist/css/formValidation.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/bootstrap-dist/css/bootstrap.min.css'/>">
	<style type="text/css">
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
	#tdPdding td{
		padding-left: 0px;
		padding-right: 0px;
	}
	.ui-button{
		margin-right:0;
	}
	.ui-state-default{
		border:none;
	}
	.badge {
		margin-left: 1px;
	    line-height: 15px;
	    padding-bottom: 3px;
	    padding-top: 2px;
	    text-shadow: none;
	    background-color: #dd5a43 !important;
	}
	.aPdding{
		padding:7px 7px 7px 5px!important;
	}
    </style>
</head>
<body>

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
	<select style="display:none" id="empStates">
		<c:forEach items="${empState}" var ="list">
			<option value="${list.id}">${list.dictionaryName}</option>
		</c:forEach>
	</select>
	<select style="display:none" id="epNameList">
		<c:forEach items="${epNameList}" var ="list">
			<option value="${list[0]}">${list[1]}</option>
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
	<!-- PAGE -->
	<section id="page">
		<div class="frame-content">
			<!-- 添加模态框1（Modal） -->
			<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
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
					 				<td colspan="4"><span id="tpLicenceOptUp" class="input-large"></span></td>
					 			</tr>
					 			<tr>
					 				<td id="icLicenceOpt" class="zhankai col-sm-1 col-md-1" onclick="getLicenceFile('2',this)"></td>
					 				<td>工商营业执照</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="icDeadLine" name="icDeadLine" placeholder="有效期（可选择）" class="validity"></td>
					 				<td>
					 					<input id="icLicenceFile" type="file" name="icLicenceFile" class="eplicence" style="display:none">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=icLicenceFile]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td colspan="4"><span id="icLicenceOptUp" class="input-large"></span></td>
					 			</tr>
					 			<tr>
					 				<td id="saveLicenceOpt" class="zhankai col-sm-1 col-md-1" onclick="getLicenceFile('3',this)"></td>
					 				<td>安全生产管理制度</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="saveDeadLine" name="saveDeadLine" placeholder="有效期（可选择）" class="validity"></td>
					 				<td>
					 					<input id="saveLicence" type="file" name="saveLicence" class="eplicence" style="display:none">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=saveLicence]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td colspan="4"><span id="saveLicenceOptUp" class="input-large"></span></td>
					 			</tr>
					 			<tr>
					 				<td id="emergencyOpt" class="zhankai col-sm-1 col-md-1" onclick="getLicenceFile('4',this)"></td>
					 				<td>安全应急制度</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="emergencyDeadLine" name="emergencyDeadLine" placeholder="有效期（可选择）" class="validity"></td>
					 				<td>
					 					<input id="emergencyLicence" type="file" name="emergencyLicence" class="eplicence" style="display:none">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=emergencyLicence]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td colspan="4"><span id="emergencyOptUp" class="input-large"></span></td>
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
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="tranlicenceDate" name="tranlicenceDate" placeholder="有效期（可选择）" class="validity"></td>
					 				<td>
					 					<input id="tranLicence" type="file" name="tranLicence" style="display:none" class="emptyFile">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=tranLicence]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td colspan="4"><span id="tranOptUp" class="input-large"></span></td>
					 			</tr>
					 			<tr>
					 				<td id="carOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('9',this)"></td>
					 				<td>机动车行驶证</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" id="carlicenceDate" name="carlicenceDate" type="text" placeholder="请选择有效期" class="validity"></td>
					 				<td>
					 					<input id="carLicence" type="file" name="carLicence" style="display:none" class="emptyFile">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=carLicence]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td colspan="4"><span id="carOptUp" class="input-large"></span></td>
					 			</tr>
					 			<tr>
					 				<td id="carRegOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('10',this)"></td>
					 				<td>机动车登记证书</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="carRegDate" name="carRegDate" placeholder="有效期（可选择）" class="validity"></td>
					 				<td>
					 					<input id="carRegLicence" type="file" name="carRegLicence" style="display:none" class="emptyFile">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=carRegLicence]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td colspan="4"><span id="carRegOptUp" class="input-large"></span></td>
					 			</tr>
					 			<tr>
					 				<td id="insuranceOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('11',this)"></td>
					 				<td>承运人责任险</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="insuranceDate" name="insuranceDate" placeholder="请选择有效期" class="validity"></td>
					 				<td>
					 					<input id="insurance" type="file" name="insurance" style="display:none" class="emptyFile">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=insurance]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td colspan="4"><span id="insuranceOptUp" class="input-large"></span></td>
					 			</tr>
					 			<tr>
					 				<td id="environmentOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('12',this)"></td>
					 				<td>环保标志</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="environTagDate" name="environTagDate" placeholder="请选择有效期" class="validity"></td>
					 				<td>
					 					<input id="environmentTag" type="file" name="environmentTag" style="display:none" class="emptyFile">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=environmentTag]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td colspan="4"><span id="environmentOptUp" class="input-large"></span></td>
					 			</tr>
					 			<tr>
					 				<td id="GPSOpt" class="zhankai col-sm-1 col-md-1" onclick="getCarUpload('13',this)"></td>
					 				<td>GPS接入证明</td>
					 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="GPSDate" name="GPSDate" placeholder="有效期（可选择）" class="validity"></td>
					 				<td>
					 					<input id="GPS" type="file" name="GPS" style="display:none" class="emptyFile">
                                        <div class="input-append" >
                                           <a class="label label-primary" onclick="$('input[id=GPS]').click();">上传</a>
                                        </div>
					 				</td>
					 			</tr>
					 			<tr>
					 				<td colspan="4"><span id="GPSOptUp" class="input-large"></span></td>
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
									<td colspan="4"><span id="GPSInstallOptUp" class="input-large"></span></td>
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
									<td colspan="4"><span id="specialReportOptUp" class="input-large"></span></td>
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
								<tr>
									<td colspan="4"><span id="oilCastListOptUp" class="input-large"></span></td>
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
			<!-- 添加模态框3（Modal） -->
			<div class="modal fade" id="empUploadModel" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
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
						 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="identityDate" name="identityDate" placeholder="有效期（可选择）" class="validity"></td>
						 				<td>
						 					<input id="identity" type="file" name="identity" style="display:none" class="emptyFile">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=identity]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 			<tr>
					 					<td colspan="4"><span id="identityOptUp" class="input-large"></span></td>
					 				</tr>
						 			<tr>
						 				<td id="certificateNoOpt" class="zhankai col-sm-1 col-md-1" onclick="getEmpUpload('15',this)"></td>
						 				<td>从业资格证</td>
						 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="certificateDate" name="certificateDate" placeholder="请选择有效期" class="validity"></td>
						 				<td>
						 					<input id="certificateNo" type="file" name="certificateNo" style="display:none" class="emptyFile">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=certificateNo]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 			<tr>
					 					<td colspan="4"><span id="certificateNoOptUp" class="input-large"></span></td>
					 				</tr>
						 			<tr class="driverLinceneSection">
						 				<td id="driverLinceneOpt" class="zhankai col-sm-1 col-md-1" onclick="getEmpUpload('16',this)"></td>
						 				<td>驾驶证</td>
						 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="driverDate" name="driverDate" placeholder="请选择有效期" class="validity"></td>
						 				<td>
						 					<input id="driverLincene" type="file" name="driverLincene" style="display:none" class="emptyFile">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=driverLincene]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 			<tr class="driverLinceneSection">
					 					<td colspan="4"><span id="driverLinceneOptUp" class="input-large"></span></td>
					 				</tr>
						 			<tr>
						 				<td id="contractOpt" class="zhankai col-sm-1 col-md-1" onclick="getEmpUpload('17',this)"></td>
						 				<td>劳动合同</td>
						 				<td style="padding:0px;"><input style="width:100%;height:100%;border:none;padding-left:10px;" type="text" id="contractDate" name="contractDate" placeholder="有效期（可选择）"  class="validity"></td>
						 				<td>
						 					<input id="contract" type="file" name="contract" style="display:none" class="emptyFile">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=contract]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 			<tr>
					 					<td colspan="4"><span id="contractOptUp" class="input-large"></span></td>
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
			<!-- 添加模态框4（Modal） -->
			<!-- 添加模态框（Modal） -->
			<div class="modal fade" id="epAddForm" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">
						   新增
						</h4>
					 </div>
					 <div class="modal-body">
						<form class="form-horizontal" role="form" id="enterSaveForm">
							<div class="form-group">
								<label class="col-sm-3 control-label">业户编号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="epNo">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">业户名称</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="epName">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">经营地址</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="address">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">经营范围</label>
								<div class="col-sm-9">
									<input class="form-control"  type="text" value="" name="scopeName">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">道路运输经营许可证号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" name="tpLicence">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">工商营业执照号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="icLicence">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">法定代表人</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="corporation">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">法定代表人联系方式</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="corcontact">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">业务联系人</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="businessor">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">业务联系人联系方式</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="contact">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">所属镇街</label>
								<div class="col-sm-9">
								  <select class="form-control input-sm text-con" style="height:50px;" id="epAddCity" name="cityNo"></select>
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">企业状态</label>
								<div class="col-sm-9">
								  <select class="form-control input-sm text-con" style="height:34px;" name="epState" id="epAddState"></select>
								</div>
						 	</div>
						</form>
					 </div>
					 <div class="modal-footer">
						<button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="saveEntity('enterprise','save')">
						   保存
						</button>
						<button type="button" class="btn btn-default" 
						   data-dismiss="modal" onclick="emptyFn()">关闭
						</button>
					 </div>
				  </div><!-- /.modal-content -->
				</div>
			</div>
			<!--模态框1_2-->
			<div class="modal fade" id="enChangeForm" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">
						   修改
						</h4>
					 </div>
					 <div class="modal-body">
						<form id="updEnterpriseForm" class="form-horizontal" role="form">
							<div class="form-group">
								<label class="col-sm-3 control-label">业户编号</label>
								<div class="col-sm-9">
								  <input type="hidden" value="" id="ep_id" name="id">
								  <input class="form-control"  type="text" value="" id="ep_Addno" name="epNo" readonly="readonly">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">业户名称</label>
								<div class="col-sm-9">
								  <input type="hidden" value="" id="ep_id" name="id">
								  <input class="form-control"  type="text" value="" id="ep_name" name="epName">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">经营地址</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="ep_address" name="address">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">经营范围</label>
								<div class="col-sm-9">
									<input class="form-control"  type="text" value="" id="ep_scopeNo" name="scopeName">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">道路运输经营许可证号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="ep_tpLicence" name="tpLicence">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">工商营业执照号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="ep_icLicence" name="icLicence">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">法定代表人</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="ep_corporation" name="corporation">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">法定代表人联系方式</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="ep_corcontact" name="corcontact">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">业务联系人</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="ep_businessor" name="businessor">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">业务联系人联系方式</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="ep_contact" name="contact">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">所属镇街</label>
								<div class="col-sm-9">
									 <select class="form-control text-con" style="height:50px;" id="ep_cityNo" name="cityNo"></select>
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">企业状态</label>
								<div class="col-sm-9">
								  <select class="form-control input-sm text-con" style="height:34px;" id="en_enState" name="epState"></select>
								</div>
						 	</div>
						</form>
					 </div>
					 <div class="modal-footer">
						<button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="saveEntity('enterprise','upd')">
						   保存
						</button>
						<button type="button" class="btn btn-default" 
						   data-dismiss="modal">关闭
						</button>
					 </div>
				  </div><!-- /.modal-content -->
				</div>
			</div>
			<!--模态框1_2-->
			<!--模态框2_1-->
			<div class="modal fade" id="carAddForm" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">
						 新增
						</h4>
					 </div>
					 <div class="modal-body">
						<form id="carSaveForm" class="form-horizontal" role="form">
							<div class="form-group">
								<label class="col-sm-3 control-label">车牌号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="carNo">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">车牌颜色</label>
								<div class="col-sm-9">
									<!-- <input class="form-control"  type="text" value="" name="carColor"> -->
								  <select class="form-control input-sm text-con" style="height:34px;" name="carColor" id="carAddColor">
								  </select>
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">业户名称</label>
								<div class="col-sm-9">
								  <select class="form-control input-sm text-con" id="epNo" name="epNo" style="height:34px;" onchange="changeEpName(this,'carAddEpName')"></select>
								  <input class="form-control"  type="hidden" value="" name="epName" id="carAddEpName">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">道路运输证号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="transportNo">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">经营范围</label>
								<div class="col-sm-9">
									<input class="form-control"  type="text" value="" name="scopeName">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">车辆类别</label>
								<div class="col-sm-9">
									<input class="form-control"  type="text" value="" name="carTypeName">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">品牌型号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="brandNo">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">车架号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="vin">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">发动机号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="engineNo">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">发动机型号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="engineStyle">
								</div>
						 	</div>
						 	<div class="form-group">
								<label for="carState" class="col-sm-3 control-label">车辆状态</label>
								<div class="col-sm-9">
								  <select class="form-control input-sm text-con" name="carState" style="height:34px;" id="carAddState"></select>
								</div>
							</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">行驶证注册日期</label>
								<div class="col-sm-9">
								  <input class="form-control" type="text" id="add_regDate" name="regDate">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">强制报废日期</label>
								<div class="col-sm-9">
								  <input class="form-control" type="text" id="add_scrapDate" name="scrapDate">
								</div>
						 	</div>
						</form>
					 </div>
					 <div class="modal-footer">
						<button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="saveEntity('car','save')">
						   保存
						</button>
						<button type="button" class="btn btn-default" 
						   data-dismiss="modal" onclick="emptyFn()">关闭
						</button>
					 </div>
				  </div><!-- /.modal-content -->
				</div>
			</div>
			<!--模态框2_1-->
			<!--模态框2_2-->
			<div class="modal fade" id="carChangeForm" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">
						 修改
						</h4>
					 </div>
					 <div class="modal-body">
						<form id="carUpdForm" class="form-horizontal" role="form">
							<div class="form-group">
								<label class="col-sm-3 control-label">车牌号</label>
								<div class="col-sm-9">
								  <input type="hidden" value="" id="car_id" name="id">
								  <input class="form-control"  type="text" value="" id="car_carNo" name="carNo">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">车牌颜色</label>
								<div class="col-sm-9">
									<!-- <input class="form-control"  type="text" value="" id="car_carColor" name="carColor"> -->
									<select class="form-control input-sm text-con" id="car_carColor" style="height:34px;" name="carColor">
									  	
								  	</select>
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">业户名称</label>
								<div class="col-sm-9">
								  <select class="form-control input-sm text-con" id="car_epNo" style="height:34px;" name="epNo" onchange="changeEpName(this,'car_epName')"></select>
								  <input class="form-control"  type="hidden" value="" id="car_epName" name="epName">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">道路运输证号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="car_transportNo" name="transportNo">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">经营范围</label>
								<div class="col-sm-9">
									<input class="form-control"  type="text" value="" id="car_scopeName" name="scopeName">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">车辆类别</label>
								<div class="col-sm-9">
									<input class="form-control"  type="text" value="" id="car_carType" name="carTypeName">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">品牌型号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="car_brandNo" name="brandNo">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">车架号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="car_vin" name="vin">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">发动机号</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="car_engineNo" name="engineNo">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">发动机型号</label>
								<div class="col-sm-9">
								  <input class="form-control" value="" id="car_engineStyle" name="engineStyle">
								</div>
						 	</div>
						 	<div class="form-group">
								<label for="carState" class="col-sm-3 control-label">车辆状态</label>
								<div class="col-sm-9">
								  <select class="form-control input-sm text-con" id="car_carState" name="carState" style="height:34px;"></select>
								</div>
							</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">行驶证注册日期</label>
								<div class="col-sm-9">
								  <input class="form-control" type="text" value="" id="car_regDate" name="regDate">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">强制报废日期</label>
								<div class="col-sm-9">
								  <input class="form-control" type="text" value="" id="car_scrapDate" name="scrapDate">
								</div>
						 	</div>
						</form>
					 </div>
					 <div class="modal-footer">
						<button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="saveEntity('car','upd')">
						   保存
						</button>
						<button type="button" class="btn btn-default" 
						   data-dismiss="modal">关闭
						</button>
					 </div>
				  </div><!-- /.modal-content -->
				</div>
			</div>
			<!--模态框2_2-->
			
			<!--模态框3_1 驾驶员-->
			<div class="modal fade" id="empAddForm" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">
						 新增
						</h4>
					 </div>
					 <div class="modal-body">
						<form class="form-horizontal" role="form">	
							<div>
								<div class="form-group">
								<label class="col-sm-3 control-label">请选择人员属性：</label>
								<div class="col-sm-9">
								  <select class="select form-control input-sm" id="selxz" >
								  	<option value="0">请选择</option>
								  	<option value="1">驾驶员</option>
								  	<option value="2">装卸管理人员</option>
								  	<option value="3">押运员</option>
								  </select>
								</div>
						 	</div>
							</div>
						</form>	
							
						<form id="driverSaveForm" class="form-horizontal" role="form">
								<div id="add_driver" style="display: none;" >	
								<div class="form-group">
									<label class="col-sm-3 control-label">姓名：</label>
									<div class="col-sm-9">
									  <input type="hidden" value="" id="driver_pro" name="properties">
									 
									
									 <input class="form-control"  type="text" value="" name="name" >
									  
									</div>
							 	</div>	
								<div class="form-group">
									<label class="col-sm-3 control-label">身份证号：</label>
									<div class="col-sm-9">
									  <input class="form-control"  type="text" value="" name="identityNo" id="driverIdentityNo" onblur="validateIdentityNo(this,'driverIdentityNo')">
									</div>
							 	</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">联系电话：</label>
									<div class="col-sm-9">
									  <input class="form-control"  type="text" value="" name="phone">
									</div>
							 	</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">户籍所在省：</label>
									<div class="col-sm-9">
									  <select class="select form-control input-sm" name="provinceNo" id="driverProvince" onchange="changeCity(this,'driverCity')"></select>
									</div>
							 	</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">户籍所在市：</label>
									<div class="col-sm-9">
									  <select class="select form-control input-sm" name="cityNo" id="driverCity"></select>
									</div>
							 	</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">企业名称：</label>
									<div class="col-sm-9">
									  <select class="select form-control input-sm" name="epNo" id="driverEpNo" onclick="changeEpName(this,'driverepName')"></select>
									  <input class="form-control"  type="hidden" value="" name="epName" id="driverepName">
									</div>
							 	</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">从业资格证号：</label>
									<div class="col-sm-9">
									  <input class="form-control"  type="text" value="" name="certificateNo">
									</div>
							 	</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">从业资格类别</label>
									<div class="col-sm-9">
										<input class="form-control"  type="text" value="" name="empTypeName">
									</div>
							 	</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">准驾车型：</label>
									<div class="col-sm-9">
										<input class="form-control"  type="text" value="" name="carTypeName">
									</div>
							 	</div>
							 	<div class="form-group">
									<label for="empState" class="col-sm-3 control-label">人员状态</label>
									<div class="col-sm-9">
									  <select class="form-control input-sm text-con" name="empState" style="height:34px;" id="driverState"></select>
									</div>
								</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">初领从业资格证时间</label>
									<div class="col-sm-9">
									  <input class="form-control" id="add_certificateDate"  type="text" value="" name="certificateDate">
									</div>
							 	</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">初领驾驶证日期：</label>
									<div class="col-sm-9">
									  <input class="form-control"  id="add_driveDate" type="text" value="" name="driveDate">
									</div>
							 	</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">入职时间：</label>
									<div class="col-sm-9">
									  <input class="form-control" id="add_checkinDate"  type="text" value="" name="checkinDate">
									</div>
							 	</div>
						 	</div>
						 	</form>
						 	
						 	<form id="managerSaveForm" class="form-horizontal" role="form">
						 	<!--管理员-->
						 	<div id="add_manager" style="display: none;">
						 		<div class="form-group">
								<label class="col-sm-3 control-label">姓名：</label>
								<div class="col-sm-9">
								  <input type="hidden" value="" id="manager_pro" name="properties">
								  <input class="form-control"  type="text" value="" name="name">
								</div>
						 	</div>
						 	<div class="form-group" >
								<label class="col-sm-3 control-label">身份证号：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="identityNo" id="managerIdentityNo" onblur="validateIdentityNo(this,'managerIdentityNo')">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">联系电话：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="phone">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">户籍所在省：</label>
								<div class="col-sm-9">
								  <select class="select form-control input-sm" name="provinceNo" id="managerProvince" onchange="changeCity(this,'managerCity')"></select>
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">户籍所在市：</label>
								<div class="col-sm-9">
								  <select class="select form-control input-sm" name="cityNo" id="managerCity"></select>
								</div>
						 	</div>
							<!--2016-12-15修改-->
						 	<div class="form-group">
								<label class="col-sm-3 control-label">企业名称：</label>
								<div class="col-sm-9">
								  <select class="select form-control input-sm" name="epNo" id="managerepNo" onclick="changeEpName(this,'addManagerEpNo')"></select>
								  <input class="form-control"  type="hidden" value="" name="epName" id="addManagerEpNo">	
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">从业资格证号：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="certificateNo">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">从业资格类别：</label>
								<div class="col-sm-9">
									<input class="form-control"  type="text" value="" name="empTypeName">
								</div>
						 	</div>
							<!--/-->
						 	<div class="form-group">
								<label for="empState" class="col-sm-3 control-label">人员状态</label>
								<div class="col-sm-9">
								  <select class="form-control input-sm text-con" name="empState" style="height:34px;" id="managerState"></select>
								</div>
							</div>
							<!--2016-12-15修改-->
							<div class="form-group">
								<label class="col-sm-3 control-label">初领从业资格证时间</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="manageradd_certificateDate" name="certificateDate">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">入职时间：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="manageradd_checkinDate" name="checkinDate">
								</div>
						 	</div>
						 	</div>
						 	</form>
						 	
						 	<form id="stevedorerSaveForm" class="form-horizontal" role="form">
						 	<!--装卸、押运人员-->
						 	<div id="add_stevedorer" style="display: none;">
						 		<div class="form-group">
								<label class="col-sm-3 control-label">姓名：</label>
								<div class="col-sm-9">
								  <input type="hidden" value="" id="stevedorer_pro" name="properties">
								  <input class="form-control"  type="text" value="" name="name">
								</div>
						 	</div>
							<div class="form-group" >
								<label class="col-sm-3 control-label">身份证号：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="identityNo" id="stevedorerIdentityNo" onblur="validateIdentityNo(this,'stevedorerIdentityNo')">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">联系电话：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="phone">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">户籍所在省：</label>
								<div class="col-sm-9">
								  <select class="select form-control input-sm" name="provinceNo" id="stevedorerProvince" onchange="changeCity(this,'stevedorerCity')"></select>
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">户籍所在市：</label>
								<div class="col-sm-9">
								  <select class="select form-control input-sm" name="cityNo" id="stevedorerCity"></select>
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">企业名称：</label>
								<div class="col-sm-9">
								  <select class="select form-control input-sm" name="epNo" id="stevedorerepNo" onclick="changeEpName(this,'addStevedorerEpNo')"></select>
								  <input class="form-control"  type="hidden" value="" name="epName" id="addStevedorerEpNo">	
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">从业资格证号：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" name="certificateNo">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">从业资格类别：</label>
								<div class="col-sm-9">
									<input class="form-control"  type="text" value="" name="empTypeName">
								</div>
						 	</div>
						 	<div class="form-group">
								<label for="empState" class="col-sm-3 control-label">人员状态</label>
								<div class="col-sm-9">
								  <select class="form-control input-sm text-con" name="empState" style="height:34px;" id="stevedorerState"></select>
								</div>
							</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">初领从业资格证时间</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="stevedoreradd_certificateDate" name="certificateDate">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">入职时间：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="stevedoreradd_checkinDate" name="checkinDate">
								</div>
						 	</div>
						 	</div>
						</form>
					 </div>	
					 <div class="modal-footer">
						<button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="saveEntity('emp','save');">
						   保存
						</button>
						<button type="button" class="btn btn-default" 
						   data-dismiss="modal" onclick="emptyFn()">关闭
						</button>
					 </div>
				  </div><!-- /.modal-content -->
				</div>
			</div>
			<!--模态框3_1-->
			<!--模态框3_2-->
			<div class="modal fade" id="empChangeForm" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">
						 修改
						</h4>
					 </div>
					 <div class="modal-body">
						<form id="empUpdateForm" class="form-horizontal" role="form">
							<input type="hidden" value="" id="emp_id" name="id">
							<input type="hidden" value="" id="emp_properties" name="properties">
							<div id="driver" style="display: none;" >	
							
								<div class="form-group">
									<label class="col-sm-3 control-label">姓名：</label>
									<div class="col-sm-9">
									  <input class="form-control"  type="text" value="" id="emp_name" name="name">
									</div>
							 	</div>	
								<div class="form-group">
									<label class="col-sm-3 control-label">身份证号：</label>
									<div class="col-sm-9">
									  <input class="form-control"  type="text" value="" id="emp_identityNo" name="identityNo" onblur="validateIdentityNo(this,'emp_identityNo')">
									</div>
							 	</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">联系电话：</label>
									<div class="col-sm-9">
									  <input class="form-control"  type="text" value="" id="emp_phone" name="phone">
									</div>
							 	</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">户籍所在省：</label>
									<div class="col-sm-9">
										 <select class="select form-control" id="emp_provinceNo" name="provinceNo" onchange="changeCity(this,'emp_cityNo')"></select>
									</div>
							 	</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">户籍所在市</label>
									<div class="col-sm-9">
									  <select class="select form-control" id="emp_cityNo" name="cityNo"></select>
									</div>
							 	</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">企业名称：</label>
									<div class="col-sm-9">
									  <select class="select form-control input-sm" id="emp_epNo" name="epNo" onclick="changeEpName(this,'emp_epName')"></select>
									  <input type="hidden" value="" id="emp_epName" name="epName">
									</div>
							 	</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">从业资格证号：</label>
									<div class="col-sm-9">
									  <input class="form-control"  type="text" value="" id="emp_certificateNo" name="certificateNo">
									</div>
							 	</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">从业资格类别</label>
									<div class="col-sm-9">
										<input class="form-control"  type="text" value="" id="emp_empType" name="empTypeName">
									</div>
							 	</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">准驾车型：</label>
									<div class="col-sm-9">
										<input class="form-control"  type="text" value="" id="emp_carTpye" name="carTypeName">
									</div>
							 	</div>
							 	<div class="form-group">
									<label for="empState" class="col-sm-3 control-label">人员状态</label>
									<div class="col-sm-9">
									  <select class="form-control input-sm text-con" id="emp_empState" name="empState" style="height:34px;"></select>
									</div>
								</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">初领从业资格证时间</label>
									<div class="col-sm-9">
									  <input class="form-control" type="text" value="" id="emp_certificateDate" name="certificateDate">
									</div>
							 	</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">初领驾驶证日期：</label>
									<div class="col-sm-9">
									  <input class="form-control" type="text" value="" id="emp_driveDate" name="driveDate">
									</div>
							 	</div>
							 	<div class="form-group">
									<label class="col-sm-3 control-label">入职时间：</label>
									<div class="col-sm-9">
									  <input class="form-control" type="text" value="" id="emp_checkinDate" name="checkinDate">
									</div>
							 	</div>
						 	</div>
						 	</form>						 	
						 	<form id="managerUpdateForm" class="form-horizontal" role="form">
							<input type="hidden" value="" id="manager_id" name="id">
							<input type="hidden" value="" id="manager_properties" name="properties">
						 	<!--管理员-->
						 	<div id="manager" style="display: none;">
						 		<div class="form-group">
								<label class="col-sm-3 control-label">姓名：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="manager_name" name="name">
								</div>
						 	</div>
						 	<div class="form-group" >
								<label class="col-sm-3 control-label">身份证号：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="manager_identityNo" name="identityNo" onblur="validateIdentityNo(this,'manager_identityNo')">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">联系电话：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="manager_phone" name="phone">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">户籍所在省：</label>
								<div class="col-sm-9">
								  <select class="select form-control" id="manager_provinceNo" name="provinceNo" onchange="changeCity(this,'manager_cityNo')"></select>
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">户籍所在市</label>
								<div class="col-sm-9">
								  <select class="select form-control" id="manager_cityNo" name="cityNo"></select>
								</div>
						 	</div>
							<!--2016-12-15修改-->
						 	<div class="form-group">
								<label class="col-sm-3 control-label">企业名称：</label>
								<div class="col-sm-9">
								  <select class="select form-control input-sm" id="manager_epNo" name="epNo" onclick="changeEpName(this,'manager_epName')"></select>
								  <input type="hidden" value=" " id="manager_epName" name="epName">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">从业资格证号：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="manager_certificateNo" name="certificateNo">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">从业资格类别：</label>
								<div class="col-sm-9">
									<input class="form-control"  type="text" value="" id="manager_empType" name="empTypeName">
								</div>
						 	</div>
							<!--/-->
						 	<div class="form-group">
								<label for="empState" class="col-sm-3 control-label">人员状态</label>
								<div class="col-sm-9">
								  <select class="form-control input-sm text-con" id="manager_empState" name="empState" style="height:34px;"></select>
								</div>
							</div>
							<!--2016-12-15修改-->
							<div class="form-group">
								<label class="col-sm-3 control-label">初领从业资格证时间</label>
								<div class="col-sm-9">
								  <input class="form-control" type="text" value="" id="manager_certificateDate" name="certificateDate">
								</div>
						 	</div>
							<!--/-->
						 	<div class="form-group">
								<label class="col-sm-3 control-label">入职时间：</label>
								<div class="col-sm-9">
								  <input class="form-control" type="text" value="" id="manager_checkinDate" name="checkinDate">
								</div>
						 	</div>
						 	</div>
						 	</form>
						 	<form id="stevedorerUpdateForm" class="form-horizontal" role="form">
							<input type="hidden" value="" id="stevedorer_id" name="id">
							<input type="hidden" value="" id="stevedorer_properties" name="properties">
						 	<!--装卸、押运人员-->
						 	<div id="stevedorer" style="display: none;">
						 		<div class="form-group">
								<label class="col-sm-3 control-label">姓名：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="stevedorer_name" name="name">
								</div>
						 	</div>
							<div class="form-group" >
								<label class="col-sm-3 control-label">身份证号：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="stevedorer_identityNo" name="identityNo" onblur="validateIdentityNo(this,'stevedorer_identityNo')">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">联系电话：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="stevedorer_phone" name="phone">
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">户籍所在省：</label>
								<div class="col-sm-9">
								  <select class="select form-control" id="stevedorer_provinceNo" name="provinceNo" onchange="changeCity(this,'stevedorer_cityNo')"></select>
								</div>
						 	</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">户籍所在市</label>
								<div class="col-sm-9">
								  <select class="select form-control" id="stevedorer_cityNo" name="cityNo"></select>
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">企业名称：</label>
								<div class="col-sm-9">
								  <select class="select form-control input-sm" id="stevedorer_epNo" name="epNo" onclick="changeEpName(this,'stevedorer_epName')"></select>
								  <input type="hidden" value=" " id="stevedorer_epName" name="epName">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">从业资格证号：</label>
								<div class="col-sm-9">
								  <input class="form-control"  type="text" value="" id="stevedorer_certificateNo" name="certificateNo">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">从业资格类别：</label>
								<div class="col-sm-9">
									<input class="form-control"  type="text" value="" id="stevedorer_empType" name="empTypeName">
								</div>
						 	</div>
						 	<div class="form-group">
								<label for="stevedorer_empState" class="col-sm-3 control-label">人员状态</label>
								<div class="col-sm-9">
								  <select class="form-control input-sm text-con" id="stevedorer_empState" name="empState" style="height:34px;"></select>
								</div>
							</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">初领从业资格证时间</label>
								<div class="col-sm-9">
								  <input class="form-control" type="text" value="" id="stevedorer_certificateDate" name="certificateDate">
								</div>
						 	</div>
						 	<div class="form-group">
								<label class="col-sm-3 control-label">入职时间：</label>
								<div class="col-sm-9">
								  <input class="form-control" type="text" value="" id="stevedorer_checkinDate" name="checkinDate">
								</div>
						 	</div>
						 	</div>
						</form>
					 </div>
					 <div class="modal-footer">
						<button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="saveEntity('emp','upd')">
						   保存
						</button>
						<button type="button" class="btn btn-default"  data-dismiss="modal" onclick="hideButton()">关闭</button>
					 </div>
				  </div><!-- /.modal-content -->
				</div>
			</div>
			<!--模态框3_2-->

			<!--企业导入-->
			<div class="modal fade" id="epImport" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">
						   选择导入文件
						</h4>
					 </div>
					 <div class="modal-body">
					 	<input id="epExcel" type="file" name="epExcel" class="emptyFile" style="display:none">
						<label>选择导入文件：</label><a class="btn btn-primary" onclick="$('input[id=epExcel]').click();">导入</a>
						<span id="enLeadFile" class="input-large"></span>
					 </div>
					 <div class="modal-footer">
						<button type="button" class="btn btn-primary" 
						   data-dismiss="modal" onclick="enterpriseExcelImport()">保存
						</button>
						<button type="button" class="btn btn-default" 
						   data-dismiss="modal" onclick="LeadFileEmpty()">关闭
						</button>
					 </div>
				  </div><!-- /.modal-content -->
				</div>
			</div>	
			<!--企业导入-->
			<!-- 车辆导入 begin -->
			<div class="modal fade" id="carImport" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">
						   选择导入文件
						</h4>
					 </div>
					 <div class="modal-body">
					 	<input id="carExcel" type="file" name="carExcel" class="emptyFile" style="display:none">
						<label>选择导入文件：</label><a class="btn btn-primary" onclick="$('input[id=carExcel]').click();">导入</a>
						<span id="carLeadFile" class="input-large"></span>
					 </div>
					 <div class="modal-footer">
						<button type="button" class="btn btn-primary" 
						   data-dismiss="modal" onclick="carExcelImport()">保存
						</button>
						<button type="button" class="btn btn-default" 
						   data-dismiss="modal" onclick="LeadFileEmpty()">关闭
						</button>
					 </div>
				  </div><!-- /.modal-content -->
				</div>
			</div>
			<!-- 车辆导入 end -->
			
			<!-- 人员导入 begin -->
			<div class="modal fade" id="employeeImport" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">
						   选择导入文件
						</h4>
					 </div>
					 <div class="modal-body">
					 	<input id="employeeExcel" type="file" name="employeeExcel" class="emptyFile" style="display:none">
						<label>选择导入文件：</label><a class="btn btn-primary" onclick="$('input[id=employeeExcel]').click();">导入</a>
						<span id="empLeadFile" class="input-large"></span>
					 </div>
					 <div class="modal-footer">
						<button type="button" class="btn btn-primary" 
						   data-dismiss="modal" onclick="employeeExcelImport()">保存
						</button>
						<button type="button" class="btn btn-default" 
						   data-dismiss="modal" onclick="LeadFileEmpty()">关闭
						</button>
					 </div>
				  </div><!-- /.modal-content -->
				</div>
			</div>
			<!-- 人员导入 end -->
			<!-- 企业监管信息 -->
			<div class="modal fade" id="epRegulatoryInfo" tabindex="-1" role="dialog" 
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
				  <div class="modal-content">
					 <div class="modal-header">
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
						 					<input id="monthYLRecoder" type="file" name="recorder" style="display:none" class="emptyFile">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=monthYLRecoder]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 			<tr>
					 					<td colspan="4"><span id="monthYLUp" class="input-large"></span></td>
					 				</tr>
						 			<tr>
						 				<td id="monthXC" class="zhankai col-sm-1 col-md-1" onclick="getRecordInfo('6',this)"></td>
						 				<td>月度安全生产巡查记录</td>
						 				<td>
						 					<input id="monthXCRecoder" type="file" name="monthXCRecorder" style="display:none" class="emptyFile">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=monthXCRecoder]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 			<tr>
					 					<td colspan="4"><span id="monthXCUp" class="input-large"></span></td>
					 				</tr>
						 			<tr>
						 				<td id="seasonXC" class="zhankai col-sm-1 col-md-1" onclick="getRecordInfo('7',this)"></td>
						 				<td>季度安全生产巡查记录</td>
						 				<td>
						 					<input id="seasonXCRecorder" type="file" name="seasonRecorder" style="display:none" class="emptyFile">
	                                        <div class="input-append" >
	                                           <a class="label label-primary" onclick="$('input[id=seasonXCRecorder]').click();">上传</a>
	                                        </div>
						 				</td>
						 			</tr>
						 			<tr>
					 					<td colspan="4"><span id="seasonXCUp" class="input-large"></span></td>
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
											<a href="#">首页</a>
										</li>
										<li>
											<a href="#">危运行业档案管理系统</a>
										</li>
										
									</ul>
									<!-- /BREADCRUMBS -->
									<div class="clearfix">
										<h3 class="content-title pull-left">危运行业档案管理系统</h3>
									</div>
									<!-- <div class="description">Tabs and Accordions</div> -->
								</div>
							</div>
						</div>
						<!-- /PAGE HEADER -->
						<!-- TOOLTIPS ETC -->
						<div class="row">
							<!-- TOOLTIPS -->
							<div class="col-md-6">
								<div class="box border blue">
									<div class="box-title">
										<h4><i class="fa fa-search"></i>搜索</h4>
									</div>
									<div class="box-body">
										<div class="tabbable header-tabs">
										  <ul class="nav nav-tabs">
											 <li><a href="#box_tab6" data-toggle="tab" onclick="iniSearch('emp')"><i class="fa fa-users"></i> <span class="hidden-inline-mobile">人员</span></a></li>
											 <li><a href="#box_tab5" data-toggle="tab" onclick="iniSearch('car')"><i class="fa fa-truck"></i> <span class="hidden-inline-mobile">车辆</span></a></li>
											 <li class="active"><a href="#box_tab4" data-toggle="tab" onclick="iniSearch('enterprise')"><i class="fa fa-building-o"></i> <span class="hidden-inline-mobile">企业</span></a></li>
										  </ul>
										  <div class="tab-content">
											 <div class="tab-pane fade in active" id="box_tab4">
											 	<form class="form-horizontal" role="form" id="searchForm">
												  <div class="form-group">
													<label for="input1" class="col-sm-3 control-label">业户名称</label>
													<div class="col-sm-9">
													  <input type="text" class="form-control" id="epName" name="epName" placeholder="请输入业户名称">
													</div>
												  </div>
												  <div class="form-group">
													<label for="input3" class="col-sm-3 control-label">道路经营许可证</label>
													<div class="col-sm-9">
													  <input type="text" class="form-control" id="tpLicence" name="tpLicence" placeholder="请输入道路经营许可证">
													</div>
												  </div>
												  <div class="form-group">
													<label for="input4" class="col-sm-3 control-label" >所属镇街</label>
													<div class="col-sm-9">
														  <select class="form-control input-sm text-con" id="cityNo" name="cityNo" style="height:34px;"></select>
													</div>
												  </div>
												  <div class="form-group">
													<label for="input6" class="col-sm-3 control-label">企业状态</label>
													<div class="col-sm-9">
													  <select class="form-control input-sm text-con" id="enState" name="epState" style="height:34px;"></select>
													</div>
												  </div>
												  <div class="form-group">
													<div class="col-sm-offset-5 col-sm-10">
													  <a type="button" class="btn btn-primary" id="search1" onclick="searchByKey('searchForm')"><i class="fa fa-search"></i>搜索</a>
													</div>
												  </div>
												</form>
											 </div>
											 <div class="tab-pane fade" id="box_tab5">
											 	<form class="form-horizontal" role="form" id="carForm">
												 <div class="form-group">
													<label for="input7" class="col-sm-3 control-label">车牌号</label>
													<div class="col-sm-9">
													  <input type="text" class="form-control" id="carNo" name="carNo" placeholder="请输入车牌号">
													</div>
												  </div>
												  <div class="form-group">
													<label for="input8" class="col-sm-3 control-label">道路运输证号</label>
													<div class="col-sm-9">
													  <input type="text" class="form-control" id="transportNo" name="transportNo" placeholder="请输入道路运输证号">
													</div>
												  </div>
												  <div class="form-group">
													<label for="carColor" class="col-sm-3 control-label">车牌颜色</label>
													<div class="col-sm-9">
													  <select class="form-control input-sm text-con" id="carColor" name="carColor" style="height:34px;"></select>
													  <!--<input type="text" class="form-control" id="carColor" name="carColor" placeholder="请输入车牌颜色"> -->
													</div>
												  </div>
												  <div class="form-group">
													<label for="epName" class="col-sm-3 control-label">业户名称</label>
													<div class="col-sm-9">
													  <input type="text" class="form-control" id="epName" name="epName" placeholder="请输入业户名称">
													</div>
												  </div>
												  <div class="form-group">
													<label for="input6" class="col-sm-3 control-label">车辆状态</label>
													<div class="col-sm-9">
													  <select class="form-control input-sm text-con" id="carState" name="carState" style="height:34px;"></select>
													</div>
												  </div>
												  <div class="form-group">
													<div class="col-sm-offset-5 col-sm-10">
													  <a type="button" class="btn btn-primary"  id="search2" onclick="searchByKey('carForm')"><i class="fa fa-search"></i>搜索</a>
													</div>
												  </div>
												</form>
											 </div>
											 <div class="tab-pane fade" id="box_tab6">
											 	<form class="form-horizontal" role="form" id="empForm">
												 <div class="form-group">
													<label for="input11" class="col-sm-3 control-label">姓名</label>
													<div class="col-sm-9">
													  <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
													</div>
												  </div>
												  <div class="form-group">
													<label for="epName" class="col-sm-3 control-label">业户名称</label>
													<div class="col-sm-9">
													  <input type="text" class="form-control"  name="epName" placeholder="请输入业户名称">
													</div>
												  </div>
												  <div class="form-group">
													<label for="input13" class="col-sm-3 control-label">身份证号</label>
													<div class="col-sm-9">
													  <input type="text" class="form-control" id="identityNo" name="identityNo" placeholder="请输入身份证号">
													</div>
												  </div>
												  <div class="form-group">
													<label for="cityNo" class="col-sm-3 control-label" >所属镇街</label>
													<div class="col-sm-9">
														<select class="form-control input-sm text-con" name="cityNo" id="empSearchCityNo" style="height:34px;"></select>
													</div>
												  </div>
												  <div class="form-group">
													<label for="input6" class="col-sm-3 control-label">人员状态</label>
													<div class="col-sm-9">
													  <select class="form-control input-sm text-con" id="empState" name="empState" style="height:34px;"></select>
													</div>
												  </div>
												  <div class="form-group">
													<label for="input6" class="col-sm-3 control-label">人员属性</label>
													<div class="col-sm-9">
													  <select class="form-control input-sm text-con" id="empProperties" name="properties" style="height:34px;">
													  	<option value="0">请选择</option>
													  	<option value="1">驾驶员</option>
													  	<option value="2">装卸管理人员</option>
													  	<option value="3">押运员</option>
													  </select>
													</div>
												  </div>
												  <div class="form-group">
													<div class="col-sm-offset-5 col-sm-10">
													  <a type="button" class="btn btn-primary"  id="search3" onclick="searchByKey('empForm')"><i class="fa fa-search"></i>搜索</a>
													</div>
												  </div>
												</form>
											 </div>
										  </div>
									   </div>
										
									</div>
								</div>			
							</div>
							<!-- /TOOLTIPS -->
							<div class="col-md-6">
								<div class="box border blue">
									<div class="box-title">
										<h4 class="hidden-xs"><i class="fa fa-dollar"></i>重点待办通知</h4>
									</div>
									<div class="box-body">
										<div class="tabbable header-tabs">
										  <ul class="nav nav-tabs">
											 <li><a href="#" id="empInform" data-toggle="tab" class="aPdding" onclick="getTaskInfo('empInform','3')"><i class="fa fa-users"></i> <span class="hidden-inline-mobile">人员</span><span class="badge pull-right"><span id="empNum"></span></span></a></li>
											 <li><a href="#" id="carInform" data-toggle="tab" class="aPdding" onclick="getTaskInfo('carInform','2')"><i class="fa fa-truck"></i> <span class="hidden-inline-mobile">车辆</span><span class="badge pull-right"><span id="carNum"></span></span></a></li>
											 <li class="active"><a href="#" id="epInform" data-toggle="tab" class="aPdding" onclick="getTaskInfo('epInform','1')"><i class="fa fa-building-o"></i> <span class="hidden-inline-mobile">企业</span><span class="badge pull-right"><span id="epNum"></span></span></a></li>
										  </ul>
										  <div class="tab-content">
											 <div class="tab-pane fade in active" id="epTaskDiv">
											 	<div class="scroller" data-height="350px" data-always-visible="1" data-rail-visible="1">
													  
												 </div>	
											 	</div>
											 <div class="tab-pane fade" id="carInform">
											 	<div class="scroller" data-height="350px" data-always-visible="1" data-rail-visible="1">
													  <div class="feed-activity clearfix">
														<div class="pull-left">
															<span class="record"><strong>xx</strong>  辆车辆未上传道路运输证</span>
															<p style="margin-top:5px;margin-bottom:0px;"><i class="fa fa-clock-o"></i> <abbr class="timeago" title="1分钟之前" >1分钟之前</abbr></p>
														</div>
														<p class="pull-right">
															<span class="label label-danger arrow-in-right">未上传</span>
														</p>
													  </div>
													  <div class="feed-activity clearfix">
														<div class="pull-left">
															<span class="record"><strong>xx</strong>  辆车辆未上传机动车行驶证</span>
															<p style="margin-top:5px;margin-bottom:0px;"><i class="fa fa-clock-o"></i> <abbr class="timeago" title="2分钟之前" >2分钟之前</abbr></p>
														</div>
														<p class="pull-right">
															<span class="label label-danger arrow-in-right">未上传</span>
														</p>
													  </div>
													  <div class="feed-activity clearfix">
														<div class="pull-left">
															<span class="record"><strong>xx</strong>  辆车辆未上传机动车登记证书</span>
															<p style="margin-top:5px;margin-bottom:0px;"><i class="fa fa-clock-o"></i> <abbr class="timeago" title="3分钟之前" >3分钟之前</abbr></p>
														</div>
														<p class="pull-right">
															<span class="label label-danger arrow-in-right">未上传</span>
														</p>
													  </div>
													  <div class="feed-activity clearfix">
														<div class="pull-left">
															<span class="record"><strong>xx</strong>  辆车辆未上传承运人责任险</span>
															<p style="margin-top:5px;margin-bottom:0px;"><i class="fa fa-clock-o"></i> <abbr class="timeago" title="4分钟之前" >4分钟之前</abbr></p>
														</div>
														<p class="pull-right">
															<span class="label label-danger arrow-in-right">未上传</span>
														</p>
													  </div>
													  <div class="feed-activity clearfix">
														<div class="pull-left">
															<span class="record"><strong>xx</strong>  辆车辆未上传环保标志</span>
															<p style="margin-top:5px;margin-bottom:0px;"><i class="fa fa-clock-o"></i> <abbr class="timeago" title="5分钟之前" >5分钟之前</abbr></p>
														</div>
														<p class="pull-right">
															<span class="label label-danger arrow-in-right">未上传</span>
														</p>
													  </div>
													  <div class="feed-activity clearfix">
														<div class="pull-left">
															<span class="record"><strong>xx</strong>  辆车辆未上传GPS接入证明</span>
															<p style="margin-top:5px;margin-bottom:0px;"><i class="fa fa-clock-o"></i> <abbr class="timeago" title="6分钟之前" >6分钟之前</abbr></p>
														</div>
														<p class="pull-right">
															<span class="label label-danger arrow-in-right">未上传</span>
														</p>
													  </div>
													  <div class="feed-activity clearfix">
														<div class="pull-left">
															<span class="record"><strong>xx</strong>  辆车辆的传道路运输证即将过期</span>
															<p style="margin-top:5px;margin-bottom:0px;"><i class="fa fa-clock-o"></i> <abbr class="timeago" title="6分钟之前" >7分钟之前</abbr></p>
														</div>
														<p class="pull-right">
															<span class="label label-warning arrow-in-right">即将过期</span>
														</p>
													  </div>
													  <div class="feed-activity clearfix">
														<div class="pull-left">
															<span class="record"><strong>xx</strong>  辆车辆的机动车行驶证即将过期</span>
															<p style="margin-top:5px;margin-bottom:0px;"><i class="fa fa-clock-o"></i> <abbr class="timeago" title="6分钟之前" >8分钟之前</abbr></p>
														</div>
														<p class="pull-right">
															<span class="label label-warning arrow-in-right">即将过期</span>
														</p>
													  </div>
													  <div class="feed-activity clearfix">
														<div class="pull-left">
															<span class="record"><strong>xx</strong>  辆车辆的机动车登记证书即将过期</span>
															<p style="margin-top:5px;margin-bottom:0px;"><i class="fa fa-clock-o"></i> <abbr class="timeago" title="6分钟之前" >9分钟之前</abbr></p>
														</div>
														<p class="pull-right">
															<span class="label label-warning arrow-in-right">即将过期</span>
														</p>
													  </div>
													  <div class="feed-activity clearfix">
														<div class="pull-left">
															<span class="record"><strong>xx</strong>  辆车辆的承运人责任险即将过期</span>
															<p style="margin-top:5px;margin-bottom:0px;"><i class="fa fa-clock-o"></i> <abbr class="timeago" title="6分钟之前" >10分钟之前</abbr></p>
														</div>
														<p class="pull-right">
															<span class="label label-warning arrow-in-right">即将过期</span>
														</p>
													  </div>
													  <div class="feed-activity clearfix">
														<div class="pull-left">
															<span class="record"><strong>xx</strong>  辆车辆的环保标志即将过期</span>
															<p style="margin-top:5px;margin-bottom:0px;"><i class="fa fa-clock-o"></i> <abbr class="timeago" title="6分钟之前" >11分钟之前</abbr></p>
														</div>
														<p class="pull-right">
															<span class="label label-warning arrow-in-right">即将过期</span>
														</p>
													  </div>
												 </div>
											 </div>
											 <div class="tab-pane fade" id="empInform">
											 	<div class="scroller" data-height="350px" data-always-visible="1" data-rail-visible="1">
													 
												 </div>
											 </div>
										  </div>
									   </div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="separator"></div>
						<!-- /TOOLTIPS ETC -->
						<div class="row" id="dangan">
							<div class="col-md-12">
								<!-- BOX -->
								<div class="box border red">
									<div class="box-title">
										<h4><i class="fa fa-columns"></i><span class="hidden-inline-mobile">档案信息化管理</span></h4>
									</div>
									<div class="box-body">
										<div class="tabbable header-tabs">
										  <ul class="nav nav-tabs">
											 <li><a href="#box_tab3" id="empTab" data-toggle="tab" ><i class="fa fa-users"></i> <span class="hidden-inline-mobile">人员</span></a></li>
											 <li><a href="#box_tab2" id="carTab" data-toggle="tab" ><i class="fa fa-truck"></i> <span class="hidden-inline-mobile">车辆</span></a></li>
											 <li class="active"><a href="#box_tab1" id="enterpriceTab" data-toggle="tab" ><i class="fa fa-building-o"></i> <span class="hidden-inline-mobile">企业</span></a></li>
										  </ul>
										  <div class="tab-content">
											 <div class="tab-pane fade in active" id="box_tab1">
											 	<div class="col-sm-12">
											 		<form class="form-horizontal" role="form">
														<div class="form-group">
															<div class="col-md-12">
																<a class="btn btn-info ModalAddForm" data-toggle="modal" onclick="enterpriseAdd()"><i class="fa fa-plus"></i>新增</a>
						                                        <div class="input-append"  style="display:inline-block;">
						                                           <a class="btn btn-success" data-toggle="modal" id="enLead"><i class="fa fa-sign-in"></i>导入</a>
						                                        </div>
																<a href="#" class="btn btn-primary" id="enterpriseExport"><i class="fa fa-share"></i>导出</a>
																<a href="#" class="btn btn-purple" id="enterpriseModelExport" data-toggle="modal" data-target="#Modal2"><i class="fa fa-download"></i>模板下载</a>
																<a href="javascript:void(0)" class="btn btn-danger" id="enDelete" onclick="AdminDel('en')" style="display:none;"><i class="fa fa-times"></i>删除</a>
																<a href="javascript:void(0)" class="btn btn-danger" id="test" style="display:none;" ><i class="fa fa-times"></i>测试</a>
																<a href="javascript:void(0)" class="btn btn-danger" id="test4zhr" style="display:none;" ><i class="fa fa-times"></i>测试4zhr</a>
																<!--<c:forEach var="authority" items=" ${authorityList}">
																<input  value="${authority}">
																</c:forEach>-->
																
																
																
															</div>
														</div>
													</form>
											 	</div>
												<table id="example2" cellpadding="0" cellspacing="0" border="0" width="100%" class="display datatable table table-striped table-bordered table-hover">
											        <thead>
											            <tr>
											            	<th class="text-center"><input type="checkbox" class="checkAll2" onchange="checkAll2()"></th>
											                <th>序号</th>
											                <th class="col-sm-3">业户名称</th>
											                <th class="hidden-xs col-sm-3">经营地址</th>
											                <th class="hidden-xs">所属镇街</th>
											                <th>企业状态</th>
											                <th>操作</th>
											            	<th>查看更多</th>				                
											            </tr>
											        </thead>
											 		<tbody id="bodyList">
											 			
											 		</tbody>
											    </table>
											 </div>
											 <div class="tab-pane fade" id="box_tab2">
											 	<div class="col-sm-12">
											 		<form class="form-horizontal" role="form">
														<div class="form-group">
															<div class="col-md-12">
																<a class="btn btn-info ModalAddForm" data-toggle="modal" onclick="carAdd()"><i class="fa fa-plus"></i>新增</a>
																<div class="input-append"  style="display:inline-block;">
						                                           <a class="btn btn-success" data-toggle="modal" id="carLead"><i class="fa fa-sign-in"></i>导入</a>
						                                        </div>
																<a href="#" class="btn btn-primary" id="carExport"><i class="fa fa-share"></i>导出</a>
																<a href="#" class="btn btn-purple" id="carModelExport" data-toggle="modal" data-target="#Modal2"><i class="fa fa-download"></i>模板下载</a>
																<a href="javascript:void(0)" class="btn btn-danger" id="carDelete" onclick="AdminDel('car')"><i class="fa fa-times"></i>删除</a>
															</div>
														</div>
													</form>
											 	</div>
												<table id="example3" cellpadding="0" cellspacing="0" border="0" width="100%" class="display datatable table table-striped table-bordered table-hover">
											        <thead>
											            <tr>
											            	<th class="text-center"><input type="checkbox" class="checkAll3" onchange="checkAll3()"></th>
											                <th>序号</th>
											                <th>车牌号</th>
											                <th class="hidden-xs">车牌颜色</th>
											                <th class="hidden-xs">业户名称</th>
											                <th class="hidden-xs">道路运输证号</th>
											                <th>操作</th>
											            	<th>查看更多</th>				                
											            </tr>
											        </thead>
											 		<tbody id="carList">
											 			
											 		</tbody>
											    </table>
											 </div>
											 <div class="tab-pane fade" id="box_tab3">
											 	<div class="row">
											 		<div class="col-md-12">
													<!-- POPOVERS -->
													<form class="form-horizontal" role="form">
														<div class="form-group">
															<div class="col-md-12">
																<a class="btn btn-info ModalAddForm" data-toggle="modal" onclick="employeeAdd()"><i class="fa fa-plus"></i>新增</a>
																<div class="input-append"  style="display:inline-block;">
						                                           <a class="btn btn-success" data-toggle="modal" id="empLead"><i class="fa fa-sign-in"></i>导入</a>
						                                        </div>
																<a href="#" class="btn btn-primary" id="employeeExport"><i class="fa fa-share"></i>导出</a>
																<a href="#" class="btn btn-purple" id="employeeModelExport" data-toggle="modal" data-target="#Modal2"><i class="fa fa-download"></i>模板下载</a>
																<a href="javascript:void(0)" class="btn btn-danger" id="empDelete" onclick="AdminDel('emp')"><i class="fa fa-times"></i>删除</a>
															</div>
														</div>
													</form>
													<table id="example4" cellpadding="0" cellspacing="0" border="0" width="100%" class="display datatable table table-striped table-bordered table-hover">
															        <thead>
															            <tr>
															            	<th class="text-center"><input type="checkbox" class="checkAll4" onchange="checkAll4()"></th>
															                <th>序号</th>
															                <th>姓名</th>
															                <th>人员属性</th>
															                <th class="hidden-xs">身份证号</th>
															                <th class="hidden-xs">联系电话</th>
															                <th class="hidden-xs">户籍所在省</th>
															                <th class="hidden-xs">户籍所在市</th>
															                <th>镇街</th>
															                <th>操作</th>
															            	<th>查看更多</th>				                
															            </tr>
															        </thead>
															 		<tbody id="empList">
															 			
															 		</tbody>
															    </table>
														
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
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="<c:url value='/resources/js/jquery/jquery-2.0.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery/jquery.media.js'/>"></script>
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
	<script type="text/javascript" src="<c:url value='/resources/js/tween.js'/>"></script>
	<!-- check -->
	<script type="text/javascript" src="<c:url value='/resources/formvalidation-dist/js/formValidation.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/formvalidation-dist/js/language/zh_CN.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/formvalidation-dist/js/framework/bootstrap.js'/>"></script>
	<!-- COLORBOX -->
	<!--  <script src="<c:url value='/resources/js/formcheck.js'/>"></script>-->
	<script>
	var table;
	var table2;
	var table3;
	var table4;
	var table11;
	var reInfotable;//监管信息table
	var properties;
	var addproperty;
	var streetArr = new Array();//镇街数组
	var dicArr = new Array();//字典数组
	var colorArr = new Array();//颜色数组
	var carStateArr = new Array();//车辆状态数组
	var empStateArr = new Array();//员工状态数组
	var provinceArr = new Array();//省份数组
	var cityArr = new Array();//城市数组
	//点击搜索滚动条自动下落
	var dTop = $("#dangan").offset().top;

	$("#search1").click(function  () {
		tweenFn(dTop);
	})
	$("#search2").click(function  () {
		tweenFn(dTop);
	})
	$("#search3").click(function  () {
		tweenFn(dTop);
	})
	function getSt() {
		return $(document).scrollTop()//现在的位置
	}

	function tweenFn (change,Fn) {
		var start = getSt();
		var change = change;
		var t = 0;
		var endT = 30;
		
		var timer = setInterval(function(){
			t++;
			if (t>endT) {
				clearInterval(timer);
				Fn && Fn();
			}else{
				var l = Tween.Bounce.easeOut(t,start,change,endT);
				document.documentElement.scrollTop = l;
				document.body.scrollTop = l;
			}
		},30)

	}
		function iniDate(){
			$("#add_regDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#add_scrapDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#car_regDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#car_scrapDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#add_driveDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#add_checkinDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#emp_driveDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#emp_checkinDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#add_certificateDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#emp_certificateDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#manager_certificateDate").datepicker({dateFormat:'yy-mm-dd'});//2016-12-15修改
			$("#manager_checkinDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#stevedorer_certificateDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#stevedorer_checkinDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#manageradd_certificateDate").datepicker({dateFormat:'yy-mm-dd'});//2016-12-15修改
			$("#manageradd_checkinDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#stevedoreradd_certificateDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#stevedoreradd_checkinDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#tpDeadLine").datepicker({dateFormat:'yy-mm-dd'});
			$("#icDeadLine").datepicker({dateFormat:'yy-mm-dd'});
			$("#saveDeadLine").datepicker({dateFormat:'yy-mm-dd'});
			$("#emergencyDeadLine").datepicker({dateFormat:'yy-mm-dd'});
			$("#tranlicenceDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#carlicenceDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#carRegDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#insuranceDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#environTagDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#GPSDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#GPSInstallDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#specialReportDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#oilCastListDate").datepicker({dateFormat:'yy-mm-dd'});
			
			$("#contractDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#driverDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#certificateDate").datepicker({dateFormat:'yy-mm-dd'});
			$("#identityDate").datepicker({dateFormat:'yy-mm-dd'});
			
			//$(".validity").datepicker({dateFormat:'yy/mm/dd'});//附件有效期
		}

		jQuery(document).ready(function() {		
			App.setPage("tabs_accordions");  //Set current page
			App.init(); //Initialise plugins and elements
			iniDate();
			
			TaskInfoTime();
			function TaskInfoTime(){
				getTaskInfo('epInform','1');
				setTimeout(function(){
					getTaskInfo('empInform','3');
					getTaskInfo('carInform','2');
					getTaskInfo('epInform','1');
				},30000)
				
			}

			getCarColor();
			getCarState();
			getEmpState();
			getEpName();
			getProvince();
			getCity();
			getStreet();
			getEpState();
			
			
			//新增校验
			$(".ModalAddForm").on("click",function(){
					$('#epAddForm').on('hide.bs.modal', function() {
	                    $('#epAddForm')
	                        .hide()                            
	                        .formValidation('resetForm'); // Reset form 	
	                });
					$('#carAddForm').on('hide.bs.modal', function() {
	                    $('#carAddForm')
		                    .hide()                            
		                    .formValidation('resetForm'); // Reset form	
	                });
					$('#empAddForm').on('hide.bs.modal', function() {
	                    $('#empAddForm')
		                    .hide()                            
		                    .formValidation('resetForm'); // Reset form	
	                });				
			});
			//修改校验
				$('#enChangeForm').on('hide.bs.modal', function(e) {
                    $('#enChangeForm')
	                    .hide()                            
	                    .formValidation('resetForm'); // Reset form	
               	});
				$('#carChangeForm').on('hide.bs.modal', function() {
	                   $('#carChangeForm')
	                    .hide()                            
	                    .formValidation('resetForm'); // Reset form	
	            });
				$('#empChangeForm').on('hide.bs.modal', function() {
	                   $('#empChangeForm')
	                    .hide()                            
	                    .formValidation('resetForm'); // Reset form	
	            });
		});
		function detail(id,obj,name){
			var selectedObj;
			var tr = $(obj).closest('tr');
			if(name=="enterprise"){
				var url = "${ctx}/sys/enterpriceToupd";
				var data = {"id":id};
				$.post(url,data,function (data){
					selectedObj = data;
					if(typeof($("#eptr_"+selectedObj.id).html())=="undefined"){
			    		$("#streetList option").each(function(){
			    			if($(this).val()==selectedObj.cityNo){
			    				selectedObj.cityNo = $(this).text();
			    			}
			    		});
			    		$("#epState option").each(function(){
			    			if($(this).val()==selectedObj.epState){
			    				selectedObj.epState = $(this).text();
			    			}
			    		});
						$(tr).after(format2(selectedObj));
						$(obj).attr("class","shouqi col-sm-1 col-md-1");
					}else{
						
						$("#eptr_"+selectedObj.id).toggle();
					}
					if($("#eptr_"+selectedObj.id).is(":visible")){
						$(obj).attr("class","shouqi col-sm-1 col-md-1");
					}else{
						$(obj).attr("class","zhankai col-sm-1 col-md-1");
					}
				});
			}else if(name=="car"){
				var url = "${ctx}/sys/carToupd";
				var data = {"id":id};
				$.post(url,data,function (data){
					selectedObj = data;
					if(typeof($("#cartr_"+selectedObj.id).html())=="undefined"){
						var scope = selectedObj.scopeNo;
						var type = selectedObj.carType;
						var regDate = new Date(selectedObj.regDate);
						var scrapDate = new Date(selectedObj.scrapDate);
						
						$("#color option").each(function(){
			    			if($(this).val()==selectedObj.carColor){
			    				selectedObj.carColor = $(this).text();
			    			}
			    		});
			    		$("#carStates option").each(function(){
			    			if($(this).val()==selectedObj.carState){
			    				selectedObj.carState = $(this).text();
			    				//alert($(this).text());
			    			}
			    		});
						selectedObj.regDate = toDate(regDate.getFullYear(),regDate.getMonth(),regDate.getDate());
						selectedObj.scrapDate = toDate(scrapDate.getFullYear(),scrapDate.getMonth(),scrapDate.getDate());
						$(tr).after(format3(selectedObj));
						$(obj).attr("class","shouqi col-sm-1 col-md-1");
					}else{
						$("#cartr_"+selectedObj.id).toggle();
					}
					if($("#cartr_"+selectedObj.id).is(":visible")){
						$(obj).attr("class","shouqi col-sm-1 col-md-1");
					}else{
						$(obj).attr("class","zhankai col-sm-1 col-md-1");
					}
				});
			}else if(name=="emp"){
				var url = "${ctx}/sys/employeeToupd";
				var data = {"id":id};
				$.post(url,data,function (data){
					selectedObj = data;
					if(typeof($("#emptr_"+selectedObj.id).html())=="undefined"){
						var province = selectedObj.provinceNo;
						var city = selectedObj.cityNo;
						var empType = selectedObj.empType;
						var carTpye = selectedObj.carTpye;
						var certificateDate = "";
						if(selectedObj.certificateDate!=""){
							certificateDate = new Date(selectedObj.certificateDate);
							selectedObj.certificateDate = toDate(certificateDate.getFullYear(),certificateDate.getMonth(),certificateDate.getDate());
						}
						var driveDate = "";
						if(selectedObj.driveDate !=""){
							driveDate = new Date(selectedObj.driveDate);
							selectedObj.driveDate = toDate(driveDate.getFullYear(),driveDate.getMonth(),driveDate.getDate());
						}
						var checkinDate = "";
						if(selectedObj.checkinDate != ""){
							checkinDate = new Date(selectedObj.checkinDate);
							selectedObj.checkinDate = toDate(checkinDate.getFullYear(),checkinDate.getMonth(),checkinDate.getDate());
						}
						
						if(selectedObj.properties=="1"){
							selectedObj.properties = "驾驶员";
						}else if(selectedObj.properties=="2"){
							selectedObj.properties = "装卸管理人员";
						}else if(selectedObj.properties=="3"){
							selectedObj.properties = "押运员";
						}
						
						$("#epNameList option").each(function(){
			    			if($(this).val()==selectedObj.epNo){
			    				selectedObj.epName = $(this).text();
			    			}
			    		});
						
						$("#provinceList option").each(function(){
			    			if($(this).val()==selectedObj.provinceNo){
			    				selectedObj.provinceNo = $(this).text();
			    			}
			    		});
						$("#cityList option").each(function(){
							var ids = $(this).val();
							var idArr = ids.split("_");
			    			if(idArr[0]==selectedObj.cityNo){
			    				selectedObj.cityNo = $(this).text();
			    			}
			    		});
						$("#empStates option").each(function(){
			    			if($(this).val()==selectedObj.empState){
			    				selectedObj.empState = $(this).text();
			    				//alert($(this).text());
			    			}
			    		});
						$("#streetList option").each(function(){
			    			if($(this).val()==selectedObj.street){
			    				selectedObj.street = $(this).text();
			    			}
			    		});
						$(tr).after(format4(selectedObj));
						$(obj).attr("class","shouqi col-sm-1 col-md-1");
					}else{
						$("#emptr_"+selectedObj.id).toggle();
					}
					if($("#emptr_"+selectedObj.id).is(":visible")){
						$(obj).attr("class","shouqi col-sm-1 col-md-1");
					}else{
						$(obj).attr("class","zhankai col-sm-1 col-md-1");
					}
				});
				
			}
		}

 /* 拓展行 */
    function format2(d) {
    	d.icLicence = d.icLicence==null?"":d.icLicence;
    	d.corcontact = d.corcontact==null?"":d.corcontact;
        return '<tr id="eptr_'+d.id+'"><td colspan="9"><table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;width:100%;" class="table table-striped table-bordered table-hover dataTables-example dataTable">' +
              '<tr>' +
                '<td style="width:20%;text-align:right;">业户名称:</td>' +
               '<td>'+d.epName+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="text-align:right;">经营地址:</td>' +
                '<td>'+d.address+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="text-align:right;">经营范围:</td>' +
                '<td>'+d.scopeName+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="text-align:right;">道路运输经营许可证号:</td>' +
                '<td>'+d.tpLicence+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="text-align:right;">工商营业执照号:</td>' +
                '<td>'+d.icLicence+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="text-align:right;">法定代表人:</td>' +
                '<td>'+d.corporation+'</td>' +
            '</tr>' +
            '<tr>' +
	            '<td style="text-align:right;">法定代表人联系方式:</td>' +
	            '<td>'+d.corcontact+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="text-align:right;">业务联系人:</td>' +
                '<td>'+d.businessor+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="text-align:right;">业务联系人联系方式:</td>' +
                '<td>'+d.contact+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="text-align:right;">所属镇街:</td>' +
                '<td>'+d.cityNo+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="text-align:right;">企业状态:</td>' +
                '<td>'+d.epState+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="text-align:right;">企业附件信息:</td>' +
                '<td><a href="#" class="btn btn-primary" data-toggle="modal" onclick="enterpriseAnnex('+d.id+')">查看详情</a></td>' +
            '</tr>' +
            '<tr>' +
                '<td style="text-align:right;">企业监管信息:</td>' +
                '<td><a href="#" class="btn btn-primary" data-toggle="modal" onclick="enterpriseRegulate('+d.id+')">查看详情</a>&nbsp;<a href="#" class="btn btn-primary" data-toggle="modal" onclick="getZip('+d.id+',\'1\',\''+d.epName+'\')">下载全部附件</a></td>' +
            '</tr>' +
        '</table></td></tr>';
    }//20170112
function format3(e) {
		e.engineNo = e.engineNo==null?"":e.engineNo;
		e.engineStyle = e.engineStyle==null?"":e.engineStyle;

		var regDate = new Date(e.regDate);
		var regYear = regDate.getFullYear();
		var regMonth = regDate.getMonth();
		var regDay = regDate.getDate();

		regDate = "";
		if(!(regYear == 1970 && regMonth == 0 && regDay == 1 )) {
			regDate = toDate(regYear,regMonth,regDay);
		}

		var scrapDate = new Date(e.scrapDate);
		var scrapYear = scrapDate.getFullYear();
		var scrapMonth = scrapDate.getMonth();
		var scrapDay = scrapDate.getDate();

		scrapDate = "";
		if(!(scrapYear == 1970 && scrapMonth == 0 && scrapDay == 1 )) {
			scrapDate = toDate(scrapYear,scrapMonth,scrapDay);
		}

		// e.regDate = e.regDate==null?"":e.regDate;
		// e.scrapDate = e.scrapDate==null?"":e.scrapDate;
        return '<tr  id="cartr_'+e.id+'"><td colspan="9"><table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;" class="table table-striped table-bordered table-hover dataTables-example dataTable">' +
              '<tr>' +
                '<td>车牌号:</td>' +
               '<td>'+e.carNo+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">车牌颜色:</td>' +
                '<td>'+e.carColor+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">业户名称:</td>' +
                '<td>'+e.epName+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">道路运输证号:</td>' +
                '<td>'+e.transportNo+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">经营范围:</td>' +
                '<td>'+e.scopeName+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">车辆类别:</td>' +
                '<td>'+e.carTypeName+'</td>' +
            '</tr>' +
            '<tr>' +
	            '<td style="width:20%;text-align:right;">品牌型号:</td>' +
	            '<td>'+e.brandNo+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">车架号:</td>' +
                '<td>'+e.vin+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">发动机号:</td>' +
                '<td>'+e.engineNo+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">发动机型号:</td>' +
                '<td>'+e.engineStyle+'</td>' +
            '</tr>' +
            '<tr>' +
	   	 		'<td style="width:20%;text-align:right;">车辆状态:</td>' +
	    		'<td>'+e.carState+'</td>' +
			'</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">行驶证注册日期:</td>' +
                '<td>'+regDate+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">强制报废日期:</td>' +
                '<td>'+scrapDate+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">车辆附件信息:</td>' +
                '<td><a href="#" class="btn btn-primary" data-toggle="modal" onclick="carUpload('+e.id+')">查看详情</a>&nbsp;<a href="#" class="btn btn-primary" data-toggle="modal" onclick="getZip('+e.id+',\'2\',\''+e.carNo+'\')">下载全部附件</a></td>' +
            '</tr>' +
        '</table></td></tr>';
    }//20170112
function format4(f) {
		f.carTypeName = f.carTypeName==null?"":f.carTypeName;
		f.driveDate = f.driveDate==null?"":f.driveDate;
		f.certificateDate =f.certificateDate==null?"":f.certificateDate;
		f.checkinDate = f.checkinDate==null?"":f.checkinDate;
		// var properties = f.properties;
		var properties="";
		if(f.properties=="驾驶员"){
				properties="驾驶员";
		}else{
				properties="非驾驶员";
		}
        return '<tr  id="emptr_'+f.id+'"><td colspan="11"><table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;" class="table table-striped table-bordered table-hover dataTables-example dataTable">' +
              '<tr>' +
                '<td style="width:20%;text-align:right;">姓名:</td>' +
               '<td>'+f.name+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">人员属性:</td>' +
               '<td>'+f.properties+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">身份证号:</td>' +
                '<td>'+f.identityNo+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">联系电话:</td>' +
                '<td>'+f.phone+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">户籍所在省:</td>' +
                '<td>'+f.provinceNo+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">户籍所在市:</td>' +
                '<td>'+f.cityNo+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">企业名称:</td>' +
                '<td>'+f.epName+'</td>' +
            '</tr>' +
            '<tr>' +
	            '<td style="width:20%;text-align:right;">镇街:</td>' +
	            '<td>'+f.street+'</td>' +
	        '</tr>' +
            '<tr>' +
	            '<td style="width:20%;text-align:right;">从业资格证号:</td>' +
	            '<td>'+f.certificateNo+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">从业资格类别:</td>' +
                '<td>'+f.empTypeName+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">准驾车型:</td>' +
                '<td>'+f.carTypeName+'</td>' +
            '</tr>' +
	    	'<tr>' +
	   	 		'<td style="width:20%;text-align:right;">人员状态:</td>' +
	    		'<td>'+f.empState+'</td>' +
			'</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">初领从业资格证时间:</td>' +
                '<td>'+f.certificateDate+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">初领驾驶证日期:</td>' +
                '<td>'+f.driveDate+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">入职时间:</td>' +
                '<td>'+f.checkinDate+'</td>' +
            '</tr>' +
            '<tr>' +
                '<td style="width:20%;text-align:right;">人员附件信息:</td>' +
                '<td><a href="#" class="btn btn-primary" data-toggle="modal" onclick="empAnnexInfo('+f.id+',\''+properties+'\')">查看详情</a>&nbsp;<a href="#" class="btn btn-primary" data-toggle="modal" onclick="getZip('+f.id+',\'3\',\''+f.name+'\')">下载全部附件</a></td>' +
            '</tr>' +
        '</table></td></tr>';
    }//20170112
    
    //201701批量下载全部附件
    function getZip(id,type,name){
    	if(confirm("是否要下载全部附件？")){
    		window.location.href="${ctx}/downLoadZipFile?entityId="+id+"&entityType="+type+"&downloadName="+name;
    	}
    }

	//企业附件信息
	function format11(g,typeId) {
		var str ='<tr>' +
	        	'<td>'+g.fileName+'</td>' +
	            '<td>'+g.deadLine+'</td>' +
	            '<td>'+g.uploadTime+'</td>' +
	            '<td><a href="/dgtransport'+g.fileUrl+'" target="_blank" class="label label-primary colorbox-button" onclick="onlineLook()" style="margin-right:5px;margin-bottom:5px;">预览</a><a href="#" class="label label-primary colorbox-button" onclick="downloadEpLicene('+g.id+')"  style="margin-right:5px;margin-bottom:5px;">下载</a><a href="#" class="label label-danger" style="margin-bottom:5px;" onclick="deleteAnnux('+g.id+','+typeId+',\'ep\')" >删除</a></td>' +
	        	'</tr>' ;
	        return str;
	}

	//企业监管信息 20161228
	function format12(f) {
		var str ='<tr>' +
	        	'<td>'+f.fileName+'</td>' +
	            '<td>'+f.uploadTime+'</td>' +
	            '<td><a href="<c:url value="resources'+f.fileUrl+'"/>" class="label label-success" style="margin-bottom:5px;">下载</a></td>' +
	        '</tr>';
		return str;
	}
	//车辆附件信息 120161228
	function carAdjunctFormat(h,typeId) {
		var str ='<tr>' +
	        	'<td>'+h.fileName+'</td>' +
	            '<td>'+h.deadLine+'</td>' +
	            '<td>'+h.uploadTime+'</td>' +
	            '<td><a href="/dgtransport'+h.fileUrl+'" target="_blank" class="label label-primary colorbox-button" onclick="onlineLook()" style="margin-right:5px;margin-bottom:5px;">预览</a><a href="#" class="label label-primary colorbox-button" onclick="downloadEpLicene('+h.id+')"  style="margin-right:5px;margin-bottom:5px;">下载</a><a href="#" class="label label-danger" style="margin-bottom:5px;" onclick="deleteAnnux('+h.id+','+typeId+',\'car\')" >删除</a></td>' +
	        '</tr>';
	    return str;    
	}
	//人员附件信息
	//20161228
    function peopleAdjunctFormat(i,typeId) {
		var str =  '<tr>' +
            	'<td>'+i.fileName+'</td>' +
                '<td>'+i.deadLine+'</td>' +
                '<td>'+i.uploadTime+'</td>' +
                '<td><a href="/dgtransport'+i.fileUrl+'" target="_blank" id="look" class="label label-primary colorbox-button" onclick="onlineLook()" style="margin-right:5px;margin-bottom:5px;">预览</a><a href="#" class="label label-primary colorbox-button" onclick="downloadEpLicene('+i.id+')"  style="margin-right:5px;margin-bottom:5px;">下载</a><a href="#" class="label label-danger" style="margin-bottom:5px;" onclick="deleteAnnux('+i.id+','+typeId+',\'emp\')" >删除</a></td>' +
            '</tr>';
        return str;    
    }
	</script>
	<script>
    function checkAll2() {
        if ($(".checkAll2").is(':checked')) {
            $(".checkbox2").prop("checked", true);
        } else {
            $(".checkbox2").removeAttr("checked");
        }
    }	
    function checkAll3() {
        if ($(".checkAll3").is(':checked')) {
            $(".checkbox3").prop("checked", true);
        } else {
            $(".checkbox3").removeAttr("checked");
        }
    }	
    function checkAll4() {
        if ($(".checkAll4").is(':checked')) {
            $(".checkbox4").prop("checked", true);
        } else {
            $(".checkbox4").removeAttr("checked");
        }
    }	
    function checkAll5() {
        if ($(".checkAll5").is(':checked')) {
            $(".checkbox5").prop("checked", true);
        } else {
            $(".checkbox5").removeAttr("checked");
        }
    }	
	</script>
	
	<script type="text/javascript">
		
		function iniSearch(name){
			if(name=="enterprise"){
				searchByKey("searchForm");
			}else if(name=="car"){
				searchByKey("carForm");
			}else if(name=="emp"){
				searchByKey("empForm");
			}
		}
		
		$(document).ready(function(){
			$("#selxz").change(function(){
				var val = $(this).val();
				addproperty = val;
				if(val=="0"){
					$("#add_manager").hide();
					$("#add_driver").hide();
					$("#add_stevedorer").hide();
				}
				if(val=="1")
				{
					$("#driver_pro").attr("value",val);
					$("#add_driver").show();
					$("#add_stevedorer").hide();
					$("#add_manager").hide();
				}
				if(val=="2")
				{
					$("#manager_pro").attr("value",val);
					$("#add_manager").show();
					$("#add_driver").hide();
					$("#add_stevedorer").hide();
				}
				if(val=="3")
				{
					$("#stevedorer_pro").attr("value",val);
					$("#add_stevedorer").show();
					$("#add_manager").hide();
					$("#add_driver").hide();
				}
			});
			
			$("#enterpriseExport").click(function(){
				var ids = "";
				$(".checkbox2").each(function (index){
					if(this.checked==true){
						ids +=this.value+",";
					}
				});
				var url = "${ctx}/sys/enterpriseXls?enterpriceIds="+ids+"&"+$("#searchForm").serialize();
				window.location.href=url;
			});
			
			$("#enterpriseModelExport").click(function(){
				var url = "${ctx}/sys/enModelXls";
				window.location.href=url;
			});
			
			
			$("#carExport").click(function(){
				var ids = "";
				$(".checkbox3").each(function (index){
					if(this.checked==true){
						ids +=this.value+",";
					}
				});
				var url = "${ctx}/sys/carXls?carIds="+ids+"&"+$("#carForm").serialize();
				window.location.href=url;
			});
			
			$("#carModelExport").click(function(){
				var url = "${ctx}/sys/carModelXls";
				window.location.href=url;
			});
			
			
			$("#employeeExport").click(function(){
				var ids = "";
				$(".checkbox4").each(function (index){
					if(this.checked==true){
						ids +=this.value+",";
					}
				});
				var url = "${ctx}/sys/employeeXls?employeeIds="+ids+"&"+$("#empForm").serialize();
				window.location.href=url;
			});
			
			$("#employeeModelExport").click(function(){
				var url = "${ctx}/sys/empModelXls";
				window.location.href=url;
			});
			
			var carurl="${ctx}/sys/carSearch";
			var carformData = $("#carForm").serialize();
			$("#example3").dataTable({
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
				"sAjaxSource": carurl, 
				"fnServerData" : function(sSource, aoData, fnCallback) {
					sSource = sSource+"?iDisplayStart="+aoData[3].value+"&iDisplayLength="+aoData[4].value+"&sEcho="+aoData[0].value;
					$.ajax({
						"type" : 'post',
						"url" : sSource,
						"dataType" : "json",
						"data" : carformData,
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
		    				return '<a class="label label-warning" data-toggle="modal" onclick="updateToEntity('+data+',\'car\'),carChange()"><i class="fa fa-edit"></i>修改</a>';
		    			}
				    },
				    {"mData":"show",
				    	"mRender": function (data, type, full) {
			    			return "<input type='button' class='zhankai col-sm-1 col-md-1' style='border:0px;' onclick='detail("+data.id+",this,\"car\")'></input>";
			    		}
				    }
					]
				 
			});
			
			var empurl="${ctx}/sys/employeeSearch";
			var empformData = $("#empForm").serialize();
			$("#example4").dataTable({
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
				"sAjaxSource": empurl, 
				"fnServerData" : function(sSource, aoData, fnCallback) {
					sSource = sSource+"?iDisplayStart="+aoData[3].value+"&iDisplayLength="+aoData[4].value+"&sEcho="+aoData[0].value;
					$.ajax({
						"type" : 'post',
						"url" : sSource,
						"dataType" : "json",
						"data" : empformData,
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
								html += "装卸管理人员";
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
		    				return '<a class="label label-warning" data-toggle="modal" onclick="updateToEntity('+data+',\'emp\'),employeeChange()"><i class="fa fa-edit"></i>修改</a>';
		    			}
				    },
				    {"mData":"show",
				    	"mRender": function (data, type, full) {
			    			return "<input type='button' class='zhankai col-sm-1 col-md-1' style='border:0px;' onclick='detail("+data[6]+",this,\"emp\")'></input>";
			    		}
				    }
					]
				 
			});
			searchByKey("searchForm");
			
		});
		
		
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>
<script type="text/javascript">
	//var epId = "";
	function searchByKey(formName){
		var url = "";
		var formData = "";
		if(formName=="searchForm"){
			$("#enterpriceTab").tab('show');
			url="${ctx}/sys/enterpriceSearch";
			formData = $("#searchForm").serialize();
			
			$("#example2").dataTable({//企业列表
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
			    			return '<a class="label label-warning" data-toggle="modal" onclick="updateToEntity('+data+',\'enterprise\'),epChange()"><i class="fa fa-edit"></i>修改</a>';
			    		}
				    },
				    {"mData":"show",
				    	"mRender": function (data, type, full) {
			    			return "<input type='button' class='zhankai col-sm-1 col-md-1' style='border:0px;' onclick='detail("+data.id+",this,\"enterprise\")'></input>";
			    		}
				    }
					]
				 
			});
		}else if(formName=="carForm"){//车辆列表
			$("#carTab").tab('show');
			url="${ctx}/sys/carSearch";
			formData = $("#carForm").serialize();
			$("#example3").dataTable({
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
		    				return '<a class="label label-warning" data-toggle="modal" onclick="updateToEntity('+data+',\'car\'),carChange()"><i class="fa fa-edit"></i>修改</a>';
		    			}
				    },
				    {"mData":"show",
				    	"mRender": function (data, type, full) {
			    			return "<input type='button' class='zhankai col-sm-1 col-md-1' style='border:0px;' onclick='detail("+data.id+",this,\"car\")'></input>";
			    		}
				    }
					]
				 
			});
		}else if(formName=="empForm"){//人员列表
			$("#empTab").tab('show');
			var cityNo = $("#empSearchCityNo").val();
			url="${ctx}/sys/employeeSearch";
			formData = $("#empForm").serialize();
			$("#example4").dataTable({
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
					var urls = "";
					if(cityNo!=null&&cityNo!=0){
						urls = "&cityNo="+cityNo;
					}
					sSource = sSource+"?iDisplayStart="+aoData[3].value+"&iDisplayLength="+aoData[4].value+"&sEcho="+aoData[0].value+urls;
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
								html += "装卸管理人员";
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
		    				return '<a class="label label-warning" data-toggle="modal" onclick="updateToEntity('+data+',\'emp\'),employeeChange()"><i class="fa fa-edit"></i>修改</a>';
		    			}
				    },
				    {"mData":"show",
				    	"mRender": function (data, type, full) {
			    			return "<input type='button' class='zhankai col-sm-1 col-md-1' style='border:0px;' onclick='detail("+data[6]+",this,\"emp\")'></input>";
			    		}
				    }
					]
				 
			});
		}
	}
	//保存信息
	function saveEntity(name,opt){
		var data;
		var url;
		if(name=="enterprise"){
			if(opt=="save"){
				url = "${ctx}/sys/enterpriceSave";
				data = $("#enterSaveForm").serialize();
				alert(1);
			}else if(opt=="upd"){
				url = "${ctx}/sys/enterpriceUpd";
				data = $("#updEnterpriseForm").serialize();
			}else if(opt=="del"){
				url="${ctx}/sys/enterpriceUpd";
			}
		}else if(name=="car"){
			if(opt=="save"){
				url = "${ctx}/sys/carSave";	
				data = $("#carSaveForm").serialize();
			}else if(opt=="upd"){
				url = "${ctx}/sys/carUpd";
				data = $("#carUpdForm").serialize();
			}
		}else if(name=="emp"){
			if(opt=="save"){
				if(addproperty=="1"){
					data = $("#driverSaveForm").serialize();
				}else if(addproperty=="2"){
					data = $("#managerSaveForm").serialize();
				}else if(addproperty=="3"){
					data = $("#stevedorerSaveForm").serialize();
				}
				url = "${ctx}/sys/employeeSave";
			}else if(opt=="upd"){
				if(properties=="1"){
					url = "${ctx}/sys/employeeUpd";
					data = $("#empUpdateForm").serialize();	
				}else if(properties=="2"){
					url = "${ctx}/sys/employeeUpd";
					data = $("#managerUpdateForm").serialize();
				}else if(properties=="3"){
					url = "${ctx}/sys/employeeUpd";
					data = $("#stevedorerUpdateForm").serialize();
				}
			}
			
		}
		
		$.post(url,data,function(data){
			hideButton();
			if(data.msg=="success"){
				alert("保存成功");	
				if(name=="enterprise"){
					searchByKey("searchForm");	
				}else if(name=="car"){
					searchByKey("carForm");
				}else if(name=="emp"){	
					searchByKey("empForm");
				}

				var searchEpNameValForEmp = $("#empForm").find("input[name=epName]").val();
				var searchEpNameValForCar = $("#carForm").find("input[name=epName]").val();
				emptyFn();
				$("#empForm").find("input[name=epName]").val(searchEpNameValForEmp);
				$("#carForm").find("input[name=epName]").val(searchEpNameValForCar);
				//保留企业
				
				
			}else{
				alert("保存失败,请检查是否漏填");
			}
		});
	}
	
	//删除信息
	function AdminDel(name){	
		var ids = "";
		var data;
		var url;
		if(name=="en"){
		$(".checkbox2").each(function (index){
			if(this.checked==true){
				ids +=this.value+",";
			}
		});
		url = "${ctx}/sys/enDelete?ids="+ids;
		}
		else if(name=="car"){
			
			$(".checkbox3").each(function (index){
				if(this.checked==true){
					ids +=this.value+",";
				}
			});
			url = "${ctx}/sys/carDelete?ids="+ids;
		}
		else if(name=="emp"){			
			$(".checkbox4").each(function (index){
			if(this.checked==true){
				ids +=this.value+",";
			} 
		});
			url = "${ctx}/sys/empDelete?ids="+ids;
		}
		
		if(ids==""||ids==null){
			alert("请选择删除项");
			return;
		}

	    if(confirm("确认删除么？")){
	    	
		    $.post(url,data,function(data){
			
			if(data.msg=="success"){
				alert("删除成功");	
				if(name=="en"){
					searchByKey("searchForm");	
				}else if(name=="car"){
					searchByKey("carForm");
				}else if(name=="emp"){
					searchByKey("empForm");
				}	
			}else{
				alert("删除失败！请联系管理员");
			}
		    });
		}
	 }
	
	
	function emptyFn(){//关闭清空
		$("input").val("");


		$(".input-sm").val("0").selected = true; 
		$("#add_manager").hide();
		$("#add_driver").hide();
		$("#add_stevedorer").hide(); 
		getCarColor();
		getCarState();
		getEmpState();
		getEpName();
		getProvince();
		getCity();
		getStreet();
		getEpState();
	}
	//更新信息
	function updateToEntity(id,name){
		var url = "";
		var data = {"id":id};
		if(name=="enterprise"){
			url = "${ctx}/sys/enterpriceToupd";
		}else if(name=="car"){
			url = "${ctx}/sys/carToupd";
		}else if(name=="emp"){
			url = "${ctx}/sys/employeeToupd";
		}
		$.get(url,data,function(data){
			
			if(name=="enterprise"){
				getEnterpriseInfo(data);
				$("#enChangeForm").modal('show');
			}else if(name=="car"){
				getCarInfo(data);
				$("#carChangeForm").modal('show');
			}else if(name=="emp"){
				getEmpInfo(data);
				$("#empChangeForm").modal('show');
			}
		});
		
	}
	//切换tab
	function changeTab(obj){
		var name = obj.id;
		if(name=="enterpriceTab"){
			searchByKey("searchForm");
		}else if(name=="carTab"){
			searchByKey("carForm");
		}else if(name=="empTab"){
			searchByKey("empForm");
		}
	}
	//企业更新页面信息
	function getEnterpriseInfo(data){
		$("#ep_id").val(data.id);
		$("#ep_Addno").val(data.epNo);
		$("#ep_name").val(data.epName);
		$("#ep_address").val(data.address);
		$("#ep_scopeNo").val(data.scopeName);
		$("#ep_tpLicence").val(data.tpLicence);
		$("#ep_icLicence").val(data.icLicence);
		$("#ep_corporation").val(data.corporation);
		$("#ep_corcontact").val(data.corcontact);
		$("#ep_businessor").val(data.businessor);
		$("#ep_contact").val(data.contact);
		$("#ep_cityNo option[value='"+data.cityNo+"']").attr("selected",true);
		$("#en_enState option[value='"+data.epState+"']").attr("selected",true);
	}
	//车辆更新页面信息
	function getCarInfo(data){
		var regDate = new Date(data.regDate);
		var scrapDate = new Date(data.scrapDate);
		$("#car_id").val(data.id);
		$("#car_carNo").val(data.carNo);
		//alert(data.carColor);
		$("#car_carColor option[value='"+data.carColor+"']").attr("selected",true);
		$("#car_epNo option[value='"+data.epNo+"']").attr("selected",true);
		//alert(data.epName);
		$("#car_epName").val(data.epName);
		$("#car_transportNo").val(data.transportNo);
		$("#car_scopeName").val(data.scopeName);
		$("#car_carType").val(data.carTypeName);
		$("#car_brandNo").val(data.brandNo);
		$("#car_vin").val(data.vin);
		$("#car_engineNo").val(data.engineNo);
		//alert(data.engineStyle);
		$("#car_engineStyle").val(data.engineStyle);
		//alert(data.carState);
		$("#car_carState option[value='"+data.carState+"']").attr("selected",true);

		var regYear = regDate.getFullYear();
		var regMonth = regDate.getMonth();
		var regDay = regDate.getDate();

		var regDateVal = "";
		 if(!(regYear == 1970 && regMonth == 0 && regDay == 1 )) {
		 	regDateVal = toDate(regDate.getFullYear(),regDate.getMonth(),regDate.getDate());
		 }
		// if(regYear != 1970){
		// 	if(regMonth!=01){
		// 		if (regDay!=1) {
		// 			regDateVal = toDate(regDate.getFullYear(),regDate.getMonth(),regDate.getDate());
		// 		}
		// 	}
		// }
		$("#car_regDate").val(regDateVal);

		var scrapYear =scrapDate.getFullYear();
		var scrapMonth =scrapDate.getMonth();
		var scrapDay =scrapDate.getDate();
		var scrapDateVal = "";
		if(!(scrapYear == 1970 && scrapMonth == 0 && scrapDay == 1)) {
			scrapDateVal = toDate(scrapDate.getFullYear(),scrapDate.getMonth(),scrapDate.getDate());
		}
		$("#car_scrapDate").val(scrapDateVal);
	}
	//关闭人员页面
	function hideButton(){
		$("#driver").hide();
		$("#manager").hide();
		$("#stevedorer").hide();
	}
	//日期转换
	function toDate(year,month,day){
		month=parseInt(month)+1;
		if((parseInt(month)+1)<parseInt(10)){
			month = "0"+month;
		}
		return year+"-"+month+"-"+day;
	};
	//人员更新页面
	function getEmpInfo(data){
		properties = data.properties;
		var certificateDate = new Date(data.certificateDate);
		var driverDate = new Date(data.driveDate);
		var checkinDate = new Date(data.checkinDate);
		var html = "<option value='0'>请选择</option>";
		for(var i=0;i<cityArr.length;i++){
			var json = cityArr[i];
			if(json.provinceNo==data.provinceNo){
				html +="<option value='"+json.id+"'>"+json.cityName+"</option>";
			}
		}
		if(properties=="1"){//驾驶员
			$("#emp_id").val(data.id);
			$("#emp_properties").val(data.properties);
			$("#emp_name").val(data.name);
			//$("#emp_epName option[value='"+data.epName+"']").attr("selected",true);
			
			$("#emp_identityNo").val(data.identityNo);
			$("#emp_phone").val(data.phone);
			$("#emp_provinceNo option[value='"+data.provinceNo+"']").attr("selected",true);
			$("#emp_cityNo").html(html);
			$("#emp_cityNo option[value='"+data.cityNo+"']").attr("selected",true);
			$("#emp_epNo option[value='"+data.epNo+"']").attr("selected",true);
			$("#emp_certificateNo").val(data.certificateNo);
			$("#emp_empType").val(data.empTypeName);
			$("#emp_carTpye").val(data.carTypeName);
			//alert(data.empState);
			$("#emp_empState option[value='"+data.empState+"']").attr("selected",true);
	
			var checkinYear4 = certificateDate.getFullYear();
			var checkinMonth4 = certificateDate.getMonth();
			var checkinDay4 = certificateDate.getDate();
			var certificateDateVal = "";
			if(!isNaN(checkinYear4) && !isNaN(checkinMonth4) && !isNaN(checkinDay4)) {
 				certificateDateVal = toDate(certificateDate.getFullYear(),certificateDate.getMonth(),certificateDate.getDate());
			}
			$("#emp_certificateDate").val(certificateDateVal);
			
			var checkinYear5 = driverDate.getFullYear();
			var checkinMonth5 = driverDate.getMonth();
			var checkinDay5 = driverDate.getDate();
			var driveDateVal = "";
			if(!isNaN(checkinYear5) && !isNaN(checkinMonth5) && !isNaN(checkinDay5)) {
 				driveDateVal = toDate(driverDate.getFullYear(),driverDate.getMonth(),driverDate.getDate());
			}
			$("#emp_driveDate").val(driveDateVal); 
			
			var checkinYear_6 = checkinDate.getFullYear();
			var checkinMonth_6 = checkinDate.getMonth();
			var checkinDay_6 = checkinDate.getDate();
			var checkinDateVal = "";
			if(!isNaN(checkinYear_6) && !isNaN(checkinMonth_6) && !isNaN(checkinDay_6)) {
 				checkinDateVal = toDate(checkinDate.getFullYear(),checkinDate.getMonth(),checkinDate.getDate());
			}
			$("#emp_checkinDate").val(checkinDateVal);
			$("#driver").show();
		}else if(properties=="2"){//管理员
			$("#manager_id").val(data.id);
			$("#manager_properties").val(data.properties);	
			
			$("#manager_name").val(data.name);
			$("#manager_identityNo").val(data.identityNo);
			$("#manager_phone").val(data.phone);
			$("#manager_provinceNo option[value='"+data.provinceNo+"']").attr("selected",true);
			$("#manager_cityNo").html(html);
			$("#manager_cityNo option[value='"+data.cityNo+"']").attr("selected",true);
			$("#manager_epNo option[value='"+data.epNo+"']").attr("selected",true);//2016-12-15修改
			//$("#manager_epName option[value='"+data.epName+"']").attr("selected",true);
			$("#manager_certificateNo").val(data.certificateNo);//2016-12-15修改
			$("#manager_empType").val(data.empTypeName);//2016-12-15修改
			$("#manager_empState option[value='"+data.empState+"']").attr("selected",true);
			
			var checkinYear_2 = certificateDate.getFullYear();
			var checkinMonth_2 = certificateDate.getMonth();
			var checkinDay_2 = certificateDate.getDate();
			var certificateDateVal = "";
			if(!isNaN(checkinYear_2) && !isNaN(checkinMonth_2) && !isNaN(checkinDay_2)) {
 				certificateDateVal = toDate(certificateDate.getFullYear(),certificateDate.getMonth(),certificateDate.getDate());
			}
			$("#manager_certificateDate").val(certificateDateVal);
			
			var checkinYear_3 = checkinDate.getFullYear();
			var checkinMonth_3 = checkinDate.getMonth();
			var checkinDay_3 = checkinDate.getDate();
			var checkinDateVal = "";
			if(!isNaN(checkinYear_3) && !isNaN(checkinMonth_3) && !isNaN(checkinDay_3)) {
 				checkinDateVal = toDate(checkinDate.getFullYear(),checkinDate.getMonth(),checkinDate.getDate());
			}
			$("#manager_checkinDate").val(checkinDateVal);			
			$("#manager").show();
		}else if(properties=="3"){//押运员
			$("#stevedorer_id").val(data.id);
			$("#stevedorer_properties").val(data.properties);	
			$("#stevedorer_name").val(data.name);
			$("#stevedorer_identityNo").val(data.identityNo);
			$("#stevedorer_phone").val(data.phone);
			$("#stevedorer_provinceNo option[value='"+data.provinceNo+"']").attr("selected",true);
			$("#stevedorer_cityNo").html(html);
			$("#stevedorer_cityNo option[value='"+data.cityNo+"']").attr("selected",true);
			
			$("#stevedorer_epNo option[value='"+data.epNo+"']").attr("selected",true);
			//$("#stevedorer_epName option[value='"+data.epName+"']").attr("selected",true);
			$("#stevedorer_certificateNo").val(data.certificateNo);
			$("#stevedorer_empType").val(data.empTypeName);
			$("#stevedorer_empState option[value='"+data.empState+"']").attr("selected",true);

			var checkinYear_1 = certificateDate.getFullYear();
			var checkinMonth_1 = certificateDate.getMonth();
			var checkinDay_1 = certificateDate.getDate();
			var certificateDateVal = "";
			if(!isNaN(checkinYear_1) && !isNaN(checkinMonth_1) && !isNaN(checkinDay_1)) {
 				certificateDateVal = toDate(certificateDate.getFullYear(),certificateDate.getMonth(),certificateDate.getDate());
			}
			$("#stevedorer_certificateDate").val(certificateDateVal);
			
			var checkinYear = checkinDate.getFullYear();
			var checkinMonth = checkinDate.getMonth();
			var checkinDay = checkinDate.getDate();
			var checkinDateVal = "";
			if(!isNaN(checkinYear) && !isNaN(checkinMonth) && !isNaN(checkinDay)) {
 				checkinDateVal = toDate(checkinDate.getFullYear(),checkinDate.getMonth(),checkinDate.getDate());
			}
			$("#stevedorer_checkinDate").val(checkinDateVal);
			$("#stevedorer").show();
		}
	}
 	//显示导入文件路径
 	//企业附件
	$('input[id=tpLicenceFile]').change(function(){
 		$('#tpLicenceOptUp').html($(this).val())
 	})
 	$('input[id=icLicenceFile]').change(function(){
 		$('#icLicenceOptUp').html($(this).val())
 	})
 	$('input[id=saveLicence]').change(function(){
 		$('#saveLicenceOptUp').html($(this).val())
 	})
 	$('input[id=emergencyLicence]').change(function(){
 		$('#emergencyOptUp').html($(this).val())
 	})
 	//企业监管
 	$('input[id=monthYLRecoder]').change(function(){
 		$('#monthYLUp').html($(this).val())
 	})
 	$('input[id=monthXCRecoder]').change(function(){
 		$('#monthXCUp').html($(this).val())
 	})
 	$('input[id=seasonXCRecorder]').change(function(){
 		$('#seasonXCUp').html($(this).val())
 	})
 	//车辆附件
 	$('input[id=tranLicence]').change(function(){
 		$('#tranOptUp').html($(this).val())
 	})
 	$('input[id=carLicence]').change(function(){
 		$('#carOptUp').html($(this).val())
 	})
 	$('input[id=carRegLicence]').change(function(){
 		$('#carRegOptUp').html($(this).val())
 	})
 	$('input[id=insurance]').change(function(){
 		$('#insuranceOptUp').html($(this).val())
 	})
 	$('input[id=environmentTag]').change(function(){
 		$('#environmentOptUp').html($(this).val())
 	})
 	$('input[id=GPS]').change(function(){
 		$('#GPSOptUp').html($(this).val())
 	})
	$('input[id=GPSInstall]').change(function(){
		$('#GPSInstallOptUp').html($(this).val())
	})
	$('input[id=specialReport]').change(function(){
		$('#specialReportOptUp').html($(this).val())
	})
	$('input[id=oilCastList]').change(function(){
		$('#oilCastListOptUp').html($(this).val())
	})
 	//人员附件
 	$('input[id=identity]').change(function(){
 		$('#identityOptUp').html($(this).val())
 	})
 	$('input[id=certificateNo]').change(function(){
 		$('#certificateNoOptUp').html($(this).val())
 	})
 	$('input[id=driverLincene]').change(function(){
 		$('#driverLinceneOptUp').html($(this).val())
 	})
 	$('input[id=contract]').change(function(){
 		$('#contractOptUp').html($(this).val())
 	})
 	
 	$("#enLead").on("click",function(){
 		$('input[id=epExcel]').change(function() {
 	        $('#enLeadFile').html($(this).val());
 	     });
 		$("#epImport").modal({backdrop: 'static', keyboard: false});
 	})
 	$("#carLead").on("click",function(){
 		$('input[id=carExcel]').change(function() {
 	        $('#carLeadFile').html($(this).val());
 	     });
 		$("#carImport").modal({backdrop: 'static', keyboard: false});
 	})
 	$("#empLead").on("click",function(){
 		$('input[id=employeeExcel]').change(function() {
 	        $('#empLeadFile').html($(this).val());
 	     });
 		$("#employeeImport").modal({backdrop: 'static', keyboard: false});
 	})
 	
 	//文件路径清空
 	function LeadFileEmpty(){
 		$(".input-large").html("");
 		$(".emptyFile").val("");
 	}
 	//企业导入
	function enterpriseExcelImport(){
		$.ajaxFileUpload({  
            url : "${ctx}/sys/epExcelImport",   
            secureuri : false,  
            fileElementId : 'epExcel', 
            dataType : 'JSON', //or json xml whatever you like~  
            success : function(data, status) {
            	var json = eval("("+data+")");
            	if(json.msg=="success"){
            		alert("导入成功");
            		searchByKey("searchForm");
            	}else{
            		alert(json.detail);
            	}
            	location.reload(true);
            } 
        });
		LeadFileEmpty();
	}
	//车辆导入
	function carExcelImport(){
		$.ajaxFileUpload({  
            url : "${ctx}/sys/carExcelImport",   
            secureuri : false,  
            fileElementId : 'carExcel', 
            dataType : 'JSON', //or json xml whatever you like~  
            success : function(data, status) {
            	var json = eval("("+data+")");
            	if(json.msg=="success"){
            		alert("导入成功");
            		searchByKey("carForm");
            	}else{
            		alert(json.detail);
            	}
            	location.reload(true);
            } 
        });
		LeadFileEmpty();
	}
	//人员导入
	function employeeExcelImport(){
		$.ajaxFileUpload({  
            url : "${ctx}/sys/employeeExcelImport",   
            secureuri : false,  
            fileElementId : 'employeeExcel', 
            dataType : 'JSON', //or json xml whatever you like~  
            success : function(data,status) {
            	var json = eval("("+data+")");
            	$("#employeeExcel").val("");
            	if(json.msg=="success"){
            		alert("导入成功");
            		searchByKey("empForm");
            	}else{
            		alert(json.detail);
            	}
            	location.reload(true);
            }
        });
		LeadFileEmpty();
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
		/*
		if(tpLicenceFile!=""&&checkName(tpLicenceFile,"道路运输经营许可证")){
			alert("上传文件名不是道路运输经营许可证");
			tpState = false;
			return;
		}*/
		if(tpLicenceFile!=""&&checkSuffix(tpLicenceFile,"jpg,png,pdf,JPG,PDF,PNG")){
			alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
			tpState = false;
			return;
		}
		/*if(icLicenceFile!=""&&$("#icDeadLine").val()==""){
			alert("请选择工商营业执照有效期");
			icState = false;
			return;
		}*/	
		/*
		if(icLicenceFile!=""&&checkName(icLicenceFile,"工商营业执照")){
			alert("上传文件名不是工商营业执照");
			icState = false;
			return;
		}*/
		if(icLicenceFile!=""&&checkSuffix(icLicenceFile,"jpg,png,pdf,JPG,PDF,PNG")){
			alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
			icState = false;
			return;
		}
		
		/*if(saveLicence!=""&&$("#saveDeadLine").val()==""){
			alert("请选择安全生产管理制度有效期");
			saveState = false;
			return;
		}*/
		/*
		if(saveLicence!=""&&checkName(saveLicence,"安全生产管理制度")){
			alert("上传文件名不是安全生产管理制度");
			saveState = false;
			return;
		}*/
		if(saveLicence!=""&&checkSuffix(saveLicence,"jpg,png,pdf,JPG,PDF,PNG")){
			alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
			saveState = false;
			return;
		}
		/*if(emergencyLicence!=""&&$("#emergencyDeadLine").val()==""){
			alert("请选择安全应急制度有效期");
			emerState = false;
			return;
		}*/
		/*
		if(emergencyLicence!=""&&checkName(emergencyLicence,"安全应急制度")){
			alert("上传文件名不是安全应急制度");
			emerState = false;
			return;
		}*/
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
	//关闭企业上传页面
	function hideLicence(obj){
		$("#addModal").modal('hide');
		iniEpUpload();
	}
	//初始化企业上传页面
	function iniEpUpload(){
		$("#epUpShow_1").html("");
		$("#epUpShow_2").html("");
		$("#epUpShow_3").html("");
		$("#epUpShow_4").html("");
		$(".validity").val("");
		$(".eplicence").val("");
		$(".input-large").html("");
		$("#emergencyOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#saveLicenceOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#icLicenceOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#tpLicenceOpt").attr("class","zhankai col-sm-1 col-md-1");
	}
	//代开企业上传页面
	function enterpriseAnnex(id){
		$("#epEntityId").attr("value",id);
		$('#addModal').modal({backdrop: 'static', keyboard: false});
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
			    			data[i].uploadTime = toDate(uploadTime.getFullYear(),uploadTime.getMonth(),uploadTime.getDate());
			    			//alert(data[i].deadLine);
			    			if(data[i].deadLine!=null&&data[i].deadLine!=""){
			    				var deadLine = new Date(data[i].deadLine);
			    				data[i].deadLine = toDate(deadLine.getFullYear(),deadLine.getMonth(),deadLine.getDate());
			    			}else{
			    				data[i].deadLine="";
			    			}

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
		$('#epRegulatoryInfo').modal({backdrop: 'static', keyboard: false});
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
		$(".emptyFile").val("");
		$(".input-large").html("");
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
		/*if(tranLicence!=""&&$("#tranlicenceDate").val()==""){
			alert("请选择道路运输证有效期");
			tranState = false;
			return;
		}*/
		/*
		if(tranLicence!=""&&checkName(tranLicence,"道路运输证")){
			alert("上传文件名不是道路运输证");
			tranState = false;
			return;
		}*/
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
		/*
		if(carLicence!=""&&checkName(carLicence,"机动车行驶证")){
			alert("上传文件名不是机动车行驶证");
			carLinState = false;
			return;
		}*/
		if(carLicence!=""&&checkSuffix(carLicence,"jpg,png,pdf,JPG,PDF,PNG")){
			alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
			carLinState = false;
			return;
		}
		/*if(carRegLicence!=""&&$("#carRegDate").val()==""){
			alert("请选择机动车登记证书有效期");
			carRegState = false;
			return;
		}*/
		/*
		if(carRegLicence!=""&&checkName(carRegLicence,"机动车登记证书")){
			alert("上传文件名不是机动车登记证书");
			carRegState = false;
			return;
		}*/
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
		/*
		if(insurance!=""&&checkName(insurance,"承运人责任险")){
			alert("上传文件名不是承运人责任险");
			insuranState = false;
			return;
		}*/
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
		/*
		if(environmentTag!=""&&checkName(environmentTag,"环保标志")){
			alert("上传文件名不是环保标志");
			environState = false;
			return;
		}*/
		if(environmentTag!=""&&checkSuffix(environmentTag,"jpg,png,pdf,JPG,PDF,PNG")){
			alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
			environState = false;
			return;
		}
		/*if(GPS!=""&&$("#GPSDate").val()==""){
			alert("请选择GPS接入证明有效期");
			GPSState = false;
			return;
		}*/
		/*
		if(GPS!=""&&checkName(GPS,"GPS接入证明")){
			alert("上传文件名不是GPS接入证明");
			GPSState = false;
			return;
		}*/
		/*if(GPSInstall!=""&&$("#GPSInstallDate").val()==""){
		 alert("请选择GPS安装证明有效期");
		 GPSInstallState = false;
		 return;
		 }*/
		/*
		 if(GPSInstall!=""&&checkName(GPSInstall,"GPS安装证明")){
		 alert("上传文件名不是GPS安装证明");
		 GPSInstallState = false;
		 return;
		 }*/
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
			    			
			    			data[i].uploadTime = toDate(uploadTime.getFullYear(),uploadTime.getMonth(),uploadTime.getDate());
			    			if(data[i].deadLine!=null&&data[i].deadLine!=""){
			    				var deadLine = new Date(data[i].deadLine);
			    				data[i].deadLine = toDate(deadLine.getFullYear(),deadLine.getMonth(),deadLine.getDate());
			    			}else{
			    				data[i].deadLine="";
			    			}
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
		$("#carUpShow_18").html("");
		$("#carUpShow_19").html("");
		$("#carUpShow_20").html("");

		$(".validity").val("");
		$(".emptyFile").val("");
		$(".input-large").html("");
		$("#GPSOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#GPSInstallOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#specialReportOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#oilCastListOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#environmentOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#insuranceOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#carRegOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#carOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#tranOpt").attr("class","zhankai col-sm-1 col-md-1");
	}
	//显示人员附件页面
	function empAnnexInfo(id,properties){
		$("#empEntityId").attr("value",id);
		
		if(properties!="驾驶员") {
        	$(".driverLinceneSection").hide();
        } else {
        	$(".driverLinceneSection").show();
        }
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
		
		/*if(identity!=""&&$("#identityDate").val()==""){
			alert("请选择身份证有效期");
			identityState = false;
			return;
		}*/
		/*
		if(identity!=""&&checkName(identity,"身份证")){
			alert("上传文件名不是身份证");
			identityState = false;
			return;
		}*/
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
		/*
		if(certificateNo!=""&&checkName(certificateNo,"从业资格证")){
			alert("上传文件名不是从业资格证");
			certificateNoState = false;
			return;
		}*/
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
		/*
		if(driverLincene!=""&&checkName(driverLincene,"驾驶证")){
			alert("上传文件名不是驾驶证");
			driverLinceneState = false;
			return;
		}*/
		if(driverLincene!=""&&checkSuffix(driverLincene,"jpg,png,pdf,JPG,PDF,PNG")){
			alert("请选择jpg、JPG或png、PNG图片或pdf、PDF上传");
			driverLinceneState = false;
			return;
		}
		/*if(contract!=""&&$("#contractDate").val()==""){
			alert("请选择劳动合同有效期");
			contractState = false;
			return;
		}*/
		/*
		if(contract!=""&&checkName(contract,"劳动合同")){
			alert("上传文件名不是劳动合同");
			contractState = false;
			return;
		}*/
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
			    			if(data[i].deadLine!=null&&data[i].deadLine!=""){
			    				var deadLine = new Date(data[i].deadLine);
			    				data[i].deadLine = toDate(deadLine.getFullYear(),deadLine.getMonth(),deadLine.getDate());
			    			}else{
			    				data[i].deadLine="";
			    			}
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
		$(".emptyFile").val("");
		$(".input-large").html("");
		$("#identityOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#certificateNoOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#driverLinceneOpt").attr("class","zhankai col-sm-1 col-md-1");
		$("#contractOpt").attr("class","zhankai col-sm-1 col-md-1");
	}
	//下载附件
	function downloadEpLicene(id){
		window.location.href="${ctx}/sys/download?id="+id;
	}

	//预览附件 20161228 {width:800, height:600}
	function onlineLook(){
		 // media();
	}
	
	//获取待办通知
	function getTaskInfo(tab,id){
		$(tab).tab('show');
		var data = {"entityType":id};
		var url = "${ctx}/getEpTask";
		$.ajax({ 
			type : "post",
			url : url,
			data : data,
			async : false,
			success:function(data){
				var html ='';
				$.each(data.list,function(num,obj){
						var s= obj[1];
						var total = obj[0];
						var taskName = obj[2];
						var str = "";
						if(s==0)
						{
							str="未上传";
						}
						else if(s==3)
						{	
							str="即将过期";
						}
						else if(s==4)
						{	
							str="已经过期";
						}
						var recordHtml = "";
						if(id=="1"){
							recordHtml = '<a href="#" style="color: black;text-decoration: none;"><span class="record" onclick="getTaskDetail('+s+',\''+taskName+'\',\'ept\')">'+total+'家企业'+taskName+'</span></a>';
						}else if(id=="2"){
							recordHtml = '<a href="#" class="record" style="color: black;text-decoration: none;" onclick="getTaskDetail('+s+',\''+taskName+'\',\'car\')"><span class="record">'+total+'辆汽车'+taskName+'</span></a>';
						}else if(id=="3"){
							recordHtml = '<a href="#" class="record" style="color: black;text-decoration: none;" onclick="getTaskDetail('+s+',\''+taskName+'\',\'emp\')"><span class="record">'+total+'个人员'+taskName+'</span></a>';
						}
						 html +='<div class="feed-activity clearfix">'+
						'<div class="pull-left">'+recordHtml+
						'<p style="margin-top:5px;margin-bottom:0px;">'+
						'<i class="fa fa-clock-o"></i>'+
						'<abbr class="timeago" title="1分钟之前" >1分钟之前</abbr></p>'+
						'</div>'+
						'<p class="pull-right">'+
						'<span class="label label-danger arrow-in-right">'+str+'</span>'+
						'</p>'+
						' </div>';
						
				});
				if(id=="1"){
					$("#epNum").text(data.size);
				}else if(id=="3"){
					$("#empNum").text(data.size);
				}else if(id=="2"){
					$("#carNum").text(data.size);
				}
				if(data.size==0){
					html += '<p class="text-center" style="font-size:18px;">没有相关记录</p>'
					$("#epTaskDiv").find(".scroller").html(html);
					$("#carTaskDiv").find(".scroller").html(html);
					$("#empTaskDiv").find(".scroller").html(html);
				}else{
					$("#epTaskDiv").find(".scroller").html(html);
					$("#carTaskDiv").find(".scroller").html(html);
					$("#empTaskDiv").find(".scroller").html(html);
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
		
		/* $("#epAddForm").modal('show'); */
		$('#epAddForm').modal({backdrop: 'static', keyboard: false});//点击灰色或按esc不能关闭模态框
	}
	function carAdd(){
		$('#carAddForm').modal({backdrop: 'static', keyboard: false});
	}
	function employeeAdd(){
		$('#empAddForm').modal({backdrop: 'static', keyboard: false});
	}
	function epChange(){
		$('#enChangeForm').modal({backdrop: 'static', keyboard: false});
	}
	function carChange(){
		$('#carChangeForm').modal({backdrop: 'static', keyboard: false});
	}
	function employeeChange(){
		$('#empChangeForm').modal({backdrop: 'static', keyboard: false});
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
	
	//获取人员状态
	function getEmpState(){
		var html = getSelectHtml($("#empStates option"));
		//alert(html);
		$("#driverState").html(html);
		$("#managerState").html(html);
		$("#stevedorerState").html(html);
		$("#managerState").html(html);//2016-12-15修改
		$("#emp_empState").html(html);
		$("#manager_empState").html(html);
		$("#empState").html(html);
		$("#stevedorer_empState").html(html);
		$("#manager_empState").html(html);//2016-12-15修改
	}
	//获取公司名
	function getEpName(){
		var html = getSelectHtml($("#epNameList option"));
		$("#epNo").html(html);
		$("#car_epNo").html(html);
		$("#driverEpNo").html(html);
		$("#stevedorerepNo").html(html);
		$("#managerepNo").html(html);//2016-12-15修改
		$("#emp_epNo").html(html);
		$("#stevedorer_epNo").html(html);
		$("#manager_epNo").html(html);//2016-12-15修改
	}
	//选择公司
	function changeEpName(obj,name){
		var epName = $(obj).find("option:selected").text();
		$("#"+name).attr("value",epName);
	}
	
	function getProvince(){
		var html = getSelectHtml($("#provinceList option"));
		$("#driverProvince").html(html);
		$("#managerProvince").html(html);
		$("#stevedorerProvince").html(html);
		$("#emp_provinceNo").html(html);
		$("#manager_provinceNo").html(html);
		$("#stevedorer_provinceNo").html(html);
	}
	
	function getCity(){
		
		if(cityArr.length == 0){
			$("#cityList option").each(function(){
				var ids = $(this).val();
				var idArr = ids.split("_");
				var cityMap = {"id":idArr[0],"cityName":$(this).text(),"provinceNo":idArr[1]};
				cityArr.push(cityMap);
			});
		}
	}
	function changeCity(obj,name){
		var id = obj.value;
		var html = "<option value='0'>请选择</option>";
		for(var i=0;i<cityArr.length;i++){
			var json = cityArr[i];
			if(json.provinceNo==id){
				html +="<option value='"+json.id+"'>"+json.cityName+"</option>";
			}
		}
		$("#"+name).html(html);
	}
	
	function deleteAnnux(id,typeId,name){
		var url = "${ctx}/sys/deleteAnnux";
		var data = {"id":id};
		$.post(url,data,function(data){
			if(confirm("你确定要删除？")){
				if(data.msg=="success"){
					alert("删除成功");
					if(name=="ep"){
						$("#epUpShow_"+typeId).html("");
						$("#epUp_"+typeId).html("");
						getLicenceFile(typeId,epLicence);	
					}else if(name=="car"){
						$("#carUp_"+typeId).html("");
						$("#carUpShow_"+typeId).html("");
						getCarUpload(typeId,carAnnux);
					}else if(name=="emp"){
						$("#empUpShow_"+typeId).html("");
						$("#empUp_"+typeId).html("");
						getEmpUpload(typeId,empAnnux);
					}
				}else{
					alert("删除失败，请联系管理员");
				}
			}else{
				return;
			}
			
		});
	}
	function validateIdentityNo(obj,name){
		var url = "${ctx}/sys/validateIdentityNo";
		var data = {"identityNo":obj.value};
		$.post(url,data,function(data){
			if(data.msg!=null&&data.msg!=""){
				alert(data.msg);
				$("#"+name).focus();
			}
		});
	}
	
	function getTaskDetail(state,taskName,name){
		var url = "";
		if(name=="ept"){
			url = "${ctx}/sys/epTask?state="+state+"&taskName="+taskName;
		}else if(name=="car"){
			url = "${ctx}/sys/carTask?state="+state+"&taskName="+taskName;
		}else if(name=="emp"){
			url = "${ctx}/sys/empTask?state="+state+"&taskName="+taskName;
		}
		url = encodeURI(url);
		window.location.href = url;
	}
	$.ajaxSetup({
		type: 'POST',
		complete: function(xhr,status) {
		var sessionStatus = xhr.getResponseHeader('sessionstatus');
		if(sessionStatus == 'timeout') {
			var top = getTopWinow();
			var yes = confirm('由于您长时间没有操作, session已过期, 请重新登录.');
			if (yes) {
				top.location.href = '${ctx}/index.jsp';            
			}
			}
		}
	});
	function getTopWinow(){
	     var p = window;
	     while(p != p.parent){
	         p = p.parent;
	     }
	     return p;
	 }
</script>
<script>
function toLoadByAuthority(){
	var authorityList='<%=session.getAttribute("authorityList")%>';
	authorityList=authorityList.substring(1,authorityList.length-1).trim().split(",");
	var authority=null;
	for(var i=0;i<authorityList.length;i++){
		authority="#"+authorityList[i].trim();
		$(authority).css('display','');		
	};	
}
toLoadByAuthority();
</script> 