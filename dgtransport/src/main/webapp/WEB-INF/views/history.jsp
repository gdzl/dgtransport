<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<title>危运行业档案管理系统——详情页</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
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
 		width:600px;
 	}
 	.ui-button{
 		border:none;
		margin-right:0;
 	}
	 h1,h2,h3,h4,h5,h6,a{
 		font-family: "微软雅黑" !important;
 	}
     body{
		font-family: "微软雅黑";
	}
    </style>
</head>
<body>
	<section id="page">
		<div class="frame-content">
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<div class="row">
							<div class="col-sm-12">
								<div class="page-header">
									<ul class="breadcrumb">
										<li>
											<i class="fa fa-home"></i>
											<a href="###">首页</a>
										</li>
										<li>
											<a href="###">危运行业档案管理</a>
										</li>
										<li>
											办理流程记录
										</li>
									</ul>
									<div class="clearfix">
										<h3 class="content-title pull-left">危运行业档案管理</h3>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<!-- BOX -->
								<div class="box border blue">
									<div class="box-title">
										<h4><i class="fa fa-columns"></i><span class="hidden-inline-mobile">办理流程记录</span></h4>
									</div>
									<div class="box-body">
										<div>
										  <div class="tab-content">
											 <div class="tab-pane fade in active" id="box_tab1">
											 	<div class="col-sm-12">
											 		<form class="form-horizontal" role="form" id="searchForm">
														<div class="form-group">
														<label class="col-md-2 control-label">开始时间</label>
														<div class="col-sm-4">
														  <input class="form-control" id="inputEmail10" type="text" name="begOptDate" placeholder="请选择开始时间">
														</div>
														<label class="col-sm-2 control-label">结束时间</label>
														<div class="col-sm-4">
														  <input class="form-control" id="inputEmail11" type="text" name="endOptDate" placeholder="请选择结束时间">
														</div>
													    </div>
													    <div class="form-group">
															<div class="col-md-6 col-md-offset-1">
																<a class="btn btn-info" onclick="searchByKey()"><i class="fa fa-search"></i>搜索</a>
																<!-- <a href="#" class="btn btn-primary" ><i class="fa fa-share"></i>导出</a> -->
															</div>
													    </div>
												</form>
											 	</div>
												<table id="example2" cellpadding="0" cellspacing="0" border="0" width="100%" class="display datatable table table-striped table-bordered table-hover">
											        <thead>
											            <tr>
											            	<th class="text-center"><input type="checkbox" class="checkAll2" onchange="checkAll2()"></th>
											                <th>办理人</th>
											                <th class="hidden-xs">操作时间</th>
											                <th class="hidden-xs">操作内容</th>
											                <th>修改IP</th>
											                <th>访问的地方</th>
											            </tr>
											        </thead>
											 		<tbody>
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
						<div class="footer-tools">
							<span class="go-top">
								<i class="fa fa-chevron-up"></i> Top
							</span>
						</div>
					</div><!-- /CONTENT-->
				</div>
			</div>
		</div>
		</div>
		</div>
	</section>
	<script src="<c:url value='/resources/js/jquery/jquery-2.0.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js'/>"></script>
	<script src="<c:url value='/resources/bootstrap-dist/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.form.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.MultiFile.js'/>"></script>
	<script src="<c:url value='/resources/js/ajaxfileupload.js'/>"></script>	
	<script src="<c:url value='/resources/js/bootstrap-daterangepicker/moment.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap-daterangepicker/daterangepicker.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-BlockUI/jquery.blockUI.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-Cookie/jquery.cookie.min.js'/>"></script>
	<script type="text/javascript" language="javascript" src="<c:url value='/resources/js/datatables2/js/jquery.dataTables.min.js'/>"></script>
	<script type="text/javascript" language="javascript" src="<c:url value='/resources/js/datatables2/js/dataTables.bootstrap.js'/>"></script>
	<script src="<c:url value='/resources/js/script3.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/tween.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/formvalidation-dist/js/formValidation.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/formvalidation-dist/js/language/zh_CN.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/formvalidation-dist/js/framework/bootstrap.js'/>"></script>
	<script>
	var table2;
		jQuery(document).ready(function() {		
			App.setPage("tabs_accordions");  //Set current page
			App.init(); //Initialise plugins and elements
			$("#inputEmail10").datepicker({dateFormat:'yy-mm-dd'});
			$("#inputEmail11").datepicker({dateFormat:'yy-mm-dd'});
			searchByKey();
		});

	</script>
	<script>
    function checkAll2() {
        if ($(".checkAll2").is(':checked')) {
            $(".checkbox2").prop("checked", true);
        } else {
            $(".checkbox2").removeAttr("checked");
        }
    }
    function toDate(year,month,day,hour,mins,sec){
    	if(parseInt(month)<parseInt(10)){
			month = parseInt(month)+1;
			month = "0"+month;
		}
    	if(parseInt(mins)<parseInt(10)){
    		mins = "0"+mins;
		}
    	if(parseInt(hour)<parseInt(10)){
    		hour = "0"+hour;
		}
    	if(parseInt(sec)<parseInt(10)){
    		sec = "0"+sec;
		}
		return year+"-"+month+"-"+day+"  "+hour+":"+mins+":"+sec;
	};
    function searchByKey(){
    	var url = "";
		var formData = "";
    	url="${ctx}/sys/historySearch";
    	formData = $("#searchForm").serialize();
    	$("#example2").dataTable({
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
			"iDisplayLength" : 100,// 每页显示行数
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
			    		return "<input type='checkbox' class='checkbox2' value="+data+">";
			    	},
			    	"sClass": "text-center"
			    },
			    {"mData":"userName"},
			    {"mData":"optDate","sClass": "hidden-xs",
			    	"mRender": function (data, type, full) {
			    		var optDate = new Date(data);
			    		return toDate(optDate.getFullYear(),optDate.getMonth(),optDate.getDate(),optDate.getHours(),optDate.getMinutes(),optDate.getSeconds());
		    		}
			    },
			    {"mData":"optContent","sClass": "hidden-xs"
			    },
			    {"mData":"ipAddress","sClass": "hidden-xs"
			    },
			    {"mData":"systemName"}
			]
		});
    	
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
 	
</body>
</html>