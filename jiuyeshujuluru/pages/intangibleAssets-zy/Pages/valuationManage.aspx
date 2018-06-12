<%@ Page Language="C#" AutoEventWireup="true"%>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>一乙酒业</title>
        <!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Force IE9 to render in normal mode -->
        <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
        <meta name="author" content="Hanooch" />
        <meta name="description" content="一乙酒业中无形资产数据录入界面"
        />
        <meta name="keywords" content="社会评价"
        />
        <meta name="application-name" content="一乙酒文化数据库" />
        <!-- Import google fonts - Heading first/ text second -->
        <link rel='stylesheet' type='text/css' /> 
        <!--[if lt IE 9]>

        <![endif]-->
        <!-- Css files -->
        <!-- Icons -->
        <link href="assets/css/icons.css" rel="stylesheet" />
        <!-- jQueryUI -->
        <link href="assets/css/sprflat-theme/jquery.ui.all.css" rel="stylesheet" />
        <!-- Bootstrap stylesheets (included template modifications) -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- Plugins stylesheets (all plugin custom css) -->
        <link href="assets/css/plugins.css" rel="stylesheet" />
        <!-- Main stylesheets (template main css file) -->
        <link href="assets/css/main.css" rel="stylesheet" />
        <!-- Custom stylesheets ( Put your own changes here ) -->
        <link href="assets/css/custom.css" rel="stylesheet" />
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/img/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/img/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/img/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/img/ico/apple-touch-icon-57-precomposed.png">
        <link rel="icon" href="assets/img/ico/favicon.ico" type="image/png">
        <!-- Windows8 touch icon ( http://www.buildmypinnedsite.com/ )-->
        <meta name="msapplication-TileColor" content="#3399cc" />
	    <script charset="utf-8" src="editor/lang/zh_CN.js"></script>
          <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
        <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
        <%--<style>
            /* Border styles */
                #table-1 thead, #table-1 tr {
                border-top-width: 1px;
                border-top-style: solid;
                border-top-color: rgb(230, 189, 189);
                }
                #table-1 {
                border-bottom-width: 1px;
                border-bottom-style: solid;
                border-bottom-color: rgb(230, 189, 189);
                }

                /* Padding and font style */
                #table-1 td, #table-1 th {
                padding: 5px 10px;
                font-size: 14px;
                font-family: Verdana;
                color: rgb(177, 106, 104);
                text-align:center;
                }

                /* Alternating background colors */
                #table-1 tr:nth-child(even) {
                background: rgb(238, 211, 210)
                }
                #table-1 tr:nth-child(odd) {
                background: #FFF
                }
        </style>--%>
    </head>
<body>
     <!-- Start #header -->
        <div id="header">
            <div class="container-fluid">
                <div class="navbar">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">
                            <i class="im-windows8 text-logo-element animated bounceIn"></i><span class="text-logo">一乙</span><span class="text-slogan">酒业</span> 
                        </a>
                    </div>
                </div>              
            </div>
        </div>
		<!-- End #header -->
        <!-- Start #sidebar -->
        <div id="sidebar">
            <!-- Start .sidebar-inner -->
            <div class="sidebar-inner">
                <!-- Start #sideNav -->
                <ul id="sideNav" class="nav nav-pills nav-stacked">
                    <li><a href="../../historyManage.aspx">企业历史管理 <i class="im-screen"></i></a>
                    </li>
                    <li><a href="../../sizeManage.aspx">企业规模管理<i class="st-chart"></i></a>
                    </li>
                    <li>
                        <a href="../../YIYI/operation/operationMange.aspx"> 经营状况管理 <i class="im-paragraph-justify"></i></a>                      
                    </li>
					<li><a href="../../YIYI/operation/sectorMange.aspx"><i class="im-images"></i> 分行业数据管理</a>
                    </li>
                    <li><a href="../../YIYI/operation/areaMange.aspx"><i class="st-diamond"></i> 分地区数据管理 </a>
                    </li>
                    <li><a href="../../yiyijiuye/pages/productMan.aspx"> 产品系列管理 <i class="im-table2"></i></a>
                    </li>
                    <li><a href="../../yiyijiuye/pages/riMan.aspx"> 科研投入管理 <i class="st-lab"></i></a>
                    </li>
                    <li><a href="assetsManage.aspx"><i class="ec-mail"></i> 无形资产管理</a>
                    </li>
                    <li><a href="valuationManage.aspx" class="waves-effect active"><i class="en-upload"></i> 社会评价管理</a>
                    </li>
                    <li><a href="../../history.aspx">数据录入<i class="im-screen"></i></a>
                    </li>
                    <li><a href="../../RankSystem/Rank.aspx">排名系统<i class="st-chart"></i></a>
                    </li>
                </ul>
            </div>
            <!-- End .sidebar-inner -->
        </div>
        <!-- End #sidebar -->
        <!-- Start #content -->
   <div id="content">
            <!-- Start .content-wrapper -->
            <div class="content-wrapper">
                <div class="row">
                    <!-- Start .row -->
                    <!-- Start .page-header -->
                    <div class="col-lg-12 heading">
                        <h1 class="page-header"><i class="im-screen"></i> 一乙酒业大数据</h1>
                        <!-- Start .bredcrumb -->
                        <ul id="crumb" class="breadcrumb">
                        </ul>
                        <!-- End .breadcrumb -->
                        <!-- Start .option-buttons -->
                        
                        <!-- End .option-buttons -->
                    </div>
                    <!-- End .page-header -->
                </div>
                <!-- End .row -->
                <div class="outlet">
                    <!-- Start .outlet -->
                    <!-- Page start here ( usual with .row ) -->
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- col-lg-6 start here -->
                            <div class="panel panel-primary toggle">
                                <!-- Start .panel -->
                                <div class="panel-heading">
                                    <h4 class="panel-title"><i class="im-wand"></i> 社会评价录入项管理</h4>
				    <div  style="float:right;margin-top:5px">
                                          <input class="form-control" type="button" value="搜索" onclick="searchValuation()">      
                                    </div>
                                    <div class="col-lg-2" style="float:right;margin-top:5px;">
                                         <input id="searchValuation" class="form-control" type="text" placeholder="请输入搜索内容" >                                        
                                    </div>
                                </div>
                                <div class="panel-body" id="valuationDiv">
                                  
                                    <table id="table-1" class="table table-striped" style="table-layout: fixed;"> <!-- Replace "table-1" with any of the design numbers -->
                                      <thead>
                                        <th style="text-align:center;">企业名称</th>
                                        <th colspan="2" style="text-align:center;">专家问卷调查(德尔菲法)</th>
                                        <th colspan="2" style="text-align:center;">消费者问卷调查</th>
                                        <th style="text-align:center;">录入时间</th>                                                                     
                                        <th colspan="2" style="text-align:center;">操作</th>
                                       </thead>
                                       <tbody id="valuationtr" style="text-align:center;">
                                            </tbody>
                                       </table>
                                </div>
                            </div>
                            <!-- End .panel -->
                        </div>
                        <!-- col-lg-6 end here -->
                        <!-- col-lg-6 end here -->
                    </div>
                    <!-- Page End here -->
                </div>
                <!-- End .outlet -->
            </div>
            <!-- End .content-wrapper -->
            <div class="clearfix"></div>
      </div>
       <script src="../JS/valuationManage.js"></script>
       <script src="../JS/search.js"></script>
    </body>
</html>

