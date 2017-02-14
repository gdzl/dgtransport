<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<title>危运行业档案管理系统——统计分析页</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/cloud-admin.css'/>" >
	<link rel="stylesheet" type="text/css"  href="<c:url value='/resources/css/themes/default.css" id="skin-switcher'/>" >
	<link rel="stylesheet" type="text/css"  href="<c:url value='/resources/css/responsive.css'/>" >
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">
	<style type="text/css">
	 h1,h2,h3,h4,h5,h6,a{
 		font-family: "微软雅黑" !important;
 	}
     body{
		font-family: "微软雅黑";
	}
    </style>
</head>
<body>
	<select style="display:none" id="streetList">
		<c:forEach items="${streetList}" var ="list">
			<option value="${list.id}">${list.streetName}</option>
		</c:forEach>
	</select>
	<section id="page">
		
		<div class="frame-content">
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
											<a href="###">危运行业档案管理</a>
										</li>
										<li>
											统计分析
										</li>
									</ul>
									<!-- /BREADCRUMBS -->
									<div class="clearfix">
										<h3 class="content-title pull-left">统计分析</h3>
									</div>
									<!-- <div class="description">Tabs and Accordions</div> -->
								</div>
							</div>
						</div>
						<!-- /PAGE HEADER -->
						<div class="col-md-12">
						<!-- DONUT PIE -->
							<div class="box border blue">
								<div class="box-title">
									<h4><i class="fa fa-adjust"></i>危运企业分布</h4>
								</div>
								<div class="box-body">
									<div class="row">
										<div class="col-md-12">
											<div id="container"></div>
										</div>
									</div>
								</div>
							</div>
						<!-- /DONUT PIE -->
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
			
	</section>
</body>
	<script src="<c:url value='/resources/js/jquery/jquery-2.0.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js'/>"></script>
	<script src="<c:url value='/resources/bootstrap-dist/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.form.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.MultiFile.js'/>"></script>
	<script src="<c:url value='/resources/js/ajaxfileupload.js'/>"></script>	
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-BlockUI/jquery.blockUI.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/jQuery-Cookie/jquery.cookie.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/script3.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/hightchat/highcharts.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/hightchat/modules/exporting.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/hightchat/modules/data.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/hightchat/modules/drilldown.js'/>"></script>
    <script>
		jQuery(document).ready(function() {		
			App.setPage("tjfx");  //Set current page
			App.init(); //Initialise plugins and elements
			Highcharts.setOptions({
                lang: {
                    printChart: "打印图表",
                    downloadJPEG: "下载JPEG 图片",
                    downloadPDF: "下载PDF文档",
                    downloadPNG: "下载PNG 图片",
                    downloadSVG: "下载SVG 矢量图",
                    exportButtonTitle: "导出图片",
                    resetZoom: "还原视图",
                    months: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
                    shortMonths: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
                    weekdays: ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日']

                }
            });
			var dataTmp = "";
			$.post("${ctx}/sys/getEpTotal","",function(data){
				dataTmp = "[{name: '镇街',colorByPoint: true,data:[";
				$(data).each(function(){
					dataTmp +=dataTmp==""?"{name:'"+this.name+"',y:"+this.total+"}":"{name:'"+this.name+"',y:"+this.total+"}," ;
				});
				dataTmp = dataTmp.substring(0,dataTmp.length-1);
				dataTmp +="]}]";
				piechat(dataTmp);
			});
		});
		function piechat(dataTmp) {
            //var chart;
            $('#container').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: '危运企业分布'
                },
                subtitle: {
                    text: ''
                },
                plotOptions: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    series: {
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}: {point.y}'
                        }
                    },
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: false
                        },
                        showInLegend: true
                    }
                },

                tooltip: {
                    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b> <br/>'
                },
                series: eval("("+dataTmp+")"),
               
            });
        }
	</script>
</html>